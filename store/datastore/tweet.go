package datastore

import (
	"time"
	"wanderinglunch/model"
)

func (db *datastore) SaveTweet(tweet *model.Tweet) error {
	_, err := db.Exec(saveTweetQuery, tweet.ID, tweet.Text, tweet.Time, tweet.Retweeted, tweet.Twitname)
	return err
}

func (db *datastore) GetTweets(twitname string) ([]*model.Tweet, error) {
	var tweets []*model.Tweet
	err := db.Select(&tweets, getTweetsQuery, twitname)
	return tweets, err
}

func (db *datastore) DeleteAllTweets() error {
	_, err := db.Exec(truncateTweetsQuery)
	return err
}

func (db *datastore) DeleteOldTweets() error {
	t := time.Now().Add(time.Minute * -10080 * 2) // 2 weeks
	_, err := db.Exec(deleteOldTweetsQuery, t.Unix())
	return err
}

func (db *datastore) GetSiteTweets(site string, limit int) ([]*model.Tweet, error) {
	var tweets []*model.Tweet
	err := db.Select(&tweets, getSiteTweetsQuery, site, limit)
	return tweets, err
}

// Might consider altering this to update tweet query
func (db *datastore) MarkTweetDone(id string) error {
	_, err := db.Exec(markDoneTweetQuery, id)
	return err
}

const saveTweetQuery = `
INSERT INTO tweets
            (id,
             text,
             time,
             retweeted,
             twitname)
SELECT $1,
       $2,
       $3,
       $4,
       $5
WHERE  NOT EXISTS (SELECT 1
                   FROM   tweets
                   WHERE  id = $1) 
`
const getTweetsQuery = `
SELECT text,
       time,
       id,
       retweeted,
       twitname
FROM   tweets
WHERE  twitname = $1
ORDER  BY time DESC
`

const truncateTweetsQuery = `
TRUNCATE tweets
`

const deleteOldTweetsQuery = `
DELETE FROM tweets
WHERE  time < $1
`

const getSiteTweetsQuery = `
SELECT trucks.twitname,
       text,
       time,
       tweets.id,
       tweets.retweeted
FROM   trucks
       RIGHT JOIN tweets
               ON trucks.twitname = tweets.twitname
WHERE  site = $1
       AND done = 'f'
ORDER  BY time DESC
LIMIT  $2
`

const markDoneTweetQuery = `
UPDATE tweets
SET    done = 't'
WHERE  id = $1
`
