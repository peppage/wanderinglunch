package main

import (
	"database/sql"
	"fmt"
	"math"
	"strconv"
	"time"

	"gopkg.in/guregu/null.v2"
)

type Truck struct {
	ID          string        `json:"id"`
	Name        string        `json:"name"`
	Twitname    string        `json:"twitname"`
	Weburl      null.String   `json:"weburl"`
	Retweeted   bool          `json:"retweeted"`
	Lasttweet   sql.NullInt64 `json:"lasttweet"`
	Lastupdate  sql.NullInt64 `json:"lastupdate"`
	Updated     string        `json:"updated"`
	Type        string        `json:"type"`
	About       null.String   `json:"about"`
	Foursquare  null.String   `json:"foursquare"`
	Location    null.String   `json:"location"`
	Zone        string        `json:"zone"`
	Image       null.String   `json:"image"`
	Matcher     null.String   `json:"matcher"`
	Matchmethod null.String   `json:"matchmethod"`
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

func getTrucks() []*Truck {
	var trucks []*Truck
	err := db.Select(&trucks, `SELECT trucks.id AS id, trucks.name, trucks.twitname, trucks.lastupdate, locations.display AS location, 
        images.suffix AS image FROM trucks LEFT JOIN locations ON (locations.id = trucks.loc) LEFT JOIN (SELECT * FROM images WHERE 
        menu='t') AS images ON (images.twitname = trucks.twitname) ORDER BY name`)
	if err != nil {
		fmt.Println(err)
	}

	for i := 0; i < len(trucks); i++ {
		trucks[i].Updated = trucks[i].PrettyDate()
	}

	return trucks
}

func getCurrentTrucks() []*Truck {
	t := time.Now().Add(-8 * (time.Minute * 60)).Unix()

	var trucks []*Truck
	err := db.Select(&trucks, `SELECT trucks.id AS id, trucks.name, trucks.twitname, trucks.lastupdate, locations.display AS location, 
        locations.zone as zone, images.suffix AS image FROM trucks LEFT JOIN locations ON (locations.id = trucks.loc) LEFT JOIN
        (SELECT * FROM images WHERE  menu='t') AS images ON (images.twitname = trucks.twitname) WHERE lastupdate > $1 ORDER BY lat DESC`, t)
	if err != nil {
		fmt.Println(err)
	}

	for i := 0; i < len(trucks); i++ {
		trucks[i].Updated = trucks[i].PrettyDate()
	}

	return trucks
}

func getTruck(id string) Truck {
	var t Truck
	err := db.QueryRowx(`SELECT trucks.id AS id, trucks.name, trucks.twitname, trucks.lastupdate, trucks.type, trucks.about,
		trucks.foursquare, trucks.weburl, trucks.matcher, trucks.matchmethod, locations.display AS location, 
        images.suffix AS image FROM trucks LEFT JOIN locations ON (locations.id = trucks.loc) LEFT JOIN (SELECT * FROM images WHERE 
        menu='t') AS images ON (images.twitname = trucks.twitname) WHERE trucks.id=$1`, id).StructScan(&t)
	if err != nil {
		fmt.Println(err)
	}

	return t
}

func addTruck(t Truck) bool {
	result, err := db.Exec(`INSERT INTO trucks (id, name, twitname, weburl, type, about, foursquare, matcher, matchmethod) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)`,
		t.ID, t.Name, t.Twitname, t.Weburl, t.Type, t.About, t.Foursquare, t.Matcher, t.Matchmethod)
	if err != nil {
		fmt.Println(err)
	}
	if result != nil {
		return true
	}
	return false
}

func deleteTruck(id string) bool {
	result, err := db.Exec(`DELETE FROM trucks where id=$1`, id)
	if err != nil {
		fmt.Println(err)
	}
	if result != nil {
		return true
	}
	return false
}

func updateTruck(t Truck) bool {
	result, err := db.Exec(`UPDATE trucks SET (name, twitname, weburl, type, about, foursquare, matcher, matchmethod) = ($1, $2, $3, $4, $5, $6, $7, $8) WHERE id=$9`,
		t.Name, t.Twitname, t.Weburl, t.Type, t.About, t.Foursquare, t.Matcher, t.Matchmethod, t.ID)
	if err != nil {
		fmt.Println(err)
	}
	if result != nil {
		return true
	}
	return false
}

func getFailedUpdates() []*Truck {
	t1 := time.Now().Add(-24 * (time.Minute * 60)).Unix()
	now := time.Now()
	t2 := time.Date(now.Year(), now.Month(), now.Day(), 0, 0, 0, 0, now.Location()).Unix()

	var trucks []*Truck
	err := db.Select(&trucks, `SELECT twitname, id FROM trucks WHERE lastupdate < $1 AND lastupdate > $2`, t1, t2)
	if err != nil {
		fmt.Println(err)
	}
	return trucks
}
