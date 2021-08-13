package main

import (
	"context"
	"net/http"
	"regexp"
	"strings"
	"time"

	"github.com/dghubble/go-twitter/twitter"
	"github.com/peppage/simpletransport/simpletransport"
	"github.com/rs/zerolog/log"
	"golang.org/x/oauth2"
	"golang.org/x/oauth2/clientcredentials"
)

var twit *twitter.Client

func makeSubstitutions(subs []*Sub, text string) string {
	for _, sub := range subs {
		r, _ := regexp.Compile("(?i)" + sub.Regex)
		text = r.ReplaceAllString(text, sub.Replacement)
	}
	return text
}

func findLocations(locations []*Location, text string) []*Location {
	foundLocs := []*Location{}

	for _, location := range locations {
		matched, _ := regexp.MatchString("(?i)"+location.Matcher, text)
		if matched {
			foundLocs = append(foundLocs, location)
		}
	}

	return foundLocs
}

func updator() error {
	initTwitterClient()
	log.Debug().Msg("starting updator")

	subs, err := db.GetSubs()
	if err != nil {
		log.Err(err).Send()
		return err
	}

	locs, err := db.GetLocations("")
	if err != nil {
		log.Err(err).Send()
		return err
	}

	trucks, err := db.GetTrucks(false, "")

	for _, t := range trucks {
		tweets, _, err := twit.Timelines.UserTimeline(&twitter.UserTimelineParams{
			ScreenName:      t.ID,
			IncludeRetweets: twitter.Bool(false),
			Count:           20,
		})

		if err != nil {
			return err
		}

		for _, tweet := range tweets {
			tweetTime := parseCreatedAt(tweet.CreatedAt)
			//log.Debug().Str("text", tweet.Text).Str("created", tweet.CreatedAt).Msg("Tweet")
			err = db.InsertTweet(&Tweet{
				ID:      tweet.IDStr,
				Text:    tweet.Text,
				Time:    tweetTime.Unix(),
				TruckID: t.ID,
				Done:    false,
			})

			if err != nil {
				log.Err(err).Send()
				return err
			}

			if inPasteightHours(tweetTime) && !isResponse(tweet.Text) && !hasSkipWord(tweet.Text) {
				text := makeSubstitutions(subs, tweet.Text)

				foundLocs := findLocations(locs, text)
				if len(foundLocs) > 0 {
					log.Debug().Str("truck", t.ID).Msg("Locations found")
					t.LastUpdate = tweetTime.Unix()

					err = db.UpdateTruck(t)
					if err != nil {
						return err
					}

					for _, l := range foundLocs {
						err = db.InsertSpot(&SpotIds{
							TruckID:    t.ID,
							LocationID: l.ID,
							TweetID:    tweet.IDStr,
						})

						if err != nil {
							return err
						}
					}
				}
			}

		}
	}
	log.Debug().Msg("Finished updating")
	return nil
}

func initTwitterClient() {
	if twit != nil {
		return
	}

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
		ClientID:     conf.TwitterConsumerKey,
		ClientSecret: conf.TwitterConsumerSecret,
		TokenURL:     "https://api.twitter.com/oauth2/token",
	}

	ctx := context.WithValue(context.Background(), oauth2.HTTPClient, httpThrottleClient)
	httpClient := config.Client(ctx)

	twit = twitter.NewClient(httpClient)
}

func parseCreatedAt(createdAt string) time.Time {
	created, _ := time.Parse(time.RubyDate, createdAt)
	return created
}

func inPasteightHours(created time.Time) bool {
	timeAtEightHoursAgo := time.Now().Add(time.Hour * -8)
	return created.After(timeAtEightHoursAgo)
}

func isResponse(tweetText string) bool {
	return string(tweetText[0]) == "@"
}

func hasSkipWord(text string) bool {
	return strings.Contains(text, "tomorrow") || strings.Contains(text, "schedule") || strings.Contains(text, "cancelled")
}
