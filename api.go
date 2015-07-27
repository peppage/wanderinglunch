package main

import (
	"net/http"
	"strconv"
	"database/sql"

	"github.com/zenazn/goji/web"
)

func trucks(c web.C, w http.ResponseWriter, r *http.Request) {
	renderer.JSON(w, http.StatusOK, getTrucks())
}

func trucksCurrent(c web.C, w http.ResponseWriter, r *http.Request) {
	renderer.JSON(w, http.StatusOK, getCurrentTrucks())
}

func truckById(c web.C, w http.ResponseWriter, r *http.Request) {
	truck := getTruck(c.URLParams["id"])
	if truck.Id == "" {
		renderer.JSON(w, http.StatusNotFound, nil)
		return
	}
	renderer.JSON(w, http.StatusOK, truck)
}

func truckImages(c web.C, w http.ResponseWriter, r *http.Request) {

}

func truckMarker(c web.C, w http.ResponseWriter, r *http.Request) {
}

func truckSave(c web.C, w http.ResponseWriter, r *http.Request) {
	var t Truck
	t.Id = r.FormValue("id")
	t.Name = r.FormValue("name")
	t.Twitname = r.FormValue("twitname")
	t.Weburl = sql.NullString { String: r.FormValue("weburl"), Valid: true}
	t.Type = r.FormValue("type")
	t.About = sql.NullString { String: r.FormValue("about"), Valid: true }
	t.Foursquare = sql.NullString { String: r.FormValue("foursquare"), Valid: true }
	if addTruck(t) {
		renderer.JSON(w, http.StatusOK, getTruck(t.Id))
		return
	}
	renderer.JSON(w, http.StatusInternalServerError, nil)
}

func truckUpdate(c web.C, w http.ResponseWriter, r *http.Request) {

}

func truckDelete(c web.C, w http.ResponseWriter, r *http.Request) {
	if deleteTruck(c.URLParams["id"]) {
		renderer.JSON(w, http.StatusNoContent, nil)
		return
	}
	renderer.JSON(w, http.StatusInternalServerError, nil)
}

func currentMarkers(c web.C, w http.ResponseWriter, r *http.Request) {
	renderer.JSON(w, http.StatusOK, getCurrentMarkers())
}

func failures(c web.C, w http.ResponseWriter, r *http.Request) {
}

func tweets(c web.C, w http.ResponseWriter, r *http.Request) {
	page, _ := strconv.Atoi(c.URLParams["page"])
	tweets := getTweets(c.URLParams["id"], 10, page)
	renderer.JSON(w, http.StatusOK, tweets)
}

func tweetsWithSubs(c web.C, w http.ResponseWriter, r *http.Request) {
	page, _ := strconv.Atoi(c.URLParams["page"])
	tweets := getTweets(c.URLParams["id"], 10, page)

	for key := range tweets {
		tweets[key].Contents = tweets[key].Converted()
	}

	renderer.JSON(w, http.StatusOK, tweets)
}

func substitutions(c web.C, w http.ResponseWriter, r *http.Request) {
	renderer.JSON(w, http.StatusOK, getSubs())
}

func subsitution(c web.C, w http.ResponseWriter, r *http.Request) {
	sub := getSub(c.URLParams["id"])
	if sub.Id == 0 {
		renderer.JSON(w, http.StatusNotFound, nil)
		return
	}
	renderer.JSON(w, http.StatusOK, sub)
}

func subSave(c web.C, w http.ResponseWriter, r *http.Request) {
}

func subDelete(c web.C, w http.ResponseWriter, r *http.Request) {
}

func locations(c web.C, w http.ResponseWriter, r *http.Request) {
	renderer.JSON(w, http.StatusOK, getLocations())
}

func location(c web.C, w http.ResponseWriter, r *http.Request) {
	id, _ := strconv.Atoi(c.URLParams["id"])
	loc := getLocation(id)
	if loc.Id == 0 {
		renderer.JSON(w, http.StatusNotFound, nil)
		return
	}
	renderer.JSON(w, http.StatusOK, loc)
}

func locationSave(c web.C, w http.ResponseWriter, r *http.Request) {
}

func images(c web.C, w http.ResponseWriter, r *http.Request) {
	renderer.JSON(w, http.StatusOK, getImages())
}

func image(c web.C, w http.ResponseWriter, r *http.Request) {
	i := getImage(c.URLParams["id"])
	if i.Id == "" {
		renderer.JSON(w, http.StatusNotFound, nil)
		return
	}
	renderer.JSON(w, http.StatusOK, i)
}

func imageSave(c web.C, w http.ResponseWriter, r *http.Request) {
	var i Image
	i.Id = r.FormValue("id")
	i.Suffix = r.FormValue("suffix")
	i.Twitname = r.FormValue("twitname")
	i.Menu, _ = strconv.ParseBool(r.FormValue("menu"))
	if addImage(i) {
		renderer.JSON(w, http.StatusOK, getImage(i.Id))
		return
	}
	renderer.JSON(w, http.StatusInternalServerError, nil)
}

func imageDelete(c web.C, w http.ResponseWriter, r * http.Request) {
	if deleteImage(c.URLParams["id"]) {
		renderer.JSON(w, http.StatusNoContent, nil)
		return
	}
	renderer.JSON(w, http.StatusInternalServerError, nil)
}

func messageSave(c web.C, w http.ResponseWriter, r *http.Request) {
}