package main

import (
	"math"
	"reflect"
	"strconv"
	"time"

	"github.com/CloudyKit/jet"
)

func loadFastFunctions() {
	View.AddGlobalFunc("relativeTime", func(a jet.Arguments) reflect.Value {
		a.RequireNumOfArguments("relativeTime", 1, 1)

		i := a.Get(0).Interface().(int)

		return reflect.ValueOf(relativeTime(int64(i)))
	})
}

// relativeTime converts unix time to a relative time string
// This should probably be a function on truck.
func relativeTime(lastUpdate int64) string {
	elapsed := time.Since(time.Unix(lastUpdate, 0))

	d := math.Trunc(elapsed.Hours() / 24)
	if d == 1 {
		return "a day ago"
	} else if d > 100 {
		return ""
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
