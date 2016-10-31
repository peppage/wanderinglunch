package datastore

import (
	"fmt"
	"time"
	"wanderinglunch/model"
)

const minutesInHour = (time.Minute * 60)

func (db *datastore) Markers(site string, hours int) []*model.Marker {
	m := &[]*model.Marker{}

	hoursPast := time.Duration(-1 * hours)

	t := time.Now().Add(hoursPast * minutesInHour).Unix()
	err := db.Select(m, markersQuery, t, site)
	if err != nil {
		fmt.Println(err)
	}
	return *m
}

const markersQuery = `
SELECT trucks.id                       AS id,
       trucks.NAME,
       COALESCE(locations.display, '') AS display,
       locations.lat                   AS lat,
       locations.long                  AS long
FROM   trucks
       LEFT JOIN locations
              ON ( locations.id = ANY ( trucks.locs ) )
WHERE  lastupdate > $1
       AND display IS NOT NULL
       AND trucks.site = $2 
`
