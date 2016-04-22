package model

import (
	"fmt"
	"time"
)

type Marker struct {
	ID      string `json:"id"`
	Name    string `json:"name"`
	Lat     string `json:"lat"`
	Long    string `json:"long"`
	Display string `json:"display"`
}

func Markers(site string, hours int) []*Marker {
	m := &[]*Marker{}
	t := time.Now().Add(time.Duration(-1*hours) * (time.Minute * 60)).Unix()
	err := db.Select(m, `SELECT trucks.id AS id, trucks.name, coalesce(locations.display,'') AS display,
			locations.lat AS lat, locations.long AS long FROM trucks LEFT JOIN locations ON (locations.id = ANY(trucks.locs))
			WHERE lastupdate > $1 AND display IS NOT NULL AND trucks.site = $2`, t, site)
	if err != nil {
		fmt.Println(err)
	}
	return *m
}
