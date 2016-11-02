package datastore

import (
	"testing"
	"time"
	"wanderinglunch/model"

	"github.com/franela/goblin"
)

func TestTweet(t *testing.T) {
	db := open("pgx", "postgres://mca@localhost:5432/wandering_test")
	defer db.Close()

	s := From(db)
	g := goblin.Goblin(t)
	g.Describe("Tweet datastore", func() {
		g.BeforeEach(func() {
			db.Exec("DELETE FROM tweets")
		})

		g.It("Should Save tweet", func() {
			tweet := model.Tweet{
				ID:        2,
				Text:      "text",
				Time:      4,
				Retweeted: false,
				Twitname:  "twitname",
			}

			err := s.SaveTweet(&tweet)
			g.Assert(err == nil).IsTrue()
		})

		g.It("Should get tweets", func() {
			twitName := "twitname"
			tweet1 := model.Tweet{
				ID:        1,
				Text:      "text 1",
				Time:      4,
				Retweeted: false,
				Twitname:  twitName,
			}

			tweet2 := model.Tweet{
				ID:        2,
				Text:      "text 2",
				Time:      4,
				Retweeted: false,
				Twitname:  twitName,
			}

			s.SaveTweet(&tweet1)
			s.SaveTweet(&tweet2)

			tweets, err := s.GetTweets(twitName)

			g.Assert(err == nil).IsTrue()
			g.Assert(len(tweets) == 2).IsTrue()
		})

		g.It("Should delete all tweets", func() {
			twitName := "twitname"
			tweet := model.Tweet{
				ID:        2,
				Text:      "text",
				Time:      4,
				Retweeted: false,
				Twitname:  twitName,
			}

			s.SaveTweet(&tweet)
			err := s.DeleteAllTweets()

			tweets, _ := s.GetTweets(twitName)

			g.Assert(err == nil).IsTrue()
			g.Assert(len(tweets) == 0).IsTrue()

		})

		g.It("Should delete old tweets", func() {
			twitName := "twitname"
			tweet1 := model.Tweet{
				ID:        1,
				Text:      "text 1",
				Time:      1446486238,
				Retweeted: false,
				Twitname:  twitName,
			}

			tweet2 := model.Tweet{
				ID:        2,
				Text:      "text 2",
				Time:      time.Now().Unix(),
				Retweeted: false,
				Twitname:  twitName,
			}

			s.SaveTweet(&tweet1)
			s.SaveTweet(&tweet2)
			err := s.DeleteOldTweets()

			tweets, _ := s.GetTweets(twitName)

			g.Assert(err == nil)
			g.Assert(len(tweets) == 1).IsTrue()
			g.Assert(tweets[0].ID == tweet2.ID).IsTrue()
		})

		//g.It("Should get site tweets", func() {})

		//g.It("Should mark tweet done", func() {})
	})
}
