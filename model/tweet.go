package model

import "strconv"

type Tweet struct {
	Contents  string `json:"contents"`
	Time      string `json:"time"`
	ID        int64  `json:"id"`
	Retweeted bool   `json:"retweeted"`
	Twitname  string `json:"twitname"`
}

func SaveTweet(tweet Tweet) error {
	_, err := db.Exec(`INSERT INTO tweets (id, contents, time, retweeted, twitname) SELECT
            $1, $2, $3, $4, $5 WHERE NOT EXISTS (
            SELECT 1 FROM tweets WHERE id=$1)`, strconv.FormatInt(tweet.ID, 10), tweet.Contents, tweet.Time, tweet.Retweeted, tweet.Twitname)

	return err
}
