package model

import (
	"regexp"
	"strconv"
	"strings"
	"time"
)

type Tweet struct {
	Text      string `json:"contents"`
	Time      int64  `json:"time"`
	ID        int64  `json:"id"`
	Retweeted bool   `json:"retweeted"`
	Twitname  string `json:"twitname"`
}

func SaveTweet(tweet Tweet) error {
	_, err := db.Exec(`INSERT INTO tweets (id, text, time, retweeted, twitname) SELECT
            $1, $2, $3, $4, $5 WHERE NOT EXISTS (
            SELECT 1 FROM tweets WHERE id=$1)`, strconv.FormatInt(tweet.ID, 10), tweet.Text, tweet.Time, tweet.Retweeted, tweet.Twitname)

	return err
}

//PrettyDate returns formatted date from epoch
func (t *Tweet) PrettyDate() string {
	tm := time.Unix(t.Time, 0)
	return tm.Format("Mon Jan _2 3:04PM 2006")
}

//FomattedText returns a string with links and @s linked
func (t *Tweet) FomattedText() string {
	text := t.Text
	r, _ := regexp.Compile("http(s)?:\\/\\/t.co\\/[A-Z0-9a-z]+")
	m := r.FindAllString(text, -1)
	for key := range m {
		text = strings.Replace(text, m[key], "<a href=\""+m[key]+"\">"+m[key]+"</a>", -1)
	}
	r2, _ := regexp.Compile("@[A-Za-z0-9_-]+")
	m2 := r2.FindAllString(text, -1)
	for key := range m2 {
		text = strings.Replace(text, m2[key], "<a href=\"http://twitter.com/"+m2[key]+"\">"+m2[key]+"</a>", -1)
	}
	return text
}

func GetTweets(twitname string) ([]*Tweet, error) {
	var tweets []*Tweet
	err := db.Select(&tweets, `SELECT text, time, id, retweeted, twitname
		FROM tweets WHERE twitname = $1 ORDER BY time DESC`, twitname)
	return tweets, err
}

func (t Tweet) CreatedAtTime() time.Time {
	return time.Unix(t.Time, 0)
}

func DeleteAllTweets() error {
	_, err := db.Exec(`TRUNCATE tweets`)
	return err
}
