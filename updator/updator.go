package updator

import (
	"context"
	"database/sql"
	"log"
	"net/http"
	"regexp"
	"strings"
	"time"

	"wanderinglunch/models"

	"github.com/dghubble/go-twitter/twitter"
	"github.com/jasonlvhit/gocron"
	"github.com/peppage/simpletransport/simpletransport"
	"github.com/volatiletech/sqlboiler/boil"
	"github.com/volatiletech/sqlboiler/queries/qm"
	"golang.org/x/oauth2"
	"golang.org/x/oauth2/clientcredentials"
)

var twitAPI *twitter.Client
var db *sql.DB

const twoWeeks = time.Minute * -10080 * 2

type TwitterCreds struct {
	ConsumerKey    string
	ConsumerSecret string
}

func Start(data *sql.DB) {
	db = data

	gocron.Every(15).Minutes().Do(findLocationsTask)
	gocron.Every(1).Saturday().At("23:00").Do(truncateTweets)
	<-gocron.Start()
}

func InitializeTwitter(creds TwitterCreds) {
	transport := simpletransport.NewThrottleTransport(&simpletransport.ThrottleOptions{
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
		ClientID:     creds.ConsumerKey,
		ClientSecret: creds.ConsumerSecret,
		TokenURL:     "https://api.twitter.com/oauth2/token",
	}

	ctx := context.WithValue(context.Background(), oauth2.HTTPClient, httpThrottleClient)
	httpClient := config.Client(ctx)

	twitAPI = twitter.NewClient(httpClient)

}

func findLocationsTask() {
	log.Printf("Finding Locations")

	trucks, err := models.Trucks(qm.Where("archive = ?", false)).All(context.Background(), db)
	if err != nil {
		log.Printf("Failed getting trucks, %v", err)
	}

	for _, truck := range trucks {
		log.Printf("getting %v tweets", truck.Twitname)
		tweets, err := getTweets(truck)
		if err != nil {
			log.Printf("Failed getting tweets for %v: %v", truck.Twitname, err)
			continue
		}

		saveTweets(truck.Twitname, tweets)

		searchTweets(tweets)

	}
}

func getTweets(truck *models.Truck) ([]twitter.Tweet, error) {
	tweets, _, err := twitAPI.Timelines.UserTimeline(&twitter.UserTimelineParams{
		ScreenName:      truck.Twitname,
		IncludeRetweets: twitter.Bool(false),
		Count:           100,
	})
	return tweets, err

}

func saveTweets(twitname string, tweets []twitter.Tweet) {
	for _, tweet := range tweets {
		tweet.Text = strings.Replace(tweet.Text, "&amp;", "&", -1)
		tweet.Text = strings.Replace(tweet.Text, "#", "", -1)
		tweet.Text = strings.Replace(tweet.Text, "\"", "", -1)

		t := models.Tweet{
			Text:      tweet.Text,
			Time:      parseCreatedAt(tweet.CreatedAt).Unix(),
			ID:        tweet.ID,
			Retweeted: tweet.Retweeted,
			Twitname:  twitname,
		}

		err := t.Upsert(context.Background(), db, false, []string{"id"}, boil.Infer(), boil.Infer())
		if err != nil {
			log.Printf("Failed tweet upsert %v", err)
		}
	}
}

func searchTweets(tweets []twitter.Tweet) {
	for _, tweet := range tweets {
		if isYoung(tweet) && !isResponse(tweet) {
			text := substitutions(strings.ToLower(tweet.Text))
			if !hasSkipWord(text) {
				locs := findLocations(text)
				if len(locs) > 0 {
					log.Printf("Locations found")
					saveSpots(tweet, locs)
				}
			}
		}
	}
}

func substitutions(text string) string {
	subs, err := models.Subs().All(context.Background(), db)
	if err != nil {
		log.Printf("Failed getting subs %v", err)
		return ""
	}

	for _, sub := range subs {
		r, _ := regexp.Compile("(?i)" + sub.Regex)
		text = r.ReplaceAllString(text, sub.Replacement)
	}

	return text
}

func findLocations(text string) []*models.Location {
	foundLocs := []*models.Location{}

	locations, err := models.Locations().All(context.Background(), db)
	if err != nil {
		log.Printf("Failed getting locations %v", err)
		return foundLocs
	}

	for _, location := range locations {
		matched, _ := regexp.MatchString("(?i)"+location.Matcher, text)
		if matched {
			foundLocs = append(foundLocs, location)
		}
	}

	return foundLocs
}

func saveSpots(tweet twitter.Tweet, locations []*models.Location) {
	for _, location := range locations {
		spot := models.Spot{
			TruckID:    strings.ToLower(tweet.User.ScreenName),
			LocationID: location.ID,
			TweetID:    tweet.ID,
		}
		spot.Insert(context.Background(), db, boil.Infer())
	}
}

func parseCreatedAt(createdAt string) time.Time {
	created, _ := time.Parse(time.RubyDate, createdAt)
	return created
}

func isResponse(tweet twitter.Tweet) bool {
	return string(tweet.Text[0]) == "@"
}

func hasSkipWord(text string) bool {
	return strings.Contains(text, "tomorrow") || strings.Contains(text, "schedule") || strings.Contains(text, "cancelled")
}

func isYoung(tweet twitter.Tweet) bool {
	created := parseCreatedAt(tweet.CreatedAt)
	timeAtEightHoursAgo := time.Now().Add(time.Hour * -8)
	return created.After(timeAtEightHoursAgo)
}

func truncateTweets() {
	t := time.Now().Add(twoWeeks)
	models.Tweets(qm.Where("time < $1", t)).DeleteAll(context.Background(), db)
}
