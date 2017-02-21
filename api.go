package main

import (
	"encoding/json"
	"errors"
	"net/http"

	"wanderinglunch/model"
	"wanderinglunch/view"

	log "github.com/Sirupsen/logrus"
	"github.com/pressly/chi"
)

func apiIndex(w http.ResponseWriter, r *http.Request) {
	basePage := getBasePageFromCtx(r)
	var site *model.Site
	if site = getSite(w, r); site == nil {
		handleError(w, errors.New("Not Found"), http.StatusNotFound)
		return
	}
	basePage.Site = site
	basePage.Ad = getAd(site.Name)
	basePage.StartTime = getStartTimeFromtCtx(r)

	p := &view.ApiIndex{
		BasePage: basePage,
	}

	view.WritePageTemplate(w, p)
}

func apiTrucks(w http.ResponseWriter, r *http.Request) {
	siteName := chi.URLParam(r, "site")
	if siteName == "" {
		http.Redirect(w, r, "/nyc/api/trucks", http.StatusMovedPermanently)
		return
	}

	trucks, err := data.Trucks(siteName, 8, "lat", "desc", 0)
	if err != nil {
		log.WithError(err).Error("Failed getting all trucks api")
		http.Error(w, http.StatusText(http.StatusInternalServerError), http.StatusInternalServerError)
		return
	}

	js, err := json.Marshal(trucks)
	if err != nil {
		http.Error(w, http.StatusText(http.StatusInternalServerError), http.StatusInternalServerError)
		return
	}
	w.Write(js)
}
