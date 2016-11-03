package main

//go:generate fileb0x b0x.yaml

import (
	"encoding/gob"
	"encoding/json"
	"errors"
	"net/http"
	"os"
	"path/filepath"

	"wanderinglunch/model"
	"wanderinglunch/session"
	"wanderinglunch/session/cookie"
	"wanderinglunch/settings"
	"wanderinglunch/settings/toml"
	"wanderinglunch/static"
	"wanderinglunch/store"
	"wanderinglunch/store/datastore"
	"wanderinglunch/updator"
	"wanderinglunch/view"

	log "github.com/Sirupsen/logrus"
	"github.com/pressly/chi"
	"github.com/pressly/chi/middleware"
	"github.com/rifflock/lfshook"
	"github.com/sebest/logrusly"
)

var sessions session.Session
var webSettings settings.Settings
var data store.Store

// Version is autoset from the build script
var Version string

// Build is autoset from the build script
var Build string

func init() {
	gob.Register(&model.User{})

	webSettings = toml.New("conf.toml")
	sessions = cookie.New(webSettings.SessionSecret())
	data = datastore.New("pgx", "postgres://mca@localhost:5432/foodtruck") //webSettings.DataSourceName())

	ll, err := log.ParseLevel(webSettings.LogLevel())
	if err == nil {
		log.SetLevel(ll)
	}
	if webSettings.Develop() {
		log.SetFormatter(&log.TextFormatter{})
		log.AddHook(lfshook.NewHook(
			lfshook.PathMap{
				log.DebugLevel: "info.log",
				log.ErrorLevel: "error.log",
			}))
	} else {
		log.SetFormatter(&log.JSONFormatter{})
		log.AddHook(logrusly.NewLogglyHook(webSettings.LogglyID(), "wanderinglunch.com", log.WarnLevel))
	}

	if webSettings.RunUpdator() {
		updateSettings := updator.Settings{
			Datastore: data,
		}
		go updator.Start(updateSettings)
	}
}

func main() {
	r := chi.NewRouter()

	r.Use(middleware.RealIP)
	r.Use(middleware.Recoverer)
	r.Use(middleware.CloseNotify)
	r.Use(middleware.StripSlashes)

	/*
		e.File("/favicon.ico", "./static/images/favicon.ico")
		e.File("/robots.txt", "./static/robots.txt")
		e.File("/touch-icon-192x192.png", "./static/images/touch-icon-192x192.png")
		e.File("/apple-touch-icon.png", "./static/images/touch-icon-192x192.png")
		e.File("/apple-touch-icon-precomposed.png", "./static/images/touch-icon-192x192.png")
		e.File("/apple-touch-icon-120x120.png", "./static/images/touch-icon-192x192.png")
		e.File("/apple-touch-icon-120x120-precomposed.png", "./static/images/touch-icon-192x192.png")
		e.File("/BingSiteAuth.xml", "./static/BingSiteAuth.xml")
		e.Static("/static/", "static")

	*/

	r.Get("/robots.txt", func(w http.ResponseWriter, r *http.Request) { w.Write(static.FileStaticRobotsTxt) })

	r.Get("/", root)
	r.Get("/:site", root)
	r.Get("/login", login)
	r.Post("/login", loginHandle)
	r.Get("/truck/:name", truck)
	r.Get("/alltrucks", allTrucks)
	r.Get("/:site/alltrucks", allTrucks)
	r.Get("/:site/lastupdate", lastUpdate)
	r.Get("/map", maps)
	r.Get("/:site/map", maps)
	r.Get("/:site/feedback", feedback)
	r.Get("/sitemap.txt", sitemap)

	r.Route("/admin", func(r chi.Router) {
		r.Use(mustUser)
		r.Use(siteContext)
		r.Get("/", adminRoot)

		r.Get("/debug", debug)
		r.Get("/truck/add", truckNew)
		r.Post("/truck/add", truckSave)
		r.Get("/sub/add", subNew)
		r.Post("/sub/add", subSave)
		r.Get("/ad/add", adNew)
		r.Post("/ad/add", adSave)
		r.Get("/location/add", locNew)
		r.Post("/location/add", locSave)
		r.Get("/site/add", siteNew)
		r.Post("/site/add", siteSave)

		r.Get("/trucks", aTrucks)
		r.Get("/truck/edit", truckEdit)
		r.Post("/truck/edit", truckUpdate)
		r.Get("/subs", aSubs)
		r.Get("/sub/edit", subEdit)
		r.Post("/sub/edit", subUpdate)
		r.Get("/ads", aAds)
		r.Get("/ad/edit", adEdit)
		r.Post("/ad/edit", adUpdate)
		r.Get("/locations", aLocations)
		r.Get("/location/edit", locEdit)
		r.Post("/location/edit", locUpdate)
		r.Get("/sites", aSites)
		r.Get("/site/edit", siteEdit)
		r.Post("/site/edit", siteUpdate)
		r.Get("/foursquare", foursquare)
		r.Post("/image/add", imgAdd)
		r.Get("/image/edit", imgEdit)
		r.Post("/image/edit", imgUpdate)
		r.Get("/queue", queue)
		r.Get("/queue/done", queueDone)

	})

	log.Info("Starting up app " + Version + " " + Build + "on port " + webSettings.HTTPPort())
	workDir, _ := os.Getwd()
	filesDir := filepath.Join(workDir, "static")
	r.FileServer("/static", http.Dir(filesDir))
	http.ListenAndServe(":"+webSettings.HTTPPort(), r)
}

