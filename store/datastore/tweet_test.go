package datastore

import (
	"testing"
	"time"
	"wanderinglunch/model"
	"wanderinglunch/store"

	"github.com/jmoiron/sqlx"
	"github.com/stretchr/testify/suite"
)

type TweetTestSuite struct {
	suite.Suite
	data store.Store
	db   *sqlx.DB
}

func (suite *TweetTestSuite) SetupSuite() {
	suite.db = open("pgx", "postgres://mca@localhost:5432/wandering_test")
	suite.data = From(suite.db)
}

func (suite *TweetTestSuite) TearDownSuite() {
	suite.db.Close()
}

func (suite *TweetTestSuite) SetupTest() {
	suite.db.Exec("DELETE FROM tweets")
}

func (suite *TweetTestSuite) TestSaveTweet() {
	tweet := model.Tweet{
		ID:        2,
		Text:      "text",
		Time:      4,
		Retweeted: false,
		Twitname:  "twitname",
	}

	err := suite.data.SaveTweet(&tweet)
	suite.Assert().NoError(err, "Failed saving tweet")
}

func (suite *TweetTestSuite) TestGetTweets() {
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

	suite.data.SaveTweet(&tweet1)
	suite.data.SaveTweet(&tweet2)

	tweets, err := suite.data.GetTweets(twitName)

	suite.Assert().NoError(err, "Faield getting tweets")
	suite.Equal(len(tweets), 2)
}

func (suite *TweetTestSuite) TestDeleteAllTweets() {
	twitName := "twitname"
	tweet := model.Tweet{
		ID:        2,
		Text:      "text",
		Time:      4,
		Retweeted: false,
		Twitname:  twitName,
	}

	suite.data.SaveTweet(&tweet)
	err := suite.data.DeleteAllTweets()

	tweets, _ := suite.data.GetTweets(twitName)

	suite.Assert().NoError(err, "Failed deleting all tweets")
	suite.Equal(len(tweets), 0)
}

func (suite *TweetTestSuite) TestDeleteOldTweets() {
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

	suite.data.SaveTweet(&tweet1)
	suite.data.SaveTweet(&tweet2)
	err := suite.data.DeleteOldTweets()

	tweets, _ := suite.data.GetTweets(twitName)

	suite.Assert().NoError(err, "Failed deleting old tweets")
	suite.Equal(len(tweets), 1)
	suite.Equal(tweets[0].ID, tweet2.ID)
}

func TestTweet(t *testing.T) {
	suite.Run(t, new(TweetTestSuite))
}
