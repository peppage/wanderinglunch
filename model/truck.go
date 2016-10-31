package model

import (
	"errors"
	"fmt"
	"math"
	"strconv"
	"time"
)

type Truck struct {
	ID         string   `json:"id"`
	Name       string   `json:"name"`
	Twitname   string   `json:"twitname"`
	Weburl     string   `json:"weburl"`
	Retweeted  bool     `json:"retweeted"`
	Lastupdate int64    `json:"lastupdate"`
	Updated    string   `json:"updated"`
	Type       string   `json:"type"`
	About      string   `json:"about"`
	Foursquare string   `json:"foursquare"`
	Location   string   `json:"location"`
	Zone       string   `json:"zone"`
	Image      string   `json:"image"`
	Tweets     []*Tweet `json:"tweets"`
	Images     []*Image `json:"images"`
	Site       string   `json:"site"`
	Archive    bool     `json:"archive"`
}

// relativeTime converts unix time to a relative time string
func relativeTime(lastUpdate int64) string {
	elapsed := time.Now().Sub(time.Unix(lastUpdate, 0))

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

func Trucks(site string, hours int, sort string, sortDir string, loc int) ([]*Truck, error) {
	var trucks []*Truck
	t := time.Now().Add(time.Duration(-1*hours) * (time.Minute * 60)).Unix()

	locSql := ""
	if loc != 0 {
		locSql = "AND loc=" + strconv.Itoa(loc)
	}

	rows, err := db.Queryx(`SELECT trucks.id AS id, trucks.name, trucks.twitname, trucks.lastupdate, coalesce(locations.display,'') AS location, 
	        coalesce(locations.zone,'') AS zone, coalesce(images.suffix,'') AS image FROM trucks LEFT JOIN locations ON (locations.id = ANY(trucks.locs)) LEFT JOIN
	        (SELECT * FROM images WHERE  menu='t') AS images ON (images.twitname = trucks.twitname) WHERE lastupdate > $1 `+locSql+` AND trucks.site = $2 AND trucks.locs IS NOT NULL ORDER BY `+sort+` `+sortDir, t, site)
	if err != nil {
		return nil, err
	}

	trucks = []*Truck{}
	for rows.Next() {
		tt := Truck{}
		rows.StructScan(&tt)
		tt.Updated = relativeTime(tt.Lastupdate)
		trucks = append(trucks, &tt)
	}

	return trucks, nil
}

func AllTrucks(site string) ([]*Truck, error) {
	rows, err := db.Queryx(`SELECT trucks.id AS id, trucks.name, trucks.twitname, trucks.lastupdate, trucks.foursquare, trucks.archive
		FROM trucks WHERE trucks.site = $1 ORDER BY trucks.name`, site)

	if err != nil {
		return nil, err
	}
	trucks := []*Truck{}
	for rows.Next() {
		tt := Truck{}
		rows.StructScan(&tt)
		tt.Updated = relativeTime(tt.Lastupdate)
		trucks = append(trucks, &tt)
	}
	return trucks, nil
}

func GetTruck(id string) []*Truck {
	trucks := []*Truck{}
	err := db.Select(&trucks, `SELECT trucks.id AS id, trucks.name, trucks.twitname, trucks.type, trucks.lastupdate, trucks.site, trucks.about,
		trucks.foursquare, trucks.weburl, trucks.archive, coalesce(locations.display,'') AS location, coalesce(locations.zone,'') AS zone
        FROM trucks LEFT JOIN locations ON (locations.id = ANY(trucks.locs)) WHERE trucks.id=$1 OR trucks.twitname=$1`, id)
	if err != nil {
		fmt.Println(err)
	}
	if len(trucks) > 0 {
		trucks[0].Updated = relativeTime(trucks[0].Lastupdate)
		trucks[0].Tweets, err = GetTweets(trucks[0].Twitname)
		// TODO IMPORTANT
		//images, _ := GetImages(trucks[0].Twitname)
		//trucks[0].Images = images
	}

	return trucks
}

// GetTwitNames returns a map, key is site, with a slice of twitnames.
func GetTwitNames(archive bool) (map[string][]string, error) {
	trucks := make(map[string][]string)
	rows, err := db.Queryx(`SELECT twitname, site FROM trucks WHERE archive = $1 ORDER BY twitname`, archive)

	if err != nil {
		return nil, err
	}

	for rows.Next() {
		var twitname string
		var site string
		rows.Scan(&twitname, &site)
		trucks[site] = append(trucks[site], twitname)
	}
	return trucks, nil
}

func UpdateLocs(twitname string, locs []int, lastUpdate int64) error {
	l := convertSlice(locs)
	_, err := db.Exec(`UPDATE trucks SET locs=ARRAY[`+l+`], lastupdate=$1 WHERE twitname=$2`, lastUpdate, twitname)
	return err
}

func convertSlice(values []int) string {
	s := ""
	for k, v := range values {
		s += strconv.Itoa(v)
		if k != len(values)-1 {
			s += ","
		}
	}
	return s
}

func LastUpdate(siteName string) (int64, error) {
	var lastUpdate int64
	err := db.Get(&lastUpdate, `select lastUpdate from trucks where site = $1 order by lastupdate desc limit 1`, siteName)
	return lastUpdate, err
}

func GetFailedUpdates(siteName string) ([]*Truck, error) {
	now := time.Now()
	t1 := now.Add(-24 * (time.Minute * 60)).Unix()
	t2 := time.Date(now.Year(), now.Month(), now.Day(), 0, 0, 0, 0, now.Location()).Unix() // Start of the day

	var trucks []*Truck
	err := db.Select(&trucks, `SELECT trucks.twitname FROM trucks LEFT JOIN tweets ON trucks.twitname = tweets.twitname WHERE
        lastupdate < $1 AND time > $2 AND site = $3 GROUP BY trucks.twitname`, t1, t2, siteName)
	return trucks, err
}

// Can switch add/save to upsert after updating postgres

func AddTruck(t Truck) error {
	if t.ID == "" || t.Twitname == "" || t.Name == "" || t.Site == "" {
		return errors.New("Id, Twitname, Name, and Site are required")
	}
	_, err := db.Exec(`INSERT INTO trucks (id, name, twitname, weburl, type, about, foursquare, site) VALUES ($1, $2, $3, $4, $5, $6, $7, $8)`,
		t.ID, t.Name, t.Twitname, t.Weburl, t.Type, t.About, t.Foursquare, t.Site)
	return err
}

func UpdateTruck(t Truck) error {
	_, err := db.Exec(`UPDATE trucks SET (name, twitname, weburl, type, about, foursquare, archive)
		= ($1, $2, $3, $4, $5, $6, $7) WHERE id=$8`,
		t.Name, t.Twitname, t.Weburl, t.Type, t.About, t.Foursquare, t.Archive, t.ID)
	return err
}
