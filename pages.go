package main

import (
	"encoding/json"
	"io"
	"io/ioutil"
	"net/http"

	"github.com/CloudyKit/jet"
	"github.com/go-chi/chi"
)

type pageContext struct {
	Site    string
	Version string
}

func index(w http.ResponseWriter, r *http.Request) {
	site := chi.URLParam(r, "site")
	spots, err := getSpots(site, 8)
	if err != nil {
		w.Write([]byte(err.Error()))
	}

	c := pageContext{
		Site:    site,
		Version: Version,
	}

	template, _ := View.GetTemplate("index.jet")
	if len(spots) == 0 {
		template, _ = View.GetTemplate("index-notrucks.jet")
	}

	vars := make(jet.VarMap)
	vars.Set("spots", spots)
	if err := template.Execute(w, vars, c); err != nil {
		panic(err)
	}

	io.Copy(ioutil.Discard, r.Body)
	defer r.Body.Close()
}

func allTrucks(w http.ResponseWriter, r *http.Request) {
	site := chi.URLParam(r, "site")
	trucks, err := getTrucks(site, 2000)
	if err != nil {
		w.Write([]byte(err.Error()))
	}

	c := pageContext{
		Site:    site,
		Version: Version,
	}

	template, _ := View.GetTemplate("alltrucks.jet")

	vars := make(jet.VarMap)
	vars.Set("trucks", trucks)
	if err := template.Execute(w, vars, c); err != nil {
		panic(err)
	}

	io.Copy(ioutil.Discard, r.Body)
	defer r.Body.Close()
}

func mapPage(w http.ResponseWriter, r *http.Request) {
	siteName := chi.URLParam(r, "site")
	spots, err := getMarkers(siteName, 2000)
	if err != nil {
		w.Write([]byte(err.Error()))
	}

	bytes, err := json.Marshal(spots)
	if err != nil {
		panic(err)
	}

	site, err := getSite(siteName)
	if err != nil {
		w.Write([]byte(err.Error()))
	}

	c := pageContext{
		Site:    siteName,
		Version: Version,
	}

	template, _ := View.GetTemplate("map.jet")

	vars := make(jet.VarMap)
	vars.Set("trucks", bytes)
	vars.Set("site", site)
	if err := template.Execute(w, vars, c); err != nil {
		panic(err)
	}

	io.Copy(ioutil.Discard, r.Body)
	defer r.Body.Close()
}

func truckPage(w http.ResponseWriter, r *http.Request) {
	id := chi.URLParam(r, "id")
	truck, err := getTruck(id)
	if err != nil {
		w.Write([]byte(err.Error()))
	}

	c := pageContext{
		Site:    truck.Site,
		Version: Version,
	}

	template, _ := View.GetTemplate("truck.jet")
	vars := make(jet.VarMap)
	vars.Set("truck", truck)
	if err := template.Execute(w, vars, c); err != nil {
		panic(err)
	}

	io.Copy(ioutil.Discard, r.Body)
	defer r.Body.Close()
}

func login(w http.ResponseWriter, r *http.Request) {

	c := pageContext{
		Version: Version,
	}

	template, _ := View.GetTemplate("login.jet")
	if err := template.Execute(w, nil, c); err != nil {
		panic(err)
	}

	io.Copy(ioutil.Discard, r.Body)
	defer r.Body.Close()
}

func loginHandler(w http.ResponseWriter, r *http.Request) {
	req, err := parseLoginRequest(r)
	if err != nil {
		panic(err)
	}

	user, err := getValidUser(req.Username, req.Password)
	if err != nil {
		panic(err)
	}

	storeUser(w, r, user)

	http.Redirect(w, r, "/admin", http.StatusSeeOther)

	io.Copy(ioutil.Discard, r.Body)
	defer r.Body.Close()
}
