package main

import(
	"time"
	"fmt"
	"database/sql"
	"strconv"
	"math"
	"regexp"
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

type Tweet struct {
	Contents string
	Time 	 string
	Id 	     string
}

func (t *Tweet) DoSubs() {
	subs := getSubs()
	for key := range subs {
		re := regexp.MustCompile(subs[key].Regex)
		t.Contents = re.ReplaceAllString(t.Contents, subs[key].Replacement)
	}
}

func getTweets(twitname string, amount int, page int) []*Tweet {
	tweets := []*Tweet{}
	o := amount * page
	err := db.Select(&tweets, `SELECT contents, time, id FROM tweets where twitname=$1 ORDER BY time DESC LIMIT 10 OFFSET $2`, twitname, o)
	if err != nil {
		fmt.Println(err)
	}
	return tweets
}

type Subs struct {
	Regex 	    string
	Replacement string
}

func getSubs() []*Subs {
	subs := []*Subs{}
	err := db.Select(&subs, `SELECT regex, replacement FROM subs`)
	if err != nil {
		fmt.Println(err)
	}
	return subs
}