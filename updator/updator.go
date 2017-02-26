package updator

import (
	"net/http"
	"net/url"
	"regexp"
	"strings"
	"time"

	mdl "wanderinglunch/model"

	"wanderinglunch/settings"
	"wanderinglunch/store"

	"context"

	log "github.com/Sirupsen/logrus"
	"github.com/dghubble/go-twitter/twitter"
	"github.com/jasonlvhit/gocron"
	"github.com/peppage/foursquarego"
	"github.com/peppage/simpletransport/simpletransport"
	"golang.org/x/oauth2"
	"golang.org/x/oauth2/clientcredentials"
)

var api *twitter.Client
var sqAPI *foursquarego.FoursquareApi
var transport *simpletransport.ThrottleTransport

var data store.Store

func Start(d store.Store, set settings.Settings) {

	data = d

	transport = simpletransport.NewThrottleTransport(&simpletransport.ThrottleOptions{
		ConnectionTimeout: time.Second * 15,
		ReadTimeout:       time.Second * 10,
		RequestTimeout:    time.Second * 15,
		ThrottleRate:      time.Second,
		TotalTokens:       5,
	})

	httpThrottleClient := &http.Client{
		Transport: transport,
	}

	config := &clientcredentials.Config{
		ClientID:     set.TwitterConsumerKey(),
		ClientSecret: set.TwitterConsumerSecret(),
		TokenURL:     "https://api.twitter.com/oauth2/token",
	}

	ctx := context.WithValue(context.Background(), oauth2.HTTPClient, httpThrottleClient)
	httpClient := config.Client(ctx)

	api = twitter.NewClient(httpClient)
	sqAPI = foursquarego.NewFoursquareApi(set.FoursquareClientID(), set.FoursquareClientSecret())
	gocron.Every(15).Minutes().Do(task)
	gocron.Every(72).Hours().Do(validatePhotos)
	gocron.Every(1).Saturday().At("23:00").Do(truncateTweets)

	<-gocron.Start()

}

func task() {
	log.Info("Task Started")
	defer transport.Close()

	twitnames, err := data.GetTwitNames(false)
	if err != nil {
		log.WithError(err).Error("Failed to get all trucks from database")
		return
	}

	locations, err := data.GetLocations()
	if err != nil {
		log.WithError(err).Error("Failed to get all locations from database")
		return
	}

	subs, err := data.GetSubs()
	if err != nil {
		log.WithError(err).Error("Failed to get all subs from database")
		return
	}

	for site, names := range twitnames {
		retweets := false
		for _, v := range names {
			tweets, _, err := api.Timelines.UserTimeline(&twitter.UserTimelineParams{
				ScreenName:      v,
				IncludeRetweets: &retweets,
				Count:           100,
			})
			log.Debug("Got tweets for " + v)
			//tweets, err := api.GetUserTimeline(uv)
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

	log.Info("Task Finished")
}

func saveTweets(handle string, tweets []twitter.Tweet) {
	for _, t := range tweets {
		time, _ := time.Parse(time.RubyDate, t.CreatedAt)
		t.Text = strings.Replace(t.Text, "&amp;", "&", -1)
		t.Text = strings.Replace(t.Text, "#", "", -1)
		t.Text = strings.Replace(t.Text, "\"", "", -1)
		err := data.SaveTweet(&mdl.Tweet{
			Text:      t.Text,
			Time:      time.Unix(),
			ID:        t.ID,
			Retweeted: t.Retweeted,
			Twitname:  handle,
		})
		if err != nil {
			log.WithFields(log.Fields{
				"err":      err,
				"tweetID":  t.ID,
				"twitname": handle,
			}).Error("Failed to save tweet to database")
		}
	}
}

func findLocations(tweets []twitter.Tweet, locations []*mdl.Location, subs []*mdl.Sub) {
	foundLocs := []int{}
	twitName := ""
	var newestTime int64
	for _, t := range tweets {
		createdTime, _ := time.Parse(time.RubyDate, t.CreatedAt)
		if createdTime.After(time.Now().Add(time.Hour*-8)) && string(t.Text[0]) != "@" {
			text := doReplacements(strings.ToLower(t.Text), subs)
			text = strings.ToLower(text)
			if !strings.Contains(text, "tomorrow") && !strings.Contains(text, "schedule") && !strings.Contains(text, "cancelled") {
				for _, l := range locations {
					matched, _ := regexp.MatchString(l.Matcher, text)
					if matched {
						twitName = strings.ToLower(t.User.ScreenName)
						newestTime = createdTime.Unix()
						foundLocs = append(foundLocs, l.ID)
					}
				}
			}
		}
	}
	if len(foundLocs) > 0 {
		log.WithFields(log.Fields{
			"foundlocs": foundLocs,
			"twitname":  twitName,
		}).Debug("Locations have been found")
		err := data.UpdateLocs(twitName, foundLocs, newestTime)
		if err != nil {
			log.WithError(err).Error("Failed updated locations for trucK")
		}
	}
}

// Do all substitutions inside tweet text
func doReplacements(text string, subs []*mdl.Sub) string {
	for _, s := range subs {
		r, _ := regexp.Compile(s.Regex)
		text = r.ReplaceAllString(text, s.Replacement)
	}
	return text
}

//GetReplacedStrings gets subsituted text of latest tweets
func GetReplacedStrings(twitname string) ([]string, error) {
	replaced := []string{}
	tweets, err := data.GetTweets(twitname)
	if err != nil {
		return nil, err
	}

	subs, err := data.GetSubs()
	if err != nil {
		return nil, err
	}

	for _, t := range tweets {
		if t.CreatedAtTime().After(time.Now().Add(time.Hour * -8)) {
			text := doReplacements(strings.ToLower(t.Text), subs)
			replaced = append(replaced, text)
		}
	}
	return replaced, nil
}

func validatePhotos() {
	log.Info("Validate Photos start")
	uv := url.Values{}
	uv.Set("limit", "200")
	sites, err := data.GetSites()
	if err != nil {
		log.WithError(err).Error("Failed getting sites, validatePhotos")
		return
	}
	for _, s := range sites {
		trucks, err := data.AllTrucks(s.Name)
		if err != nil {
			log.WithError(err).Error("Failed getting trucks, validatePhotos")
			return
		}
		for _, t := range trucks {
			images, err := data.GetImages(t.Twitname)
			if err != nil {
				log.WithError(err).Error("Failed getting all images, validate photos")
				return
			}
			if t.Foursquare != "" {
				photos, err := sqAPI.GetVenuePhotos(t.Foursquare, uv)
				if err != nil {
					log.WithFields(log.Fields{
						"err":          err,
						"twitname":     t.Twitname,
						"foursquareid": t.Foursquare,
					}).Error("failed getting photos from 4sq")
					return
				}
				for _, i := range images {
					for _, p := range photos {
						if p.ID == i.ID {
							log.WithFields(log.Fields{
								"id":        i.ID,
								"twitname":  i.Twitname,
								"visiblity": p.Visibility,
							}).Debug("Updating image")
							i.Visibility = p.Visibility
							data.UpdateImage(i)
							break
						}
					}
				}
			}
		}
	}
	log.Info("Validate photos end")
}

func truncateTweets() {
	log.Info("Deleting old tweets")
	data.DeleteOldTweets()
}
