package main

import (
	"context"
	"net/http"
	"wanderinglunch/models"

	"github.com/go-chi/chi"
	"github.com/go-chi/render"
)

type ctxKey int

const (
	truckCtxkey ctxKey = iota
	siteCtxKey
)

func mustUser(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		user, err := getUser(r)
		if err != nil || user == nil {
			http.Redirect(w, r, "/login", http.StatusSeeOther)
		}

		next.ServeHTTP(w, r)
	})
}

func truckCtx(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		var truck *models.Truck
		var err error

		if id := chi.URLParam(r, "id"); id != "" {
			truck, err = getTruck(id)
		}

		if err != nil {
			render.Render(w, r, ErrNotFound)
			return
		}

		ctx := context.WithValue(r.Context(), truckCtxkey, truck)
		next.ServeHTTP(w, r.WithContext(ctx))
	})
}

func siteCtx(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		var site *models.Site
		var err error

		if name := chi.URLParam(r, "name"); name != "" {
			site, err = getSite(name)
		}

		if err != nil {
			render.Render(w, r, ErrNotFound)
			return
		}

		ctx := context.WithValue(r.Context(), siteCtxKey, site)
		next.ServeHTTP(w, r.WithContext(ctx))
	})
}
