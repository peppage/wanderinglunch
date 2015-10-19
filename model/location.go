package model

import (
	"errors"
	"fmt"
	"net/url"
	"strconv"

	"github.com/pmylund/go-cache"
)

/**
 * @apiDefine Location
 * @apiParam {String} display What the location looks like on the site
 * @apiParam {String} matcher The regex to match inside the tweet
 * @apiParam {String} lat The latitude of the location
 * @apiParam {String} long The longitude of the location
 * @apiParam {String} zone
 * @apiParam {String} site What website this location belongs to
 */
type Location struct {
	ID      int     `json:"id"`
	Display string  `json:"display"`
	Matcher string  `json:"matcher"`
	Lat     float32 `json:"lat"`
	Long    float32 `json:"long"`
	Zone    string  `json:"zone"`
	Site    string  `json:"site"`
}

func GetLocations() []*Location {
	var locs []*Location
	err := db.Select(&locs, `SELECT * FROM locations ORDER BY id`)
	if err != nil {
		fmt.Println(err)
	}
	return locs
}

func GetLocation(id string) Location {
	var l Location
	err := db.QueryRowx(`SELECT * FROM locations WHERE id=$1`, id).StructScan(&l)
	if err != nil {
		fmt.Println(err)
	}
	return l
}

func GetLocationByDisplay(display string) Location {
	var l Location
	err := db.QueryRowx(`SELECT * FROM locations WHERE display=$1`, display).StructScan(&l)
	if err != nil {
		fmt.Println(err)
	}
	return l
}

func AddLocation(l Location) error {
	if l.Display == "" || l.Matcher == "" || l.Lat == 0 || l.Long == 0 || l.Zone == "" || l.Site == "" {
		return errors.New("Display, Matcher, Lat, Long, Zone, and Site are required")
	}
	result, err := db.NamedExec(
		`INSERT INTO locations (display, matcher, lat, long, zone, site)
			VALUES (:display, :matcher, :lat, :long, :zone, :site)`, l)
	if err != nil {
		return err
	}
	if result != nil {
		return nil
	}
	return errors.New("Unknown error")
}

func DeleteLocation(id string) bool {
	result, err := db.Exec(`DELETE FROM locations WHERE id = $1`, id)
	if err != nil {
		fmt.Println(err)
	}
	if result != nil {
		return true
	}
	return false
}

func UpdateLocation(l Location) error {
	if l.Display == "" || l.Matcher == "" || l.Lat == 0 || l.Long == 0 || l.Zone == "" || l.Site == "" {
		return errors.New("Display, Matcher, Lat, Long, Zone, and Site are required")
	}
	result, err := db.NamedExec(
		`UPDATE locations SET (display, matcher, lat, long) = (:display, :matcher, :lat, :long) WHERE id=:id`, l)
	if err != nil {
		return err
	}
	if result != nil {
		return nil
	}
	return errors.New("Unknown error")
}

func LocationMarshal(v url.Values) Location {
	var l Location
	l.Display = v.Get("display")
	l.Matcher = v.Get("matcher")
	var lat, err = strconv.ParseFloat(v.Get("lat"), 32)
	if err != nil {
		l.Lat = float32(lat)
	} else {
		l.Lat = 0
	}
	var long, err2 = strconv.ParseFloat(v.Get("long"), 32)
	if err2 != nil {
		l.Long = float32(long)
	} else {
		l.Long = 0
	}
	l.Zone = v.Get("zone")
	l.Site = v.Get("site")
	return l
}

func Zones(site string) []string {
	var zones []string
	if object, found := Cache.Get("zones" + site); found {
		zones = object.([]string)
	} else {
		err := db.Select(&zones, `SELECT zone FROM locations WHERE site=$1 GROUP BY zone`, site)
		if err != nil {
			fmt.Println(err)
		}
		Cache.Set("zones"+site, zones, cache.NoExpiration)
	}

	return zones
}
