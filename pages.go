package main

import (
	"encoding/json"
	"net/http"
	"wanderinglunch/models"

	"github.com/CloudyKit/jet"
	"github.com/go-chi/render"
)

type pageContext struct {
	Site    *models.Site
	Version string
}

const sixMonths = 4383

func index(w http.ResponseWriter, r *http.Request) {
	site := r.Context().Value(siteCtxKey).(*models.Site)
	spots, err := getSpots(site.Name, 8)
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
	site := r.Context().Value(siteCtxKey).(*models.Site)
	trucks, err := getTrucks(site.Name, sixMonths)
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
	site := r.Context().Value(siteCtxKey).(*models.Site)
	spots, err := getMarkers(site.Name, 8)
	if err != nil {
		render.Render(w, r, ErrSqlError(err))
		return
	}

	bytes, err := json.Marshal(spots)
	if err != nil {
		panic(err)
	}

	c := pageContext{
		Site:    site,
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
	truck := r.Context().Value(truckCtxkey).(*models.Truck)

	site, _ := getSite(truck.Site)

	c := pageContext{
		Site:    site,
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
		Site:    &models.Site{},
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
	site := r.Context().Value(siteCtxKey).(*models.Site)

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
