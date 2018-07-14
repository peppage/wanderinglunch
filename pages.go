package main

import (
	"io"
	"io/ioutil"
	"net/http"

	"github.com/CloudyKit/jet"
	"github.com/go-chi/chi"
)

func index(w http.ResponseWriter, r *http.Request) {
	site := chi.URLParam(r, "site")
	spots, err := getSpots(site, 2000)
	if err != nil {
		w.Write([]byte(err.Error()))
	}

	template, _ := View.GetTemplate("index.jet")
	if len(spots) == 0 {
		template, _ = View.GetTemplate("index-notrucks.jet")
	}

	vars := make(jet.VarMap)
	vars.Set("spots", spots)
	if err := template.Execute(w, vars, nil); err != nil {
		panic(err)
	}

	io.Copy(ioutil.Discard, r.Body)
	defer r.Body.Close()
}

func allTrucks(w http.ResponseWriter, r *http.Request) {
	site := chi.URLParam(r, "site")
	spots, err := getSpots(site, 2000)
	if err != nil {
		w.Write([]byte(err.Error()))
	}

	template, _ := View.GetTemplate("alltrucks.jet")

	vars := make(jet.VarMap)
	vars.Set("spots", spots)
	if err := template.Execute(w, vars, nil); err != nil {
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

	template, _ := View.GetTemplate("alltrucks.jet")

	vars := make(jet.VarMap)
	vars.Set("spots", spots)
	if err := template.Execute(w, vars, nil); err != nil {
		panic(err)
	}

	io.Copy(ioutil.Discard, r.Body)
	defer r.Body.Close()
}