func handleError(w http.ResponseWriter, err error, code int) {
	if webSettings.Develop() {
		http.Error(w, err.Error(), code)
		return
	}

	sites, _ := data.GetSites()

	w.WriteHeader(code)
	switch code {
	case http.StatusBadRequest:
		w.Write([]byte("bad request"))
	case http.StatusNotFound:
		w.Write([]byte(view.Error404(sites)))
	case http.StatusUnauthorized:
		w.Write([]byte(view.Error401(sites)))
	default:
		w.Write([]byte("internal server error"))
	}
}

func login(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte(view.Login()))
}

func loginHandle(w http.ResponseWriter, r *http.Request) {
	u, err := data.VerifyPassword(r.FormValue("email"), r.FormValue("password"))
	if err != nil {
		log.WithError(err).Error("failed verifying password")
		handleError(w, err, http.StatusUnauthorized)
		return
	}
	log.WithField("user", u).Debug("Login handle user")
	sessions.SetUser(w, r, u)
	sessions.SetSite(w, r, "nyc")
	http.Redirect(w, r, "/admin", http.StatusSeeOther)
}

func truck(w http.ResponseWriter, r *http.Request) {
	name := chi.URLParam(r, "name")
	if name != "" {
		t := data.GetTruck(name)
		if len(t) > 0 {
			site, err := data.GetSite(t[0].Site)
			if err != nil {
				log.WithFields(log.Fields{
					"truck": t,
					"err":   err,
				}).Error("Failed getting that site")
				handleError(w, err, http.StatusNotFound)
				return
			}
			w.Write([]byte(view.Truck(site, t)))
			return
		}
	}
	handleError(w, errors.New("No Truck form value name"), http.StatusNotFound)
}

