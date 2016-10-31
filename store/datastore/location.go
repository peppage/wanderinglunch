package datastore

import (
	"errors"
	"wanderinglunch/model"
)

// GetLocations returns a map, the key is the site. Holds an slice of locations
func (db *datastore) GetLocations() (map[string][]*model.Location, error) {
	locs := make(map[string][]*model.Location)

	rows, err := db.Queryx(getLocationsQuery)
	if err != nil {
		return nil, err
	}
	for rows.Next() {
		temp := model.Location{}
		rows.StructScan(&temp)
		locs[temp.Site] = append(locs[temp.Site], &temp)
	}
	return locs, nil
}

// GetZones returns a string slice of all zones for site
func (db *datastore) GetZones(site string) ([]string, error) {
	var zones []string
	err := db.Select(&zones, getZonesQuery, site)
	return zones, err
}

func (db *datastore) AddLocation(l *model.Location) error {
	if l.Display == "" || l.Matcher == "" || l.Lat == 0 || l.Long == 0 || l.Zone == "" || l.Site == "" {
		return errors.New("Display, Matcher, Lat, Long, Zone, and Site are required")
	}
	_, err := db.NamedExec(addLocationQuery, l)
	return err
}

func (db *datastore) UpdateLocation(l *model.Location) error {
	if l.Display == "" || l.Matcher == "" || l.Lat == 0 || l.Long == 0 || l.Zone == "" || l.Site == "" {
		return errors.New("Display, Matcher, Lat, Long, Zone, and Site are required")
	}
	_, err := db.NamedExec(updateLocationQuery, l)
	return err
}

func (db *datastore) GetLocation(id string) (*model.Location, error) {
	var l = new(model.Location)
	err := db.Get(l, getLocationQuery, id)
	return l, err
}

const getLocationsQuery = `
SELECT id,
       display,
       matcher,
       lat,
       long,
       zone,
       site
FROM   locations
ORDER  BY id 
`

const getZonesQuery = `
SELECT zone
FROM   locations
WHERE  site = $1
GROUP  BY zone
`

const addLocationQuery = `
INSERT INTO locations
            (display,
             matcher,
             lat,
             long,
             zone,
             site)
VALUES      (:display,
             :matcher,
             :lat,
             :long,
             :zone,
             :site)
`

const updateLocationQuery = `
UPDATE locations
SET    ( display, matcher, lat, long ) = ( :display, :matcher, :lat, :long )
WHERE  id = :id
`

const getLocationQuery = `
SELECT id,
       display,
       matcher,
       lat,
       long,
       zone,
       site
FROM   locations
WHERE  id = $1
`
