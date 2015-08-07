package main

import (
	"fmt"
	"net/http"
	"time"

	"github.com/zenazn/goji/web"
)

func adminRoot(c web.C, w http.ResponseWriter, r *http.Request) {
	t1 := time.Now().Add(-24 * (time.Minute * 60)).Unix()
	now := time.Now()
	t2 := time.Date(now.Year(), now.Month(), now.Day(), 0, 0, 0, 0, now.Location()).Unix()

	var trucks []*Truck
	err := db.Select(&trucks, `SELECT twitname, id FROM trucks WHERE lastupdate < $1 AND lastupdate > $2`, t1, t2)
	if err != nil {
		fmt.Println(err)
	}

	data := make(map[string]interface{})
	data["trucks"] = trucks
	data["title"] = "Wandering Lunch: NYC Food Truck Finder | Admin"
	data["admin"] = true

	renderer.HTML(w, http.StatusOK, "admin/index", data)
}

func adminFix(c web.C, w http.ResponseWriter, r *http.Request) {
	t := getTruck(c.URLParams["id"])
	if t.ID == "" {
		http.Redirect(w, r, "/admin", http.StatusNotFound)
		return
	}

	data := make(map[string]interface{})
	data["truck"] = t
	data["title"] = "Wandering Lunch: NYC Food Truck Finder | Admin - Fixing " + t.Name
	data["admin"] = true

	renderer.HTML(w, http.StatusOK, "admin/fix", data)
}

func adminNewLoc(c web.C, w http.ResponseWriter, r *http.Request) {
	data := make(map[string]interface{})
	data["title"] = "Wandering Lunch: NYC Food Truck Finder | Admin - Add Location"
	data["id"] = c.URLParams["tweetId"]
	data["admin"] = true

	renderer.HTML(w, http.StatusOK, "admin/newloc", data)
}

func adminLocs(c web.C, w http.ResponseWriter, r *http.Request) {
	data := make(map[string]interface{})
	data["title"] = "Wandering Lunch: NYC Food Truck Finder | Admin - Locations"
	data["admin"] = true

	renderer.HTML(w, http.StatusOK, "admin/locations", data)
}

func adminEditLoc(c web.C, w http.ResponseWriter, r *http.Request) {
	data := make(map[string]interface{})
	data["title"] = "Wandering Lunch: NYC Food Truck Finder | Admin - Location " + c.URLParams["id"]
	data["admin"] = true
	data["id"] = c.URLParams["id"]

	renderer.HTML(w, http.StatusOK, "admin/location", data)
}

func adminTrucks(c web.C, w http.ResponseWriter, r *http.Request) {
	data := make(map[string]interface{})
	data["title"] = "Wandering Lunch: NYC Food Truck Finder | Admin - Trucks "
	data["admin"] = true

	renderer.HTML(w, http.StatusOK, "admin/trucks", data)
}

func adminEditTruck(c web.C, w http.ResponseWriter, r *http.Request) {
	data := make(map[string]interface{})
	data["title"] = "Wandering Lunch: NYC Food Truck Finder | Admin - Truck " + c.URLParams["id"]
	data["admin"] = true
	data["id"] = c.URLParams["id"]

	renderer.HTML(w, http.StatusOK, "admin/truck", data)
}

func adminNewTruck(c web.C, w http.ResponseWriter, r *http.Request) {
	data := make(map[string]interface{})
	data["title"] = "Wandering Lunch: NYC Food Truck Finder | Admin - Add Truck "
	data["admin"] = true

	renderer.HTML(w, http.StatusOK, "admin/newtruck", data)
}

func adminMessage(c web.C, w http.ResponseWriter, r *http.Request) {
	data := make(map[string]interface{})
	data["title"] = "Wandering Lunch: NYC Food Truck Finder | Admin - Message"
	data["admin"] = true

	renderer.HTML(w, http.StatusOK, "admin/message", data)
}

func adminSubs(c web.C, w http.ResponseWriter, r *http.Request) {
	data := make(map[string]interface{})
	data["title"] = "Wandering Lunch: NYC Food Truck Finder | Admin - Subs"
	data["admin"] = true

	renderer.HTML(w, http.StatusOK, "admin/subs", data)
}

func adminSub(c web.C, w http.ResponseWriter, r *http.Request) {
	data := make(map[string]interface{})
	data["title"] = "Wandering Lunch: NYC Food Truck Finder | Admin - Sub " + c.URLParams["id"]
	data["admin"] = true
	data["id"] = c.URLParams["id"]

	renderer.HTML(w, http.StatusOK, "admin/sub", data)
}
