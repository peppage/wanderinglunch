package main

import (
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
	spots, err := getSpots(site, 2000)
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
	site := chi.URLParam(r, "site")
	spots, err := getSpots(site, 2000)
	if err != nil {
		w.Write([]byte(err.Error()))
	}

	c := pageContext{
		Site:    site,
		Version: Version,
	}

	template, _ := View.GetTemplate("alltrucks.jet")

	vars := make(jet.VarMap)
	vars.Set("spots", spots)
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
