package main

import (
	"net/http"
	"strconv"
	"wanderinglunch/models"

	"github.com/CloudyKit/jet"
	"github.com/go-chi/chi"
	"github.com/go-chi/render"
)

func adminAddSub(w http.ResponseWriter, r *http.Request) {
	c := pageContext{
		Site:    &models.Site{},
		Version: Version,
	}

	template, _ := View.GetTemplate("admin/sub.jet")
	vars := make(jet.VarMap)
	vars.Set("sub", models.Sub{})
	if err := template.Execute(w, vars, c); err != nil {
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

func adminAPISubs(w http.ResponseWriter, r *http.Request) {
	subs, err := getAllSubs()
	if err != nil {
		render.Render(w, r, ErrSqlError(err))
		return
	}

	render.RenderList(w, r, NewSubListResponse(subs))
}

func adminSubs(w http.ResponseWriter, r *http.Request) {
	c := pageContext{
		Site:    &models.Site{},
		Version: Version,
	}

	template, _ := View.GetTemplate("admin/subs.jet")
	if err := template.Execute(w, nil, c); err != nil {
		render.Render(w, r, ErrViewError(err))
		return
	}
}

func adminEditSub(w http.ResponseWriter, r *http.Request) {
	c := pageContext{
		Site:    &models.Site{},
		Version: Version,
	}

	id := chi.URLParam(r, "id")
	sub, err := getSub(id)
	if err != nil {
		render.Render(w, r, ErrSqlError(err))
		return
	}

	template, _ := View.GetTemplate("admin/sub.jet")
	vars := make(jet.VarMap)
	vars.Set("sub", sub)
	if err := template.Execute(w, vars, c); err != nil {
		render.Render(w, r, ErrViewError(err))
		return
	}
}

func adminEditSubHandle(w http.ResponseWriter, r *http.Request) {
	id := chi.URLParam(r, "id")
	req, err := parseSubRequest(r)
	if err != nil {
		render.Render(w, r, ErrBadRequest(err))
		return
	}

	err = updateSub(id, req)
	if err != nil {
		render.Render(w, r, ErrSqlError(err))
		return
	}

	http.Redirect(w, r, "/admin/sub/"+id, http.StatusSeeOther)
}
