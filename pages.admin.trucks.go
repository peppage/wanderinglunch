package main

import (
	"net/http"

	"wanderinglunch/models"

	"github.com/CloudyKit/jet"
	"github.com/go-chi/render"
)

func adminAddTruck(w http.ResponseWriter, r *http.Request) {
	c := pageContext{
		Site:    &models.Site{},
		Version: Version,
	}

	template, _ := View.GetTemplate("admin/truck.jet")
	vars := make(jet.VarMap)
	vars.Set("truck", models.Truck{})
	if err := template.Execute(w, vars, c); err != nil {
		render.Render(w, r, ErrViewError(err))
		return
	}
}

func adminAddTruckHandle(w http.ResponseWriter, r *http.Request) {
	req, err := parseTruckRequest(r)
	if err != nil {
		render.Render(w, r, ErrBadRequest(err))
		return
	}

	err = saveTruck(req)
	if err != nil {
		render.Render(w, r, ErrSqlError(err))
		return
	}

	http.Redirect(w, r, "/admin/truck/"+req.Twitter, http.StatusSeeOther)
}

func adminTrucks(w http.ResponseWriter, r *http.Request) {
	c := pageContext{
		Site:    &models.Site{},
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

func adminEditTruck(w http.ResponseWriter, r *http.Request) {
	c := pageContext{
		Site:    &models.Site{},
		Version: Version,
	}

	truck := r.Context().Value(truckCtx).(*models.Truck)

	template, _ := View.GetTemplate("admin/truck.jet")
	vars := make(jet.VarMap)
	vars.Set("truck", truck)
	if err := template.Execute(w, vars, c); err != nil {
		render.Render(w, r, ErrViewError(err))
		return
	}
}

func adminEditTruckHandle(w http.ResponseWriter, r *http.Request) {
	req, err := parseTruckRequest(r)
	if err != nil {
		render.Render(w, r, ErrBadRequest(err))
		return
	}

	err = updateTruck(req)
	if err != nil {
		render.Render(w, r, ErrSqlError(err))
		return
	}

	http.Redirect(w, r, "/admin/truck/"+req.Twitter, http.StatusSeeOther)
}
