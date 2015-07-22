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