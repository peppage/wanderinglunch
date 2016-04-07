package updator

import (
	"net/url"
	"os"
	"regexp"
	"strings"
	"time"
	mdl "wanderinglunch/model"
	"wanderinglunch/setting"

	"github.com/ChimeraCoder/anaconda"
	log "github.com/Sirupsen/logrus"
	"github.com/jasonlvhit/gocron"
)

var consumerKey = os.Getenv("TWIT_CON_KEY")
var consumerSecret = os.Getenv("TWIT_CON_SEC")
var accessToken = os.Getenv("TWIT_ACCESS_TOKEN")
var accessTokenSecret = os.Getenv("TWIT_ACCESS_SECRET")
var api *anaconda.TwitterApi

func Start() {
	anaconda.SetConsumerKey(consumerKey)
	anaconda.SetConsumerSecret(consumerSecret)
	api = anaconda.NewTwitterApi(accessToken, accessTokenSecret)

	if setting.RunUpdator {
		gocron.Every(15).Minutes().Do(task)

		<-gocron.Start()
	}
}

func task() {
	log.Debug("Task Started")

	twitnames, err := mdl.GetTwitNames()
	if err != nil {
		log.WithError(err).Error("Failed to get all trucks from database")
		return
	}

	locations, err := mdl.GetLocations()
	if err != nil {
		log.WithError(err).Error("Failed to get all locations from database")
		return
	}

	subs, err := mdl.GetSubs()
	if err != nil {
		log.WithError(err).Error("Failed to get all subs from database")
		return
	}

	for site, names := range twitnames {
		for _, v := range names {
			uv := url.Values{}
			uv.Set("screen_name", v)
			uv.Set("include_rts", "0")
			uv.Set("count", "100")
			tweets, err := api.GetUserTimeline(uv)
			if err != nil {
				log.WithFields(log.Fields{
					"err":      err,
					"twitname": v,
				}).Error("Failed to get tweets")
			}

			go saveTweets(v, tweets)

			go findLocations(tweets, locations[site], subs)
		}
	}

	log.Debug("Task Finished")
}

func saveTweets(handle string, tweets []anaconda.Tweet) {
	for _, t := range tweets {
		time, _ := t.CreatedAtTime()
		t.Text = strings.Replace(t.Text, "&amp;", "&", -1)
		t.Text = strings.Replace(t.Text, "#", "", -1)
		t.Text = strings.Replace(t.Text, "\"", "", -1)
		err := mdl.SaveTweet(mdl.Tweet{
			Text:      t.Text,
			Time:      time.Unix(),
			ID:        t.Id,
			Retweeted: t.Retweeted,
			Twitname:  handle,
		})
		if err != nil {
			log.WithFields(log.Fields{
				"err":      err,
				"tweetID":  t.Id,
				"twitname": handle,
			}).Error("Failed to save tweet to database")
		}
	}
}

func findLocations(tweets []anaconda.Tweet, locations []*mdl.Location, subs []*mdl.Sub) {
	foundLocs := []int{}
	twitName := ""
	var newestTime int64
	for _, t := range tweets {
		createdTime, _ := t.CreatedAtTime()
		if createdTime.After(time.Now().Add(time.Hour * -8)) {
			text := t.Text
			for _, s := range subs {
				r, _ := regexp.Compile(s.Regex)
				text = r.ReplaceAllString(text, s.Replacement)
			}
			for _, l := range locations {
				matched, _ := regexp.MatchString(l.Matcher, strings.ToLower(text))
				if matched {
					twitName = strings.ToLower(t.User.ScreenName)
					newestTime = createdTime.Unix()
					foundLocs = append(foundLocs, l.ID)
				}
			}
		}
	}
	if len(foundLocs) > 0 {
		log.WithFields(log.Fields{
			"foundlocs": foundLocs,
			"twitname":  twitName,
		}).Debug("Locations have been found")
		err := mdl.UpdateLocs(twitName, foundLocs, newestTime)
		if err != nil {
			log.WithError(err).Error("Failed updated locations for trucK")
		}
	}
}
