package datastore

import (
	"errors"
	"math"
	"strconv"
	"time"
	"wanderinglunch/model"
)

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

func (db *datastore) Trucks(site string, hours int, sort string, sortDir string, loc int) ([]*model.Truck, error) {
	var trucks []*model.Truck
	t := time.Now().Add(time.Duration(-1*hours) * (time.Minute * 60)).Unix()

	locSQL := ""
	if loc != 0 {
		locSQL = "AND loc=" + strconv.Itoa(loc)
	}

	rows, err := db.Queryx(`SELECT trucks.id AS id, trucks.name, trucks.twitname, trucks.lastupdate, coalesce(locations.display,'') AS location, 
	        coalesce(locations.zone,'') AS zone, coalesce(images.suffix,'') AS image FROM trucks LEFT JOIN locations ON (locations.id = ANY(trucks.locs)) LEFT JOIN
	        (SELECT * FROM images WHERE  menu='t') AS images ON (images.twitname = trucks.twitname) WHERE lastupdate > $1 `+locSQL+` AND trucks.site = $2 AND trucks.locs IS NOT NULL ORDER BY `+sort+` `+sortDir, t, site)
	if err != nil {
		return nil, err
	}

	trucks = []*model.Truck{}
	for rows.Next() {
		tt := model.Truck{}
		if err := rows.StructScan(&tt); err != nil {
			return nil, err
		}
		tt.Updated = relativeTime(tt.Lastupdate)
		trucks = append(trucks, &tt)
	}

	return trucks, nil
}

func (db *datastore) AllTrucks(site string) ([]*model.Truck, error) {
	rows, err := db.Queryx(allTrucksQuery, site)

	if err != nil {
		return nil, err
	}
	trucks := []*model.Truck{}
	for rows.Next() {
		tt := model.Truck{}
		if err := rows.StructScan(&tt); err != nil {
			return nil, err
		}
		tt.Updated = relativeTime(tt.Lastupdate)
		trucks = append(trucks, &tt)
	}
	return trucks, nil
}

func (db *datastore) GetTruck(id string) ([]*model.Truck, error) {
	trucks := []*model.Truck{}
	err := db.Select(&trucks, getTruckQuery, id)
	if err != nil {
		return nil, err
	}
	if len(trucks) > 0 {
		trucks[0].Updated = relativeTime(trucks[0].Lastupdate)
		trucks[0].Tweets, err = db.GetTweets(trucks[0].Twitname)
		if err != nil {
			return nil, err
		}
		images, err := db.GetImages(trucks[0].Twitname)
		if err != nil {
			return nil, err
		}
		trucks[0].Images = images
	}

	return trucks, nil
}

// GetTwitNames returns a map, key is site, with a slice of twitnames.
func (db *datastore) GetTwitNames(archive bool) (map[string][]string, error) {
	trucks := make(map[string][]string)
	rows, err := db.Queryx(getTwitNamesQuery, archive)
	if err != nil {
		return nil, err
	}

	for rows.Next() {
		var twitname string
		var site string
		if err := rows.Scan(&twitname, &site); err != nil {
			return nil, err
		}
		trucks[site] = append(trucks[site], twitname)
	}
	return trucks, nil
}

func (db *datastore) UpdateLocs(twitname string, locs []int, lastUpdate int64) error {
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

func (db *datastore) LastUpdate(siteName string) (int64, error) {
	var lastUpdate int64
	err := db.Get(&lastUpdate, lastUpdateQuery, siteName)
	return lastUpdate, err
}

func (db *datastore) GetFailedUpdates(siteName string) ([]*model.Truck, error) {
	now := time.Now()
	t1 := now.Add(-24 * (time.Minute * 60)).Unix()
	t2 := time.Date(now.Year(), now.Month(), now.Day(), 0, 0, 0, 0, now.Location()).Unix() // Start of the day

	var trucks []*model.Truck
	err := db.Select(&trucks, getFailedUpdatesQuery, t1, t2, siteName)
	return trucks, err
}

// Can switch add/save to upsert after updating postgres

func (db *datastore) AddTruck(t *model.Truck) error {
	if t.ID == "" || t.Twitname == "" || t.Name == "" || t.Site == "" {
		return errors.New("Id, Twitname, Name, and Site are required")
	}
	_, err := db.Exec(addTruckQuery, t.ID, t.Name, t.Twitname, t.Weburl, t.Type, t.About, t.Foursquare, t.Site)
	return err
}

func (db *datastore) UpdateTruck(t *model.Truck) error {
	_, err := db.Exec(updateTruckQuery,
		t.Name, t.Twitname, t.Weburl, t.Type, t.About, t.Foursquare, t.Archive, t.ID)
	return err
}

const allTrucksQuery = `
SELECT trucks.id AS id,
       trucks.NAME,
       trucks.twitname,
       trucks.lastupdate,
       trucks.foursquare,
       trucks.archive
FROM   trucks
WHERE  trucks.site = $1
ORDER  BY trucks.NAME 
`

const getTruckQuery = `
SELECT trucks.id                       AS id,
       trucks.NAME,
       trucks.twitname,
       trucks.type,
       trucks.lastupdate,
       trucks.site,
       trucks.about,
       trucks.foursquare,
       trucks.weburl,
       trucks.archive,
       COALESCE(locations.display, '') AS location,
       COALESCE(locations.zone, '')    AS zone
FROM   trucks
       LEFT JOIN locations
              ON ( locations.id = ANY ( trucks.locs ) )
WHERE  trucks.id = $1
        OR trucks.twitname = $1 
`
const getTwitNamesQuery = `
SELECT twitname,
       site
FROM   trucks
WHERE  archive = $1
ORDER  BY twitname 
`

const lastUpdateQuery = `
SELECT lastupdate
FROM   trucks
WHERE  site = $1
ORDER  BY lastupdate DESC
LIMIT  1 
`

const getFailedUpdatesQuery = `
SELECT trucks.twitname
FROM   trucks
       LEFT JOIN tweets
              ON trucks.twitname = tweets.twitname
WHERE  lastupdate < $1
       AND time > $2
       AND site = $3
GROUP  BY trucks.twitname 
`

const addTruckQuery = `
INSERT INTO trucks
            (id,
             NAME,
             twitname,
             weburl,
             type,
             about,
             foursquare,
             site)
VALUES      ($1,
             $2,
             $3,
             $4,
             $5,
             $6,
             $7,
             $8) 
`

const updateTruckQuery = `
UPDATE trucks
SET    ( NAME, twitname, weburl, type,
         about, foursquare, archive ) = ( $1, $2, $3, $4,
                                          $5, $6, $7 )
WHERE  id = $8
`
