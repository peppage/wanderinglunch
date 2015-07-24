package main

import (
	"fmt"
	"net/http"
	"time"
	"strconv"

	"github.com/zenazn/goji/web"
)

func adminRoot(c web.C, w http.ResponseWriter, r *http.Request) {
	t1 := time.Now().Add(-24 * (time.Minute * 60)).Unix()
	now := time.Now()
	t2 := time.Date(now.Year(), now.Month(), now.Day(), 0, 0, 0, 0, now.Location()).Unix()
	
	trucks := []*Truck{}
	err := db.Select(&trucks, `SELECT twitname, id FROM trucks WHERE lastupdate < $1 AND lastupdate > $2`, t1, t2)
	if err != nil {
		fmt.Println(err)
	}

	data := make(map[string]interface{})
	data["trucks"] = trucks
	data["title"] = "Wandering Lunch: NYC Food Truck Finder | Admin"

	renderer.HTML(w, http.StatusOK, "admin.index", data)
}

func adminFix(c web.C, w http.ResponseWriter, r *http.Request) {
	var t Truck
	err := db.QueryRowx(`SELECT id, name, twitname, weburl, foursquare FROM trucks where id = $1`, c.URLParams["id"]).StructScan(&t)
	if err != nil {
		fmt.Println(err)
		http.Redirect(w, r, "/admin", http.StatusNotFound)
		return
	}

	data := make(map[string]interface{})
	data["truck"] = t
	data["title"] = "Wandering Lunch: NYC Food Truck Finder | Admin - Fixing" + t.Name

	renderer.HTML(w, http.StatusOK, "admin.fix", data)
}

func adminTweets(c web.C, w http.ResponseWriter, r *http.Request) {
	page, _ := strconv.Atoi(c.URLParams["page"])
	tweets := getTweets(c.URLParams["twitname"], 10, page)

	for key := range tweets {
		tweets[key].DoSubs()
	}

	data := make(map[string]interface{})
	data["tweets"] = tweets
	renderer.JSON(w, http.StatusOK, data)
}