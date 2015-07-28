package main

import (
	"regexp"
	"fmt"
)

type Tweet struct {
	Contents string
	Time 	 string
	Id 	     string
}

func (t *Tweet) Converted() string {
	subs := getSubs()
	tweet := t.Contents 
	for key := range subs {
		re := regexp.MustCompile(subs[key].Regex)
		tweet = re.ReplaceAllString(tweet, subs[key].Replacement)
	}
	return tweet
}

func getTweets(twitname string, amount int, page int) []*Tweet {
	var tweets []*Tweet
	o := amount * page
	err := db.Select(&tweets, `SELECT contents, time, id FROM tweets where twitname=$1 ORDER BY time DESC LIMIT 10 OFFSET $2`, twitname, o)
	if err != nil {
		fmt.Println(err)
	}
	return tweets
}