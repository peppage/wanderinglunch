package model

import (
	"regexp"
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

//PrettyDate returns formatted date from epoch
func (t *Tweet) PrettyDate() string {
	tm := time.Unix(t.Time, 0)
	return tm.Format("Mon Jan 2 3:04PM 2006")
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

func (t *Tweet) CreatedAtTime() time.Time {
	return time.Unix(t.Time, 0)
}
