package model

import (
	"testing"
	"time"

	"github.com/franela/goblin"
)

func TestTweet(t *testing.T) {
	g := goblin.Goblin(t)

	g.Describe("Tweet model", func() {
		g.It("Should have pretty time", func() {
			tweet := &Tweet{
				Time: 1478104079,
			}

			pretty := tweet.PrettyDate()
			g.Assert(pretty == "Wed Nov 2 12:27PM 2016").IsTrue()

		})

		g.It("Should format text like twitter for display", func() {
			originalText := `Test http://t.co/f03jf0 this @username`
			formattedText := `Test <a href="http://t.co/f03jf0">http://t.co/f03jf0</a> this <a href="http://twitter.com/@username">@username</a>`

			tweet := &Tweet{
				Text: originalText,
			}

			g.Assert(tweet.FomattedText() == formattedText).IsTrue()
		})

		g.It("Should convert the unix time to a time.time", func() {
			now := time.Now()

			tweet := &Tweet{
				Time: now.Unix(),
			}

			created := tweet.CreatedAtTime()
			g.Assert(now.Hour() == created.Hour()).IsTrue()
			g.Assert(now.Minute() == created.Minute()).IsTrue()
			g.Assert(now.Second() == created.Second()).IsTrue()
		})
	})
}
