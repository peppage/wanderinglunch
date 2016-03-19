package updator

import (
	"net/url"
	"os"
	"regexp"
	"time"
	mdl "wanderinglunch/model"

	"github.com/ChimeraCoder/anaconda"
	log "github.com/Sirupsen/logrus"
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
	task()
	//gocron.Every(15).Minutes().Do(task)

	//<-gocron.Start()
}

func task() {
	// Get all trucks from DB
	// Get tweets for each unique twitter handle and store them
	// only search the last 8 hours of tweets
	// skip tweets that are a list of days
	// skip tweets that are for tomorrow
	// Replacements in tweets
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

			findLocations(tweets, locations[site])
		}
	}

	log.Debug("Task Finished")
}

func saveTweets(handle string, tweets []anaconda.Tweet) {
	for _, t := range tweets {
		time, _ := t.CreatedAtTime()
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

func findLocations(tweets []anaconda.Tweet, locations []*mdl.Location) {
	foundLocs := []int{}
	twitName := ""
	for _, t := range tweets {
		createdTime, _ := t.CreatedAtTime()
		if createdTime.After(time.Now().Add(time.Hour * -8)) {
			for _, l := range locations {
				matched, _ := regexp.MatchString(l.Matcher, strings.ToLower(text))
				if matched {
					log.WithField("Found tweet", t.Text).Debug("Matched")
					twitName = t.User.Name
					foundLocs = append(foundLocs, l.ID)
				}
			}
		}
	}
	log.WithField("foundlocs", foundLocs).Debug("End of find Locations")
	if len(foundLocs) > 0 {
		err := mdl.UpdateLocs(twitName, foundLocs)
		if err != nil {
			log.WithError(err).Error("Failed updated locations for trucK")
		}
	}
}
