package model

import "errors"

type Location struct {
	ID      int     `json:"id"`
	Display string  `json:"display"`
	Matcher string  `json:"matcher"`
	Lat     float32 `json:"lat"`
	Long    float32 `json:"long"`
	Zone    string  `json:"zone"`
	Site    string  `json:"site"`
}

// GetLocations returns a map, the key is the site. Holds an slice of locations
func GetLocations() (map[string][]*Location, error) {
	locs := make(map[string][]*Location)

	rows, err := db.Queryx(`SELECT * FROM locations ORDER BY id`)
	if err != nil {
		return nil, err
	}
	for rows.Next() {
		temp := Location{}
		rows.StructScan(&temp)
		locs[temp.Site] = append(locs[temp.Site], &temp)
	}
	return locs, nil
}

// Zones returns a string slice of all zones for site
func GetZones(site string) ([]string, error) {
	var zones []string
	err := db.Select(&zones, `SELECT zone FROM locations WHERE site=$1 GROUP BY zone`, site)
	return zones, err
}

func AddLocation(l Location) error {
	if l.Display == "" || l.Matcher == "" || l.Lat == 0 || l.Long == 0 || l.Zone == "" || l.Site == "" {
		return errors.New("Display, Matcher, Lat, Long, Zone, and Site are required")
	}
	_, err := db.NamedExec(
		`INSERT INTO locations (display, matcher, lat, long, zone, site)
			VALUES (:display, :matcher, :lat, :long, :zone, :site)`, l)
	return err
}

func UpdateLocation(l Location) error {
	if l.Display == "" || l.Matcher == "" || l.Lat == 0 || l.Long == 0 || l.Zone == "" || l.Site == "" {
		return errors.New("Display, Matcher, Lat, Long, Zone, and Site are required")
	}
	_, err := db.NamedExec(
		`UPDATE locations SET (display, matcher, lat, long) = (:display, :matcher, :lat, :long) WHERE id=:id`, l)
	return err
}

func GetLocation(id string) (Location, error) {
	var l Location
	err := db.Get(&l, `SELECT * FROM locations WHERE id=$1`, id)
	return l, err
}
