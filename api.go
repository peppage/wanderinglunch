package main

import (
	"encoding/json"
	"net/http"

	log "github.com/Sirupsen/logrus"
	"github.com/pressly/chi"
)

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
