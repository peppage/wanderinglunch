package main

import (
	"fmt"
	"log"
	"net/http"
	"time"
	"html/template"

	"github.com/jmoiron/sqlx"
	_ "github.com/lib/pq"
	"github.com/zenazn/goji"
	"github.com/zenazn/goji/web"
	"github.com/unrolled/render"
	"github.com/zenazn/goji/web/middleware"
)

var db *sqlx.DB
var renderer *render.Render

func root(c web.C, w http.ResponseWriter, r *http.Request) {

	t := time.Now().Add(-8 * (time.Minute * 60)).Unix()

	trucks := []*Truck{}
	err := db.Select(&trucks, `SELECT trucks.id AS id, trucks.name, trucks.twitname, trucks.lastupdate, locations.display AS location, 
		locations.hood as hood, images.suffix AS image FROM trucks LEFT JOIN locations ON (locations.id = trucks.loc) LEFT JOIN
		(SELECT * FROM images WHERE  menu='t') AS images ON (images.twitname = trucks.twitname) WHERE lastupdate > $1 ORDER BY lat DESC`, t)
	if err != nil {
		fmt.Println(err)
	}

	m := []*Truck{}
	b := []*Truck{}

	for i := 0; i < len(trucks); i++ {
		h, _ := trucks[i].Hood.Value()
		if h == "Brooklyn" {
			b = append(b, trucks[i])
		} else {
			m = append(m, trucks[i])
		}
	}

	var message Message
	err = db.QueryRowx(`SELECT message FROM messages ORDER BY date DESC LIMIT 1`).StructScan(&message)
	if err != nil {
		fmt.Println(err)
	}

	data := make(map[string]interface{})
	data["title"] = "Wandering Lunch: NYC Food Truck Finder"
	data["m"] = m
	data["b"] = b
	data["total"] = len(m) + len(b)
	data["message"] = template.HTML(message.Message)

	renderer.HTML(w, http.StatusOK, "index", data)
}

func allTrucks(c web.C, w http.ResponseWriter, r *http.Request) {
	trucks := []*Truck{}
	err := db.Select(&trucks, `SELECT trucks.id AS id, trucks.name, trucks.twitname, trucks.lastupdate, locations.display AS location, 
		images.suffix AS image FROM trucks LEFT JOIN locations ON (locations.id = trucks.loc) LEFT JOIN (SELECT * FROM images WHERE 
		menu='t') AS images ON (images.twitname = trucks.twitname) ORDER BY name`)
	if err != nil {
		fmt.Println(err)
	}

	data := make(map[string]interface{})
	data["trucks"] = trucks
	data["title"] = "Wandering Lunch: NYC Food Truck Finder | All Trucks List"
	data["active"] = "trucks"

	renderer.HTML(w, http.StatusOK, "alltrucks", data)
}

func truck(c web.C, w http.ResponseWriter, r *http.Request) {
	var t Truck
	err := db.QueryRowx(`SELECT trucks.id AS id, trucks.name, trucks.twitname, trucks.lastupdate, locations.display AS location, 
		images.suffix AS image FROM trucks LEFT JOIN locations ON (locations.id = trucks.loc) LEFT JOIN (SELECT * FROM images WHERE 
		menu='t') AS images ON (images.twitname = trucks.twitname) WHERE trucks.id=$1`, c.URLParams["id"]).StructScan(&t)
	if err != nil {
		fmt.Println(err)
		http.Redirect(w, r, "/", http.StatusNotFound)
		return
	}

	data := make(map[string]interface{})
	data["truck"] = t
	data["title"] = "Wandering Lunch: NYC Food Truck Finder | " + t.Name

	renderer.HTML(w, http.StatusOK, "truck", data)
}

func maps(c web.C, w http.ResponseWriter, r *http.Request) {
	data := make(map[string]interface{})
	data["title"] = "Wandering Lunch: NYC Food Truck Finder | Map"
	renderer.HTML(w, http.StatusOK, "map", data)
}

func updatedTrucks(c web.C, w http.ResponseWriter, r *http.Request) {
	t := time.Now().Add(-8 * (time.Minute * 60)).Unix()

	m := []*Marker{}
	err := db.Select(&m, `SELECT trucks.id AS id, trucks.name, locations.display AS display,
		locations.lat AS lat, locations.long AS long FROM trucks LEFT JOIN locations ON (locations.id = trucks.loc)
		WHERE lastupdate > $1`, t)
	if err != nil {
		fmt.Println(err)
	}

	data := make(map[string]interface{})
	data["markers"] = m
	renderer.JSON(w, http.StatusOK, data)
}

func support(c web.C, w http.ResponseWriter, r *http.Request) {
	renderer.HTML(w, http.StatusOK, "support", nil)
}

func init() {
	var err error
	db, err = sqlx.Open("postgres", "user=mca dbname=foodtruck sslmode=disable")
	if err != nil {
		log.Fatal(err)
	}

	renderer = render.New(render.Options{
        IndentJSON: false,
        IsDevelopment: true,
        Layout: "layout",
    })

	http.Handle("/static/", http.StripPrefix("/static/", http.FileServer(http.Dir("./static/"))))
}

func main() {
	goji.Get("/", root)
	goji.Get("/truck/:id", truck)
	goji.Get("/alltrucks", allTrucks)
	goji.Get("/map", maps)
	goji.Get("/updatedTrucks", updatedTrucks)
	goji.Get("/support", support)

	admin := web.New()
	goji.Handle("/admin/*", admin)
	goji.Get("/admin", http.RedirectHandler("/admin/", 301))
	admin.Use(middleware.SubRouter)	
	admin.Get("/", adminRoot)
	admin.Get("/fix/:id", adminFix)
	admin.Get("/tweets/:twitname/:page", adminTweets)
	goji.Serve()
}