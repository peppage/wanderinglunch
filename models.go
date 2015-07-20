package main

import(
	"time"
	"database/sql"
	"strconv"
	"math"
)

type Truck struct {
	Id          string
	Name        string
	Twitname    string
	Weburl      sql.NullString
	Retweeted   bool
	Lasttweet   sql.NullInt64
	Lastupdate  sql.NullInt64
	Type        string
	About       sql.NullString
	Foursquare  sql.NullString
	Location    sql.NullString
	Hood		sql.NullString
	Image		sql.NullString
}

func (t *Truck) PrettyDate() string {
	u, _ := t.Lastupdate.Value()
	if u == nil {
		u = time.Now().Unix()
	}
	elapsed := time.Now().Sub(time.Unix(u.(int64), 0))

	d := math.Trunc(elapsed.Hours() / 24)
	if d == 1 {
		return "a day ago"
	} else if d > 100 {
		return ""
	} else if d > 1 {
		return  strconv.FormatFloat(d, 'f', -1, 32) + " days ago"
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

type Message struct {
	Message string
}

type Marker struct {
	Id	 	string
	Name 	string
	Lat  	string
	Long    string
	Display string
}