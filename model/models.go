package model

import (
	"fmt"
	"log"
	"time"

	"github.com/jmoiron/sqlx"
	_ "github.com/lib/pq"
	"github.com/pmylund/go-cache"
)

var Cache = cache.New(2*time.Minute, 30*time.Second)
var db *sqlx.DB

func init() {
	var err error
	db, err = sqlx.Open("postgres", "user=mca dbname=foodtruck sslmode=disable")
	if err != nil {
		log.Fatal(err)
	}
}

type Marker struct {
	ID      string `json:"id"`
	Name    string `json:"name"`
	Lat     string `json:"lat"`
	Long    string `json:"long"`
	Display string `json:"display"`
}

func Markers(hours int) []*Marker {
	t := time.Now().Add(time.Duration(-1*hours) * (time.Minute * 60)).Unix()

	m := []*Marker{}
	err := db.Select(&m, `SELECT trucks.id AS id, trucks.name, locations.display AS display,
		locations.lat AS lat, locations.long AS long FROM trucks LEFT JOIN locations ON (locations.id = trucks.loc)
		WHERE lastupdate > $1 AND display IS NOT NULL`, t)
	if err != nil {
		fmt.Println(err)
	}

	return m
}

/**
 * @apiDefine Image
 * @apiParam {String} id The foursquare id of the image
 * @apiParam {String} suffix The end of the url to get the image. Should contain a leading /
 * @apiParam {String=public,private} [visibility=public] The images visibility on foursquare
 * @apiParam {String} twitname The twitter name that these pictures are associated with
 * @apiParam {Bool} menu If this image is a menu picture
 */
type Image struct {
	ID         string `json:"id"`
	Suffix     string `json:"suffix"`
	Visibility string `json:"visibility"`
	Twitname   string `json:"twitname"`
	Menu       bool   `json:"menu"`
}

func GetImages(visiblity string) []*Image {
	var images []*Image
	err := db.Select(&images, `SELECT * FROM images WHERE visibility=$1 ORDER BY id`, visiblity)
	if err != nil {
		fmt.Println(err)
	}
	return images
}

func GetTruckImages(twitname string) []*Image {
	var images []*Image
	err := db.Select(&images, `SELECT * FROM images WHERE twitname = $1 ORDER BY menu DESC, id`, twitname)
	if err != nil {
		fmt.Println(err)
	}
	return images
}

func GetImage(id string) Image {
	var i Image
	err := db.QueryRowx(`SELECT * FROM images WHERE id=$1`, id).StructScan(&i)
	if err != nil {
		fmt.Println(err)
	}
	return i
}

func AddImage(i Image) bool {
	result, err := db.Exec(`INSERT INTO images (id, suffix, twitname, menu) VALUES ($1, $2, $3, $4)`,
		i.ID, i.Suffix, i.Twitname, i.Menu)
	if err != nil {
		fmt.Println(err)
	}
	if result != nil {
		trucks := getIdsFromTwitname(i.Twitname)
		for i := 0; i < len(trucks); i++ {
			Cache.Delete("truck" + trucks[i].ID)
		}
		return true
	}
	return false
}

func DeleteImage(id string) bool {
	i := GetImage(id)
	result, err := db.Exec(`DELETE FROM images WHERE id=$1`, id)
	if err != nil {
		fmt.Println(err)
	}
	if result != nil {
		trucks := getIdsFromTwitname(i.Twitname)
		for i := 0; i < len(trucks); i++ {
			Cache.Delete("truck" + trucks[i].ID)
		}
		return true
	}
	return false
}

func UpdateImage(i Image) bool {
	result, err := db.NamedExec(`UPDATE images SET (suffix, visibility, twitname, menu) = (:suffix, :visibility, :twitname, :menu) WHERE id=:id`, i)
	if err != nil {
		fmt.Println(err)
	}
	if result != nil {
		return true
	}
	return false
}
