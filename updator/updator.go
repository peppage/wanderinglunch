package updator

import (
	"net/url"
	"os"
	"strconv"
	mdl "wanderinglunch/model"

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

	gocron.Every(15).Minutes().Do(task)

	<-gocron.Start()
}

func task() {
	// Get all trucks from DB
	// Get tweets for each unique twitter handle and store them
	// only search the last 8 hours of tweets
	// skip tweets that are a list of days
	// skip tweets that are for tomorrow
	log.Debug("Task Started")

	trucks, err := mdl.GetEveryTruck()
	if err != nil {
		log.WithError(err).Error("Failed to get all trucks from database")
	}

	twitnames := make(map[string]int, len(trucks))
	for _, v := range trucks {
		// put all the twitnames in a map
		twitnames[v.Twitname] = 0
	}

	for k := range twitnames {
		uv := url.Values{}
		uv.Set("screen_name", k)
		uv.Set("include_rts", "0")
		tweets, err := api.GetUserTimeline(uv)
		if err != nil {
			log.WithFields(log.Fields{
				"err":      err,
				"twitname": k,
			}).Error("Failed to get tweets")
		}

		for _, t := range tweets {
			time, _ := t.CreatedAtTime()
			err = mdl.SaveTweet(mdl.Tweet{
				Contents:  t.Text,
				Time:      strconv.FormatInt(time.Unix(), 10),
				ID:        t.Id,
				Retweeted: t.Retweeted,
				Twitname:  k,
			})
			if err != nil {
				log.WithFields(log.Fields{
					"err":      err,
					"tweetID":  t.Id,
					"twitname": k,
				}).Error("Failed to save tweet to database")
			}
		}
	}
}
