package main

import (
	"net/http"
	"strconv"

	"github.com/go-chi/render"
)

func adminAddLocation(w http.ResponseWriter, r *http.Request) {
	c := pageContext{
		Version: Version,
	}

	template, _ := View.GetTemplate("admin/location.jet")
	if err := template.Execute(w, nil, c); err != nil {
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
