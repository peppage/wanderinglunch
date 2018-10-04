package main

import (
	"database/sql"
	"encoding/json"
	"net/http"

	"github.com/CloudyKit/jet"
	"github.com/go-chi/chi"
	"github.com/go-chi/render"
)

type pageContext struct {
	Site    string
	Version string
}

type contextKey struct {
	name string
}

const sixMonths = 4383

func index(w http.ResponseWriter, r *http.Request) {
	site := chi.URLParam(r, "site")
	spots, err := getSpots(site, 8)
	if err != nil {
		render.Render(w, r, ErrSqlError(err))
		return
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
		render.Render(w, r, ErrViewError(err))
		return
	}
}

func allTrucks(w http.ResponseWriter, r *http.Request) {
	site := chi.URLParam(r, "site")
	trucks, err := getTrucks(site, sixMonths)
	if err != nil {
		render.Render(w, r, ErrSqlError(err))
		return
	}

	c := pageContext{
		Site:    site,
		Version: Version,
	}

	template, _ := View.GetTemplate("alltrucks.jet")

	vars := make(jet.VarMap)
	vars.Set("trucks", trucks)
	if err := template.Execute(w, vars, c); err != nil {
		render.Render(w, r, ErrViewError(err))
		return
	}
}

func mapPage(w http.ResponseWriter, r *http.Request) {
	siteName := chi.URLParam(r, "site")
	spots, err := getMarkers(siteName, 8)
	if err != nil {
		render.Render(w, r, ErrSqlError(err))
		return
	}

	bytes, err := json.Marshal(spots)
	if err != nil {
		panic(err)
	}

	site, err := getSite(siteName)
	if err != nil {
		render.Render(w, r, ErrSqlError(err))
		return
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
		render.Render(w, r, ErrViewError(err))
		return
	}
}

func truckPage(w http.ResponseWriter, r *http.Request) {
	id := chi.URLParam(r, "id")
	truck, err := getTruck(id)
	if err != nil {
		if err == sql.ErrNoRows {
			render.Render(w, r, ErrNotFound)
			return
		}
		render.Render(w, r, ErrSqlError(err))
		return
	}

	c := pageContext{
		Site:    truck.Site,
		Version: Version,
	}

	template, _ := View.GetTemplate("truck.jet")
	vars := make(jet.VarMap)
	vars.Set("truck", truck)
	if err := template.Execute(w, vars, c); err != nil {
		render.Render(w, r, ErrViewError(err))
		return
	}
}

func login(w http.ResponseWriter, r *http.Request) {

	c := pageContext{
		Version: Version,
	}

	template, _ := View.GetTemplate("login.jet")
	if err := template.Execute(w, nil, c); err != nil {
		render.Render(w, r, ErrViewError(err))
		return
	}
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
}

func feedback(w http.ResponseWriter, r *http.Request) {
	site := chi.URLParam(r, "site")

	c := pageContext{
		Site:    site,
		Version: Version,
	}

	template, _ := View.GetTemplate("feedback.jet")
	if err := template.Execute(w, nil, c); err != nil {
		render.Render(w, r, ErrViewError(err))
		return
	}
}
