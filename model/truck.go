package model

import (
	"errors"
	"fmt"
	"math"
	"strconv"
	"time"

	"github.com/labstack/echo"
	"github.com/pmylund/go-cache"
	"gopkg.in/guregu/null.v2"
	"gopkg.in/guregu/null.v2/zero"
)

/**
 * @apiDefine Truck
 * @apiParam {String} id The id of the truck
 * @apiParam {String} name The visible name of the truck
 * @apiParam {String} twitname The truck's lowercase name on twitter
 * @apiparam {String} site
 * @apiParam {String} [weburl] The homepage
 * @apiParam {String} type What type of food (asian, indian, desert) the truck serves
 * @apiParam {String} [about] A small description
 * @apiParam {String} [foursquare] The Id of the truck on foursquare
 * @apiParam {String} [matcher] Specific words that need to be in the tweet for the address to be accepted
 * @apiParam {String} [matchmethod]
 */
type Truck struct {
	ID          string      `json:"id"`
	Name        string      `json:"name"`
	Twitname    string      `json:"twitname"`
	Weburl      null.String `json:"weburl"`
	Retweeted   bool        `json:"retweeted"`
	Lasttweet   null.Int    `json:"lasttweet"`
	Lastupdate  null.Int    `json:"lastupdate"`
	Updated     string      `json:"updated"`
	Type        string      `json:"type"`
	About       null.String `json:"about"`
	Foursquare  null.String `json:"foursquare"`
	Location    zero.String `json:"location"`
	Loc         null.Int    `json:"loc"`
	Zone        zero.String `json:"zone"`
	Image       null.String `json:"image"`
	Matcher     null.String `json:"matcher"`
	Matchmethod null.String `json:"matchmethod"`
	Tweets      []*Tweet    `json:"tweets"`
	Images      []*Image    `json:"images"`
	Site        string      `json:"site"`
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

func Trucks(hours int, sort string, sortDir string, loc int) []*Truck {
	var trucks []*Truck
	if object, found := Cache.Get("trucks" + strconv.Itoa(hours) + sort + sortDir); found {
		trucks = object.([]*Truck)
	} else {
		t := time.Now().Add(time.Duration(-1*hours) * (time.Minute * 60)).Unix()

		locSql := ""
		if loc != 0 {
			locSql = "AND loc=" + strconv.Itoa(loc)
		}

		trucks = []*Truck{}
		err := db.Select(&trucks, `SELECT trucks.id AS id, trucks.name, trucks.twitname, trucks.lastupdate, locations.display AS location, 
	        locations.zone as zone, images.suffix AS image FROM trucks LEFT JOIN locations ON (locations.id = trucks.loc) LEFT JOIN
	        (SELECT * FROM images WHERE  menu='t') AS images ON (images.twitname = trucks.twitname) WHERE lastupdate > $1 `+locSql+`ORDER BY `+sort+` `+sortDir, t)
		if err != nil {
			fmt.Println(err)
		}
		for i := 0; i < len(trucks); i++ {
			trucks[i].Updated = trucks[i].PrettyDate()
		}
		Cache.Set("trucks"+strconv.Itoa(hours)+sort+sortDir, trucks, cache.DefaultExpiration)
	}
	return trucks
}

func GetFailedUpdates() []*Truck {
	now := time.Now()
	t1 := now.Add(-24 * (time.Minute * 60)).Unix()
	t2 := time.Date(now.Year(), now.Month(), now.Day(), 0, 0, 0, 0, now.Location()).Unix() // Start of the day

	trucks := []*Truck{}
	err := db.Select(&trucks, `SELECT twitname, id FROM trucks WHERE lastupdate < $1 AND lasttweet > $2`, t1, t2)
	if err != nil {
		fmt.Println(err)
	}
	return trucks
}

func GetTruck(id string) Truck {
	var t Truck
	if object, found := Cache.Get("truck" + id); found {
		t = object.(Truck)
	} else {
		err := db.QueryRowx(`SELECT trucks.id AS id, trucks.loc, trucks.name, trucks.twitname, trucks.type, trucks.lastupdate, trucks.type, trucks.about,
		trucks.foursquare, trucks.weburl, trucks.matcher, trucks.matchmethod, locations.display AS location, locations.zone AS zone, 
        images.suffix AS image FROM trucks LEFT JOIN locations ON (locations.id = trucks.loc) LEFT JOIN (SELECT * FROM images WHERE 
        menu='t') AS images ON (images.twitname = trucks.twitname) WHERE trucks.id=$1`, id).StructScan(&t)
		if err != nil {
			fmt.Println(err)
		}
		t.Updated = t.PrettyDate()
		t.Images = GetTruckImages(t.Twitname)
		t.Tweets = GetTweets(t.Twitname, false, false, true)
		Cache.Set("truck"+id, t, cache.DefaultExpiration)
	}

	return t
}

func AddTruck(t Truck) (Truck, error) {
	if t.ID == "" || t.Twitname == "" || t.Name == "" || t.Site == "" {
		return t, errors.New("Id, Twitname, Name, and Site are required")
	}
	result, err := db.Exec(`INSERT INTO trucks (id, name, twitname, weburl, type, about, foursquare, matcher, matchmethod, site) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)`,
		t.ID, t.Name, t.Twitname, t.Weburl, t.Type, t.About, t.Foursquare, t.Matcher, t.Matchmethod, t.Site)
	if err != nil {
		return t, err
	}
	if result != nil {
		Cache.Flush()
		return t, nil
	}
	return t, errors.New("Unknown error")
}

func DeleteTruck(id string) bool {
	result, err := db.Exec(`DELETE FROM trucks where id=$1`, id)
	if err != nil {
		fmt.Println(err)
	}
	if result != nil {
		Cache.Flush()
		return true
	}
	return false
}

func UpdateTruck(t Truck) bool {
	result, err := db.Exec(`UPDATE trucks SET (name, twitname, weburl, type, about, foursquare, matcher, matchmethod) = ($1, $2, $3, $4, $5, $6, $7, $8) WHERE id=$9`,
		t.Name, t.Twitname, t.Weburl, t.Type, t.About, t.Foursquare, t.Matcher, t.Matchmethod, t.ID)
	if err != nil {
		fmt.Println(err)
	}
	if result != nil {
		Cache.Delete("truck" + t.ID)
		return true
	}
	return false
}

func TruckMarshal(c *echo.Context) Truck {
	var t Truck
	t.ID = c.Form("id")
	t.Name = c.Form("name")
	t.Twitname = c.Form("twitname")
	t.Weburl = null.StringFrom(c.Form("weburl"))
	t.Type = c.Form("type")
	t.About = null.StringFrom(c.Form("about"))
	t.Foursquare = null.StringFrom(c.Form("foursquare"))
	t.Matcher = null.StringFrom(c.Form("matcher"))
	t.Matchmethod = null.StringFrom(c.Form("matchmethod"))
	t.Site = c.Form("site")
	return t
}

func getIdsFromTwitname(twitname string) []*Truck {
	trucks := []*Truck{}
	err := db.Select(&trucks, `SELECT trucks.id AS id FROM trucks WHERE twitname = $1`, twitname)
	if err != nil {
		fmt.Println(err)
	}
	return trucks
}
