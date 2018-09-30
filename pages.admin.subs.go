package main

import (
	"net/http"
	"strconv"

	"github.com/go-chi/render"
)

func adminAddSub(w http.ResponseWriter, r *http.Request) {
	c := pageContext{
		Version: Version,
	}

	template, _ := View.GetTemplate("admin/sub.jet")
	if err := template.Execute(w, nil, c); err != nil {
		render.Render(w, r, ErrViewError(err))
		return
	}
}

func adminAddSubHandle(w http.ResponseWriter, r *http.Request) {
	req, err := parseSubRequest(r)
	if err != nil {
		render.Render(w, r, ErrBadRequest(err))
		return
	}

	sub, err := saveSub(req)
	if err != nil {
		render.Render(w, r, ErrSqlError(err))
		return
	}

	id := strconv.FormatInt(sub.ID, 10)

	http.Redirect(w, r, "/admin/sub/"+id, http.StatusSeeOther)
}
