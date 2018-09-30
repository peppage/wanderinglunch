package main

import (
	"net/http"

	"github.com/go-chi/render"
)

func adminIndex(w http.ResponseWriter, r *http.Request) {
	c := pageContext{
		Version: Version,
	}

	template, _ := View.GetTemplate("admin/index.jet")
	if err := template.Execute(w, nil, c); err != nil {
		render.Render(w, r, ErrViewError(err))
		return
	}
}
