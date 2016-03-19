package model

import (
	"fmt"
	"strconv"
	"time"

	"gopkg.in/guregu/null.v2"
)

type Truck struct {
	ID          string   `json:"id"`
	Name        string   `json:"name"`
	Twitname    string   `json:"twitname"`
	Weburl      string   `json:"weburl"`
	Retweeted   bool     `json:"retweeted"`
	Lasttweet   int      `json:"lasttweet"`
	Lastupdate  int      `json:"lastupdate"`
	Updated     string   `json:"updated"`
	Type        string   `json:"type"`
	About       string   `json:"about"`
	Foursquare  string   `json:"foursquare"`
	Location    string   `json:"location"`
	Loc         null.Int `json:"loc"`
	Zone        string   `json:"zone"`
	Image       string   `json:"image"`
	Matcher     string   `json:"matcher"`
	Matchmethod string   `json:"matchmethod"`
	Tweets      []*Tweet `json:"tweets"`
	Images      []*Image `json:"images"`
	Site        string   `json:"site"`
}

func Trucks(site string, hours int, sort string, sortDir string, loc int) []*Truck {
	var trucks []*Truck
	//if object, found := Cache.Get("trucks" + strconv.Itoa(hours) + sort + sortDir + site); found {
	//		trucks = object.([]*Truck)
	//} else {
	t := time.Now().Add(time.Duration(-1*hours) * (time.Minute * 60)).Unix()

	locSql := ""
	if loc != 0 {
		locSql = "AND loc=" + strconv.Itoa(loc)
	}

	trucks = []*Truck{}
	err := db.Select(&trucks, `SELECT trucks.id AS id, trucks.name, trucks.twitname, trucks.lastupdate, locations.display AS location, 
	        locations.zone as zone, coalesce(images.suffix,'') AS image FROM trucks LEFT JOIN locations ON (locations.id = trucks.loc) LEFT JOIN
	        (SELECT * FROM images WHERE  menu='t') AS images ON (images.twitname = trucks.twitname) WHERE lastupdate > $1 `+locSql+` AND trucks.site = $2 and trucks.loc != 0 ORDER BY `+sort+` `+sortDir, t, site)
	if err != nil {
		fmt.Println(err)
	}
	//for i := 0; i < len(trucks); i++ {
	//trucks[i].Updated = trucks[i].PrettyDate()
	//}
	//Cache.Set("trucks"+strconv.Itoa(hours)+sort+sortDir+site, trucks, cache.DefaultExpiration)
	//}
	return trucks
}

// GetTwitNames returns a map, key is site, with a slice of twitnames.
func GetTwitNames() (map[string][]string, error) {
	trucks := make(map[string][]string)
	rows, err := db.Queryx(`SELECT twitname, site from trucks`)

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

func UpdateLocs(twitname string, locs []int) error {
	l := convertSlice(locs)
	_, err := db.Exec(`UPDATE trucks SET locs=ARRAY[`+l+`] WHERE twitname=$1`, twitname)
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
