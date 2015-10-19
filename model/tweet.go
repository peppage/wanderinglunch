package model

import (
	"fmt"
	"regexp"
	"strconv"
	"strings"
	"time"
)

type Tweet struct {
	Contents  string `json:"contents"`
	Time      string `json:"time"`
	ID        string `json:"id"`
	Retweeted bool   `json:"retweeted"`
	Twitname  string `json:"twitname"`
}

func (t *Tweet) converted() {
	subs := GetSubs()
	for key := range subs {
		re := regexp.MustCompile(subs[key].Regex)
		t.Contents = re.ReplaceAllString(t.Contents, subs[key].Replacement)
	}
}

func (t *Tweet) prettyTime() {
	i, err := strconv.ParseInt(t.Time, 10, 64)
	if err != nil {
		panic(err)
	}
	tm := time.Unix(i, 0)
	t.Time = tm.Format("Mon Jan _2 3:04PM 2006")
}

func (t *Tweet) parse() {
	r, _ := regexp.Compile("http(s)?:\\/\\/t.co\\/[A-Z0-9a-z]+")
	m := r.FindAllString(t.Contents, -1)
	for key := range m {
		t.Contents = strings.Replace(t.Contents, m[key], "<a href=\""+m[key]+"\">"+m[key]+"</a>", -1)
	}
	r2, _ := regexp.Compile("@[A-Za-z0-9_-]+")
	m2 := r2.FindAllString(t.Contents, -1)
	for key := range m2 {
		t.Contents = strings.Replace(t.Contents, m2[key], "<a href=\"http://twitter.com/"+m2[key]+"\">"+m2[key]+"</a>", -1)
	}
}

func GetTweets(twitname string, converted bool, prettyTime bool, parsed bool) []*Tweet {
	var tweets []*Tweet
	err := db.Select(&tweets, `SELECT contents, time, id, twitname FROM tweets where twitname=$1 ORDER BY time DESC`, twitname)
	if err != nil {
		fmt.Println(err)
	}
	if converted || prettyTime || parsed {
		for key := range tweets {
			if converted {
				tweets[key].converted()
			}
			if prettyTime {
				tweets[key].prettyTime()
			}
			if parsed {
				tweets[key].parse()
			}
		}
	}

	return tweets
}

func GetTweet(id int, converted bool, prettyTime bool, parsed bool) Tweet {
	var t Tweet
	err := db.QueryRowx(`SELECT * FROM tweets WHERE id=$1`, id).StructScan(&t)
	if err != nil {
		fmt.Println(err)
	}
	if converted {
		t.converted()
	}
	return t
}
