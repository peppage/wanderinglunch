package main

import (
	"errors"
	"net/http"

	"wanderinglunch/model"
	"wanderinglunch/view"

	log "github.com/Sirupsen/logrus"
	"github.com/pressly/chi"
)

func ampIndex(w http.ResponseWriter, r *http.Request) {
	var site *model.Site
	if site = getSite(w, r); site == nil {
		return
	}

	trucks, err := data.Trucks(site.Name, 8, "lat", "desc", 0)
	if err != nil {
		log.WithFields(log.Fields{
			"err":  err,
			"site": site.Name,
		}).Error("Failed getting trucks")
		handleError(w, err, http.StatusInternalServerError)
		return
	}

	zones, err := data.GetZones(site.Name)
	if err != nil {
		log.WithFields(log.Fields{
			"err":  err,
			"site": site.Name,
		}).Error("Failed getting zones")
		handleError(w, err, http.StatusInternalServerError)
		return
	}

	bp := view.AmpBasePage{
		Site:        site,
		OriginalURL: "/" + site.Name,
		Ad:          getAd(site.Name),
	}
	p := &view.AmpIndex{
		AmpBasePage: bp,
		Trucks:      trucks,
		Zones:       zones,
	}
	view.WriteAmpPageTemplate(w, p)
}

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
}
