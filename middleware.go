package main

import (
	"context"
	"net/http"

	"wanderinglunch/model"
	"wanderinglunch/view"

	log "github.com/Sirupsen/logrus"
)

func mustUser(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		user := sessions.GetUser(r)
		switch {
		case user == nil:
			http.Redirect(w, r, "/login", http.StatusSeeOther)
			return
		default:
			next.ServeHTTP(w, r)
		}
	})
}

const siteKey = "_adminSite"

func siteContext(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		site := sessions.GetSite(r)
		s, err := data.GetSite(site)
		if err != nil {
			log.WithFields(log.Fields{
				"err": err,
			}).Error("Failed getting admin set site from db")
			handleError(w, err, http.StatusNotFound)
			return
		}
		ctx := context.WithValue(r.Context(), siteKey, s)
		next.ServeHTTP(w, r.WithContext(ctx))
	})
}

const basePageKey = "_basePage"

func setBasePage(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		ad := model.Ad{
			Name:  "test ad",
			Value: `<a href="#">Ad link</a>`,
		}

		dbp := view.BasePage{
			Version: Version,
			Build:   Build,
			Ad:      &ad,
		}
		ctx := context.WithValue(r.Context(), basePageKey, dbp)
		next.ServeHTTP(w, r.WithContext(ctx))
	})
}
