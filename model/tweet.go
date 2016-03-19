package model

import "strconv"

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

func GetTweets(twitname string) ([]*Tweet, error) {
	var tweets []*Tweet
	err := db.Select(&tweets, `SELECT * FROM tweets WHERE twitname = $1`, twitname)
	return tweets, err
}
