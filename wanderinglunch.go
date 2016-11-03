package main

//go:generate fileb0x b0x.yaml

import (
	"encoding/gob"
	"encoding/json"
	"errors"
	"net/http"

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
var adStack model.AdStack

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
	r.NotFound(error404)

	r.Get("/robots.txt", serveFile("robots.txt"))
	r.Get("/favicon.ico", serveFile("images/favicon.ico"))
	r.Get("/touch-icon-192x192.png", serveFile("images/touch-icon-192x192.png"))
	r.Get("/apple-touch-icon.png", serveFile("images/touch-icon-192x192.png"))
	r.Get("/apple-touch-icon-precomposed.png", serveFile("images/touch-icon-192x192.png"))
	r.Get("/apple-touch-icon-120x120.png", serveFile("images/touch-icon-192x192.png"))
	r.Get("/apple-touch-icon-120x120-precomposed.png", serveFile("images/touch-icon-192x192.png"))
	r.Get("/BingSiteAuth.xml", serveFile("BingSiteAuth.xml"))

	r.Route("/", func(r chi.Router) {
		r.Use(setBasePage)
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
	})

	r.Route("/admin", func(r chi.Router) {
		r.Use(setBasePage)
		r.Use(mustUser)
		r.Use(siteContext)
		r.Use(setBasePageAdmin)
		r.Use(setSitesAdmin)
		r.Get("/", adminRoot)
		r.Get("/setSite", setSite)

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

	r.FileServer("/static", static.HTTP)
	log.Info("Starting up app " + Version + " " + Build + "on port " + webSettings.HTTPPort())
	http.ListenAndServe(":"+webSettings.HTTPPort(), r)
}

func getBasePageFromCtx(r *http.Request) view.BasePage {
	ctx := r.Context()
	return ctx.Value(basePageKey).(view.BasePage)
}

func serveFile(filename string) http.HandlerFunc {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		b, _ := static.ReadFile(filename)
		w.Write(b)
	})
}

func getSite(w http.ResponseWriter, r *http.Request) *model.Site {
	siteName := chi.URLParam(r, "site")
	if siteName == "" {
		http.Redirect(w, r, "/nyc", http.StatusMovedPermanently)
		return nil
	}

	site, err := data.GetSite(siteName)
	if err != nil {
		log.WithFields(log.Fields{
			"site": siteName,
			"err":  err,
		}).Error("Failed getting that site")
		handleError(w, err, http.StatusNotFound)
		return nil
	}

	return site
}

func getAd(site string) *model.Ad {
	ad, err := adStack.GetAd(site)
	if err != nil {
		ads, err := data.GetAdsForSite(site)
		if err != nil {
			return &model.Ad{}
		}
		adStack.Fill(ads, site)
		ad, err := adStack.GetAd(site)
		if err != nil {
			return &model.Ad{}
		}
		return ad
	}
	return ad
}

func handleError(w http.ResponseWriter, err error, code int) {
	if webSettings.Develop() {
		http.Error(w, err.Error(), code)
		return
	}

	bp := view.BasePage{
		Version: Version,
		Build:   Build,
		Ad:      &model.Ad{},
		Site:    &model.Site{},
		Develop: webSettings.Develop(),
	}
	sites, _ := data.GetSites()

	w.WriteHeader(code)
	switch code {
	case http.StatusBadRequest:
		w.Write([]byte("bad request"))
	case http.StatusNotFound:
		p := &view.Error404{
			BasePage: bp,
			Sites:    sites,
		}
		view.WritePageTemplate(w, p)
	case http.StatusUnauthorized:
		p := &view.Error401{
			BasePage: bp,
			Sites:    sites,
		}
		view.WritePageTemplate(w, p)
	default:
		w.Write([]byte("internal server error"))
	}
}

func error404(w http.ResponseWriter, r *http.Request) {
	handleError(w, errors.New(http.StatusText(http.StatusNotFound)), http.StatusNotFound)
}

func login(w http.ResponseWriter, r *http.Request) {
	bp := view.BasePage{
		Version: Version,
		Build:   Build,
		Ad:      &model.Ad{},
		Site:    &model.Site{},
	}
	p := &view.Login{
		BasePage: bp,
	}
	view.WritePageTemplate(w, p)
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
	basePage := getBasePageFromCtx(r)
	name := chi.URLParam(r, "name")
	if name == "" {
		handleError(w, errors.New("No Truck form value name"), http.StatusNotFound)
		return
	}

	t := data.GetTruck(name)
	if len(t) <= 0 {
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
	p := &view.Truck{
		BasePage: basePage,
		Trucks:   t,
	}
	view.WritePageTemplate(w, p)
	return
}

func root(w http.ResponseWriter, r *http.Request) {
	basePage := getBasePageFromCtx(r)
	var site *model.Site
	if site = getSite(w, r); site == nil {
		return
	}
	basePage.Site = site
	basePage.Ad = getAd(site.Name)

	siteName := basePage.Site.Name

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
	p := &view.Root{
		BasePage:   basePage,
		Trucks:     trucks,
		Zones:      zones,
		LastUpdate: lu,
	}
	view.WritePageTemplate(w, p)
}

func allTrucks(w http.ResponseWriter, r *http.Request) {
	basePage := getBasePageFromCtx(r)
	var site *model.Site
	if site = getSite(w, r); site == nil {
		handleError(w, errors.New("Not Found"), http.StatusNotFound)
		return
	}
	basePage.Site = site
	basePage.Ad = getAd(site.Name)

	trucks, err := data.Trucks(site.Name, 500000, "name", "asc", 0)
	if err != nil {
		log.WithFields(log.Fields{
			"err":  err,
			"site": site,
		}).Error("Failed getting trucks")
		handleError(w, err, http.StatusInternalServerError)
		return
	}

	p := &view.AllTrucks{
		BasePage: basePage,
		Trucks:   trucks,
	}
	view.WritePageTemplate(w, p)
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
	basePage := getBasePageFromCtx(r)
	var site *model.Site
	if site = getSite(w, r); site == nil {
		return
	}
	basePage.Site = site
	basePage.Ad = getAd(site.Name)

	m := data.Markers(site.Name, 8)
	mj, _ := json.Marshal(m)

	p := &view.Map{
		BasePage: basePage,
		Markers:  mj,
	}
	view.WritePageTemplate(w, p)
}

func feedback(w http.ResponseWriter, r *http.Request) {
	basePage := getBasePageFromCtx(r)
	var site *model.Site
	if site = getSite(w, r); site == nil {
		return
	}

	basePage.Site = site
	basePage.Ad = getAd(site.Name)

	p := &view.Feedback{
		BasePage: basePage,
	}
	view.WritePageTemplate(w, p)
}

func sitemap(w http.ResponseWriter, r *http.Request) {
	siteMap := ""

	sites, _ := data.GetSites()
	for _, s := range sites {
		siteMap += "http://wanderinglunch.com/" + s.Name + "\n"
		siteMap += "http://wanderinglunch.com/" + s.Name + "/map\n"
		siteMap += "http://wanderinglunch.com/" + s.Name + "/feedback\n"
	}

	trucks, _ := data.AllTrucks("nyc")
	for _, t := range trucks {
		siteMap += "http://wanderinglunch.com/truck/" + t.Twitname + "\n"
	}

	w.Write([]byte(siteMap))
}
