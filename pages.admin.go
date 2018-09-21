package main

import (
	"context"
	"net/http"
	"strconv"

	"github.com/go-chi/render"
)

func adminIndex(w http.ResponseWriter, r *http.Request) {
	c := pageContext{
		Version: Version,
	}

	template, _ := View.GetTemplate("admin/index.jet")
	if err := template.Execute(w, nil, c); err != nil {
		panic(err)
	}
}

func adminAddTruck(w http.ResponseWriter, r *http.Request) {
	c := pageContext{
		Version: Version,
	}

	template, _ := View.GetTemplate("admin/truck.jet")
	if err := template.Execute(w, nil, c); err != nil {
		panic(err)
	}
}

func adminAddTruckHandle(w http.ResponseWriter, r *http.Request) {
	req, err := parseTruckRequest(r)
	if err != nil {
		*r = *r.WithContext(context.WithValue(r.Context(), statusKey, http.StatusBadRequest))
		return
	}

	err = saveTruck(req)
	if err != nil {
		*r = *r.WithContext(context.WithValue(r.Context(), statusKey, http.StatusInternalServerError))
		return
	}

	http.Redirect(w, r, "/admin/truck/"+req.Twitter, http.StatusSeeOther)
}

func adminAddSub(w http.ResponseWriter, r *http.Request) {
	c := pageContext{
		Version: Version,
	}

	template, _ := View.GetTemplate("admin/sub.jet")
	if err := template.Execute(w, nil, c); err != nil {
		panic(err)
	}
}

func adminAddSubHandle(w http.ResponseWriter, r *http.Request) {
	req, err := parseSubRequest(r)
	if err != nil {
		*r = *r.WithContext(context.WithValue(r.Context(), statusKey, http.StatusBadRequest))
		return
	}

	sub, err := saveSub(req)
	if err != nil {
		*r = *r.WithContext(context.WithValue(r.Context(), statusKey, http.StatusInternalServerError))
		return
	}

	id := strconv.FormatInt(sub.ID, 10)

	http.Redirect(w, r, "/admin/sub/"+id, http.StatusSeeOther)
}

func adminAddLocation(w http.ResponseWriter, r *http.Request) {
	c := pageContext{
		Version: Version,
	}

	template, _ := View.GetTemplate("admin/location.jet")
	if err := template.Execute(w, nil, c); err != nil {
		panic(err)
	}
}

func adminAddLocationHandle(w http.ResponseWriter, r *http.Request) {
	req, err := parseLocationRequest(r)
	if err != nil {
		*r = *r.WithContext(context.WithValue(r.Context(), statusKey, http.StatusBadRequest))
		return
	}

	loc, err := saveLocation(req)
	if err != nil {
		*r = *r.WithContext(context.WithValue(r.Context(), statusKey, http.StatusInternalServerError))
		return
	}

	id := strconv.FormatInt(loc.ID, 10)

	http.Redirect(w, r, "/admin/loc/"+id, http.StatusSeeOther)
}

func adminTrucks(w http.ResponseWriter, r *http.Request) {
	c := pageContext{
		Version: Version,
	}

	template, _ := View.GetTemplate("admin/trucks.jet")
	if err := template.Execute(w, nil, c); err != nil {
		render.Render(w, r, ErrViewError(err))
		return
	}
}

func adminAPITrucks(w http.ResponseWriter, r *http.Request) {
	trucks, err := getAllTrucksForSite("nyc")
	if err != nil {
		render.Render(w, r, ErrSqlError(err))
		return
	}

	render.RenderList(w, r, NewTruckListResponse(trucks))
}