func root(w http.ResponseWriter, r *http.Request) {
	siteName := chi.URLParam(r, "site")
	if siteName != "" {
		site, err := data.GetSite(siteName)
		if err != nil {
			log.WithFields(log.Fields{
				"site": siteName,
				"err":  err,
			}).Error("Failed getting that site")
			handleError(w, err, http.StatusNotFound)
			return
		}

		trucks, err := data.Trucks(siteName, 8, "lat", "desc", 0)
		if err != nil {
			log.WithFields(log.Fields{
				"err":  err,
				"site": siteName,
			}).Error("Failed getting trucks")
			handleError(w, err, http.StatusInternalServerError)
			return
		}

		zones, err := data.GetZones(siteName)
		if err != nil {
			log.WithFields(log.Fields{
				"err":  err,
				"site": siteName,
			}).Error("Failed getting zones")
			handleError(w, err, http.StatusInternalServerError)
			return
		}

		lu, err := data.LastUpdate(siteName)
		if err != nil {
			log.WithError(err).Error("Unable to retrieve last update")
		}
		w.Write([]byte(view.Index(site, zones, trucks, lu)))
		return
	}
	http.Redirect(w, r, "/nyc", http.StatusMovedPermanently)
}

func allTrucks(w http.ResponseWriter, r *http.Request) {
	siteName := chi.URLParam(r, "site")
	if siteName != "" {
		site, err := data.GetSite(siteName)
		if err != nil {
			log.WithFields(log.Fields{
				"site": site,
				"err":  err,
			}).Error("Failed getting that site")
			handleError(w, err, http.StatusNotFound)
			return
		}
		trucks, err := data.Trucks(siteName, 500000, "name", "asc", 0)
		if err != nil {
			log.WithFields(log.Fields{
				"err":  err,
				"site": site,
			}).Error("Failed getting trucks")
			handleError(w, err, http.StatusInternalServerError)
			return
		}
		if len(trucks) == 0 {
			handleError(w, errors.New("No trucks in list"), http.StatusNotFound)
			return
		}
		w.Write([]byte(view.Alltrucks(site, trucks)))
		return
	}
	http.Redirect(w, r, "/nyc/alltrucks", http.StatusMovedPermanently)
}

func lastUpdate(w http.ResponseWriter, r *http.Request) {
	siteName := chi.URLParam(r, "site")
	if siteName != "" {
		lu, err := data.LastUpdate(siteName)
		if err != nil {
			log.WithError(err).Error("Unable to retrieve last update")
			handleError(w, err, http.StatusInternalServerError)
		}
		js, _ := json.Marshal(lu)
		w.Write(js)
		return
	}
	handleError(w, errors.New("no site name"), http.StatusBadRequest)
}

func maps(w http.ResponseWriter, r *http.Request) {
	siteName := chi.URLParam(r, "site")
	if siteName != "" {
		site, err := data.GetSite(siteName)
		if err != nil {
			log.WithFields(log.Fields{
				"site": site,
				"err":  err,
			}).Error("Failed getting that site")
			handleError(w, err, http.StatusNotFound)
		}
		m := data.Markers(siteName, 8)
		mj, _ := json.Marshal(m)
		w.Write([]byte(view.Map(site, string(mj))))
		return
	}
	http.Redirect(w, r, "/nyc/map", http.StatusMovedPermanently)
}

func feedback(w http.ResponseWriter, r *http.Request) {
	siteName := chi.URLParam(r, "site")
	if siteName != "" {
		site, err := data.GetSite(siteName)
		if err != nil {
			log.WithFields(log.Fields{
				"site": site,
				"err":  err,
			}).Error("Failed getting that site")
			handleError(w, err, http.StatusNotFound)
			return
		}
		w.Write([]byte(view.Feedback(site)))
		return
	}
	handleError(w, errors.New("I have no idea."), http.StatusBadRequest)
}

func sitemap(w http.ResponseWriter, r *http.Request) {
	siteMap := "http://wanderinglunch.com/nyc\n"
	siteMap += "http://wanderinglunch.com/nyc/map\n"
	siteMap += "http://wanderinglunch.com/nyc/feedback\n"
	trucks, _ := data.AllTrucks("nyc")
	for _, t := range trucks {
		siteMap += "http://wanderinglunch.com/truck/" + t.Twitname + "\n"
	}

	w.Write([]byte(siteMap))
}
