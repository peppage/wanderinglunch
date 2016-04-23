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
	"github.com/peppage/foursquarego"
)

var consumerKey = os.Getenv("TWIT_CON_KEY")
var consumerSecret = os.Getenv("TWIT_CON_SEC")
var accessToken = os.Getenv("TWIT_ACCESS_TOKEN")
var accessTokenSecret = os.Getenv("TWIT_ACCESS_SECRET")
var clientID = os.Getenv("CLIENT_ID")
var clientSecret = os.Getenv("CLIENT_SECRET")
var api *anaconda.TwitterApi
var sqAPI *foursquarego.FoursquareApi

func Start() {
	anaconda.SetConsumerKey(consumerKey)
	anaconda.SetConsumerSecret(consumerSecret)
	api = anaconda.NewTwitterApi(accessToken, accessTokenSecret)

	sqAPI = foursquarego.NewFoursquareApi(clientID, clientSecret)

	if setting.RunUpdator {
		gocron.Every(15).Minutes().Do(task)
		gocron.Every(72).Hours().Do(validatePhotos)

		<-gocron.Start()

	}
}

func task() {
	log.Debug("Task Started")

	twitnames, err := mdl.GetTwitNames(false)
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
			text := doReplacements(strings.ToLower(t.Text), subs)
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
	tweets, err := mdl.GetTweets(twitname)
	if err != nil {
		return nil, err
	}

	subs, err := mdl.GetSubs()
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
	uv := url.Values{}
	uv.Set("limit", "200")
	sites, err := mdl.GetSites()
	if err != nil {
		log.WithError(err).Error("Failed getting sites, validatePhotos")
		return
	}
	for _, s := range sites {
		trucks, err := mdl.AllTrucks(s.Name)
		if err != nil {
			log.WithError(err).Error("Failed getting trucks, validatePhotos")
			return
		}
		for _, t := range trucks {
			images, err := mdl.GetImages(t.Twitname)
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
							mdl.UpdateImage(*i)
							break
						}
					}
				}
			}
		}
	}
}
