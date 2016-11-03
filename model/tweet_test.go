package model

import (
	"testing"
	"time"

	"github.com/stretchr/testify/suite"
)

type TweetTestSuite struct {
	suite.Suite
}

func (suite *TweetTestSuite) TestPrettyTime() {
	tweet := &Tweet{
		Time: 1478104079,
	}

	pretty := tweet.PrettyDate()
	suite.Equal(pretty, "Wed Nov 2 12:27PM 2016")
}

func (suite *TweetTestSuite) TestFormText() {
	originalText := `Test http://t.co/f03jf0 this @username`
	formattedText := `Test <a href="http://t.co/f03jf0">http://t.co/f03jf0</a> this <a href="http://twitter.com/@username">@username</a>`

	tweet := &Tweet{
		Text: originalText,
	}

	suite.Equal(tweet.FomattedText(), formattedText)
}

func (suite *TweetTestSuite) TestTimeConverted() {
	now := time.Now()

	tweet := &Tweet{
		Time: now.Unix(),
	}

	created := tweet.CreatedAtTime()
	suite.Equal(now.Hour(), created.Hour())
	suite.Equal(now.Minute(), created.Minute())
	suite.Equal(now.Second(), created.Second())
}

func TestTweetSuite(t *testing.T) {
	suite.Run(t, new(TweetTestSuite))
}
