package main

import (
	"fmt"
	"html/template"
	"log"
	"net/http"
	"time"

	"github.com/jmoiron/sqlx"
	_ "github.com/lib/pq"
	"github.com/unrolled/render"
	"github.com/zenazn/goji"
	"github.com/zenazn/goji/web"
	"github.com/zenazn/goji/web/middleware"
)

var db *sqlx.DB
var renderer *render.Render

func root(c web.C, w http.ResponseWriter, r *http.Request) {

	t := time.Now().Add(-8 * (time.Minute * 60)).Unix()

	var trucks []*Truck
	err := db.Select(&trucks, `SELECT trucks.id AS id, trucks.name, trucks.twitname, trucks.lastupdate, locations.display AS location, 
		locations.hood as hood, images.suffix AS image FROM trucks LEFT JOIN locations ON (locations.id = trucks.loc) LEFT JOIN
		(SELECT * FROM images WHERE  menu='t') AS images ON (images.twitname = trucks.twitname) WHERE lastupdate > $1 ORDER BY lat DESC`, t)
	if err != nil {
		fmt.Println(err)
	}

	var m []*Truck
	var b []*Truck

	for i := 0; i < len(trucks); i++ {
		h, _ := trucks[i].Hood.Value()
		if h == "Brooklyn" {
			b = append(b, trucks[i])
		} else {
			m = append(m, trucks[i])
		}
	}

	message := getMessage()

	data := make(map[string]interface{})
	data["title"] = "Wandering Lunch: NYC Food Truck Finder"
	data["m"] = m
	data["b"] = b
	data["total"] = len(m) + len(b)
	data["message"] = template.HTML(message.Message)

	renderer.HTML(w, http.StatusOK, "index", data)
}

func allTrucks(c web.C, w http.ResponseWriter, r *http.Request) {
	var trucks []*Truck
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
		IndentJSON:    false,
		IsDevelopment: true,
		Layout:        "layout",
	})

	http.Handle("/static/", http.StripPrefix("/static/", http.FileServer(http.Dir("./static/"))))
}

func main() {
	goji.Get("/", root)
	goji.Get("/truck/:id", truck)
	goji.Get("/alltrucks", allTrucks)
	goji.Get("/map", maps)
	goji.Get("/support", support)

	admin := web.New()
	goji.Handle("/admin/*", admin)
	goji.Get("/admin", http.RedirectHandler("/admin/", 301))
	admin.Use(middleware.SubRouter)
	admin.Get("/", adminRoot)
	admin.Get("/fix/:id", adminFix)

	api := web.New()
	goji.Handle("/api/*", api)
	api.Use(middleware.SubRouter)
	goji.Get("/api", http.RedirectHandler("/api/", 301))
	api.Get("/trucks", trucks)
	api.Get("/trucks/current", trucksCurrent)
	api.Get("/trucks/failures", failures)
	api.Post("/trucks/add", truckSave)
	api.Get("/trucks/:id", truckById)
	api.Get("/trucks/:id/images", truckImages)
	api.Get("/trucks/:id/tweets/:page", tweets)
	api.Get("/trucks/:id/converted/:page", tweetsWithSubs)
	api.Post("/trucks/:id/update", truckUpdate)
	api.Delete("/trucks/:id/delete", truckDelete)
	api.Get("/markers/current", currentMarkers)
	api.Get("/subs", substitutions)
	api.Get("/subs/:id", subsitution)
	api.Post("/subs/add", subAdd)
	api.Delete("/subs/:id/delete", subDelete)
	api.Get("/locations", locations)
	api.Get("/locations/:id", location)
	api.Post("/locations/add", locationSave)
	api.Delete("/trucks/:id/delete", locationDelete)
	api.Get("/images", images)
	api.Get("/images/:id", image)
	api.Post("/images/add", imageSave)
	api.Delete("/images/:id/delete", imageDelete)
	api.Get("/messages/current", message)
	api.Post("/messages/add", messageSave)

	goji.Serve()
}
