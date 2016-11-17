package main

import (
	"errors"
	"net/http"

	"wanderinglunch/view"

	log "github.com/Sirupsen/logrus"
	"github.com/pressly/chi"
)

func ampTruck(w http.ResponseWriter, r *http.Request) {
	name := chi.URLParam(r, "name")
	if name == "" {
		handleError(w, errors.New("No Truck form value name"), http.StatusNotFound)
		return
	}

	t, err := data.GetTruck(name)
	if err != nil || len(t) <= 0 {
		handleError(w, errors.New("No trucks found from get truck"), http.StatusNotFound)
		return
	}

	site, err := data.GetSite(t[0].Site)
	if err != nil {
		log.WithFields(log.Fields{
			"truck": t,
			"err":   err,
		}).Error("Failed getting that site")
		handleError(w, err, http.StatusNotFound)
		return
	}

	bp := view.AmpBasePage{
		Site:        site,
		OriginalURL: "/truck/" + name,
		Ad:          getAd(site.Name),
	}
	p := &view.AmpTruck{
		AmpBasePage: bp,
		Trucks:      t,
	}
	view.WriteAmpPageTemplate(w, p)
	/*basePage := getBasePageFromCtx(r)
	name := chi.URLParam(r, "name")
	if name == "" {
		handleError(w, errors.New("No Truck form value name"), http.StatusNotFound)
		return
	}

	t, err := data.GetTruck(name)
	if err != nil || len(t) <= 0 {
		handleError(w, errors.New("No trucks found from get truck"), http.StatusNotFound)
		return
	}

	site, err := data.GetSite(t[0].Site)
	if err != nil {
		log.WithFields(log.Fields{
			"truck": t,
			"err":   err,
		}).Error("Failed getting that site")
		handleError(w, err, http.StatusNotFound)
		return
	}

	basePage.Site = site
	basePage.Ad = getAd(site.Name)
	basePage.StartTime = getStartTimeFromtCtx(r)

	p := &view.Truck{
		BasePage: basePage,
		Trucks:   t,
	}
	view.WritePageTemplate(w, p)*/
}
