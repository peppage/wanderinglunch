package main

import (
	"net/http"
	"strconv"

	"wanderinglunch/models"

	"github.com/CloudyKit/jet"
	"github.com/go-chi/chi"
	"github.com/go-chi/render"
)

func adminAddLocation(w http.ResponseWriter, r *http.Request) {
	c := pageContext{
		Site:    &models.Site{},
		Version: Version,
	}

	template, _ := View.GetTemplate("admin/location.jet")
	vars := make(jet.VarMap)
	vars.Set("loc", models.Location{})
	if err := template.Execute(w, vars, c); err != nil {
		render.Render(w, r, ErrViewError(err))
		return
	}
}

func adminAddLocationHandle(w http.ResponseWriter, r *http.Request) {
	req, err := parseLocationRequest(r)
	if err != nil {
		render.Render(w, r, ErrBadRequest(err))
		return
	}

	loc, err := saveLocation(req)
	if err != nil {
		render.Render(w, r, ErrSqlError(err))
		return
	}

	id := strconv.FormatInt(loc.ID, 10)

	http.Redirect(w, r, "/admin/loc/"+id, http.StatusSeeOther)
}

func adminAPILocations(w http.ResponseWriter, r *http.Request) {
	locs, err := getAllLocations("nyc")
	if err != nil {
		render.Render(w, r, ErrSqlError(err))
		return
	}

	render.RenderList(w, r, NewLocationListResponse(locs))
}

func adminLocations(w http.ResponseWriter, r *http.Request) {
	c := pageContext{
		Site:    &models.Site{},
		Version: Version,
	}

	template, _ := View.GetTemplate("admin/locations.jet")
	if err := template.Execute(w, nil, c); err != nil {
		render.Render(w, r, ErrViewError(err))
		return
	}
}

func adminEditLocation(w http.ResponseWriter, r *http.Request) {
	c := pageContext{
		Site:    &models.Site{},
		Version: Version,
	}

	id := chi.URLParam(r, "id")
	loc, err := getLocation(id)
	if err != nil {
		render.Render(w, r, ErrSqlError(err))
		return
	}

	template, _ := View.GetTemplate("admin/location.jet")
	vars := make(jet.VarMap)
	vars.Set("loc", loc)
	if err := template.Execute(w, vars, c); err != nil {
		render.Render(w, r, ErrViewError(err))
		return
	}
}

func adminEditLocationHandle(w http.ResponseWriter, r *http.Request) {
	id := chi.URLParam(r, "id")
	req, err := parseLocationRequest(r)
	if err != nil {
		render.Render(w, r, ErrBadRequest(err))
		return
	}

	err = updateLocation(id, req)
	if err != nil {
		render.Render(w, r, ErrSqlError(err))
		return
	}

	http.Redirect(w, r, "/admin/location/"+id, http.StatusSeeOther)
}
