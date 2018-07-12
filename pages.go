package main

import (
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

	vars := make(jet.VarMap)
	vars.Set("spots", spots)
	if err := template.Execute(w, vars, nil); err != nil {
		panic(err)
	}
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
}