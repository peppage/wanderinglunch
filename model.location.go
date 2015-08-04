package main

import "fmt"

type Location struct {
	ID      int    `json:"id"`
	Display string `json:"display"`
	Matcher string `json:"matcher"`
	Region  string `json:"region"`
	Lat     string `json:"lat"`
	Long    string `json:"long"`
	Hood    string `json:"hood"`
	Zone    string `json:"zone"`
	Site    string `json:"site"`
}

func getLocations() []*Location {
	var locs []*Location
	err := db.Select(&locs, `SELECT * FROM locations ORDER BY id`)
	if err != nil {
		fmt.Println(err)
	}
	return locs
}

func getLocation(id string) Location {
	var l Location
	err := db.QueryRowx(`SELECT * FROM locations WHERE id=$1`, id).StructScan(&l)
	if err != nil {
		fmt.Println(err)
	}
	return l
}

func getLocationByDisplay(display string) Location {
	var l Location
	err := db.QueryRowx(`SELECT * FROM locations WHERE display=$1`, display).StructScan(&l)
	if err != nil {
		fmt.Println(err)
	}
	return l
}

func addLocation(l Location) bool {
	fmt.Println(l)
	result, err := db.NamedExec(
		`INSERT INTO locations (display, matcher, region, lat, long, hood, zone, site) VALUES (:display, :matcher, :region, :lat, :long, :hood, :zone, :site)`, l)
	if err != nil {
		fmt.Println(err)
	}
	if result != nil {
		return true
	}
	return false
}

func deleteLocation(id string) bool {
	result, err := db.Exec(`DELETE FROM locations WHERE id = $1`, id)
	if err != nil {
		fmt.Println(err)
	}
	if result != nil {
		return true
	}
	return false
}

func updateLocation(l Location) bool {
	result, err := db.NamedExec(
		`UPDATE locations SET (display, matcher, region, lat, long, hood) = (:display, :matcher, :region, :lat, :long, :hood) WHERE id=:id`, l)
	if err != nil {
		fmt.Println(err)
	}
	if result != nil {
		return true
	}
	return false
}
