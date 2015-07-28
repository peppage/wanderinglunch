package main

import(
	"fmt"
	"time"
)

type Message struct {
	Message string
}

type Marker struct {
	Id	 	string
	Name 	string
	Lat  	string
	Long    string
	Display string
}

func getCurrentMarkers() []*Marker {
	t := time.Now().Add(-8 * (time.Minute * 60)).Unix()

	var m []*Marker
	err := db.Select(&m, `SELECT trucks.id AS id, trucks.name, locations.display AS display,
		locations.lat AS lat, locations.long AS long FROM trucks LEFT JOIN locations ON (locations.id = trucks.loc)
		WHERE lastupdate > $1`, t)
	if err != nil {
		fmt.Println(err)
	}

	return m
}

type Sub struct {
	Id          int
	Regex 	    string
	Replacement string
}

func getSubs() []*Sub {
	var subs []*Sub
	err := db.Select(&subs, `SELECT regex, replacement, id FROM subs ORDER BY id`)
	if err != nil {
		fmt.Println(err)
	}
	return subs
}

func getSub(id string) Sub {
	var s Sub
	err := db.QueryRowx(`SELECT regex, replacement, id FROM subs WHERE id=$1`, id).StructScan(&s)
	if err != nil {
		fmt.Println(err)
	}

	return s
}

type Location struct {
	Id      int
	Display string
	Matcher string
	Region  string
	Lat     string
	Long    string
	Hood    string
}

func getLocations() []*Location {
	var locs []*Location
	err := db.Select(&locs, `SELECT * FROM locations ORDER BY id`)
	if err != nil {
		fmt.Println(err)
	}
	return locs
}

func getLocation(id int) Location {
	var l Location
	err := db.QueryRowx(`SELECT * FROM locations WHERE id=$1`, id).StructScan(&l)
	if err != nil {
		fmt.Println(err)
	}
	return l
}

type Image struct {
	Id         string
	Suffix     string
	Visibility string
	Twitname   string
	Menu	   bool
}

func getImages() []*Image {
	var images []*Image
	err := db.Select(&images, `SELECT * FROM images ORDER BY id`)
	if err != nil {
		fmt.Println(err)
	}
	return images
}

func getImage(id string) Image {
	var i Image
	err := db.QueryRowx(`SELECT * FROM images WHERE id=$1`, id).StructScan(&i)
	if err != nil {
		fmt.Println(err)
	}
	return i
}

func addImage(i Image) bool {
	result, err := db.Exec(`INSERT INTO images (id, suffix, twitname, menu) VALUES ($1, $2, $3, $4)`,
		i.Id, i.Suffix, i.Twitname, i.Menu)
	if err != nil {
		fmt.Println(err)
	}
	if result != nil {
		return true
	}
	return false
}

func deleteImage(id string) bool {
	result, err := db.Exec(`DELETE FROM images WHERE id=$1`, id)
	if err != nil {
		fmt.Println(err)
	}
	if result != nil {
		return true
	}
	return false
}

