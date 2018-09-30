package main

import (
	"math"
	"reflect"
	"regexp"
	"strconv"
	"strings"
	"time"

	"github.com/CloudyKit/jet"
)

func loadFastFunctions() {
	View.AddGlobalFunc("relativeTime", func(a jet.Arguments) reflect.Value {
		a.RequireNumOfArguments("relativeTime", 1, 1)

		i := a.Get(0).Interface().(int64)

		return reflect.ValueOf(relativeTime(i))
	})

	View.AddGlobalFunc("prettyDate", func(a jet.Arguments) reflect.Value {
		a.RequireNumOfArguments("prttyDate", 1, 1)

		t := a.Get(0).Int()

		return reflect.ValueOf(prettyDate(t))
	})

	View.AddGlobalFunc("formatTweet", func(a jet.Arguments) reflect.Value {
		a.RequireNumOfArguments("formatTweet", 1, 1)

		t := a.Get(0).String()

		return reflect.ValueOf(formatTweet(t))
	})
}

// relativeTime converts unix time to a relative time string
// This should probably be a function on truck.
func relativeTime(lastUpdate int64) string {
	elapsed := time.Since(time.Unix(lastUpdate, 0))

	d := math.Trunc(elapsed.Hours() / 24)
	if d == 1 {
		return "a day ago"
	} else if d > 1 {
		return strconv.FormatFloat(d, 'f', -1, 32) + " days ago"
	}

	h := math.Trunc(elapsed.Hours())
	if h == 1 {
		return "an hour ago"
	} else if h > 1 {
		return strconv.FormatFloat(h, 'f', -1, 32) + " hours ago"
	}

	m := math.Trunc(elapsed.Minutes())
	if m == 1 {
		return "a minute ago"
	} else if m > 1 {
		return strconv.FormatFloat(m, 'f', -1, 32) + " minutes ago"
	}

	return "seconds ago"
}

func prettyDate(seconds int64) string {
	tm := time.Unix(seconds, 0)
	return tm.Format("Mon Jan 2 3:04PM 2006")
}

func formatTweet(text string) string {
	r := regexp.MustCompile(`http(s)?:\/\/t.co\/[A-Z0-9a-z]+`)
	m := r.FindAllString(text, -1)
	for key := range m {
		text = strings.Replace(text, m[key], "<a href=\""+m[key]+"\">"+m[key]+"</a>", -1)
	}
	r2 := regexp.MustCompile(`@[A-Za-z0-9_-]+`)
	m2 := r2.FindAllString(text, -1)
	for key := range m2 {
		text = strings.Replace(text, m2[key], "<a href=\"http://twitter.com/"+m2[key]+"\">"+m2[key]+"</a>", -1)
	}
	return text

}
