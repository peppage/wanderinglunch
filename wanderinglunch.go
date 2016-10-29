package main

import (
	"encoding/json"
	"net/http"

	mdl "wanderinglunch/model"
	"wanderinglunch/settings"
	"wanderinglunch/settings/toml"
	"wanderinglunch/updator"
	"wanderinglunch/view"

	"github.com/labstack/echo/engine/standard"
	"github.com/peppage/echo-middleware/session"

	log "github.com/Sirupsen/logrus"
	"github.com/labstack/echo"
	"github.com/labstack/echo/middleware"
	"github.com/rifflock/lfshook"
	"github.com/sebest/logrusly"
)

var store session.CookieStore
var webSettings settings.Settings

func init() {

	webSettings = toml.New("conf.toml")
	store = session.NewCookieStore([]byte(webSettings.SessionSecret()))

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
		go updator.Start()
	}
}

func main() {
	e := echo.New()
	e.Pre(middleware.RemoveTrailingSlash())
	e.Use(middleware.BodyLimit("2M"))
	e.Use(session.Sessions("session", store))
	e.Use(middleware.Recover())
	e.SetHTTPErrorHandler(errorHandler)

	e.File("/favicon.ico", "./static/images/favicon.ico")
	e.File("/robots.txt", "./static/robots.txt")
	e.File("/touch-icon-192x192.png", "./static/images/touch-icon-192x192.png")
	e.File("/apple-touch-icon.png", "./static/images/touch-icon-192x192.png")
	e.File("/apple-touch-icon-precomposed.png", "./static/images/touch-icon-192x192.png")
	e.File("/apple-touch-icon-120x120.png", "./static/images/touch-icon-192x192.png")
	e.File("/apple-touch-icon-120x120-precomposed.png", "./static/images/touch-icon-192x192.png")
	e.File("/BingSiteAuth.xml", "./static/BingSiteAuth.xml")
	e.Static("/static/", "static")

	e.GET("/", root)
	e.GET("/login", login)
	e.POST("/login", loginHandle)
	e.GET("/truck/:name", truck)
	e.GET("/:site", root)
	e.GET("/alltrucks", allTrucks)
	e.GET("/:site/alltrucks", allTrucks)
	e.GET("/:site/lastupdate", lastUpdate)
	e.GET("/map", maps)
	e.GET("/:site/map", maps)
	e.GET("/:site/feedback", feedback)
	e.GET("/sitemap.txt", sitemap)

	ad := e.Group("/admin")
	if !webSettings.Develop() {
		ad.Use(secure())
	}
	ad.GET("", adminRoot)
	ad.GET("/setSite", setSite)
	ad.GET("/debug", debug)
	ad.GET("/truck/add", truckNew)
	ad.POST("/truck/add", truckSave)
	ad.GET("/sub/add", subNew)
	ad.POST("/sub/add", subSave)
	ad.GET("/ad/add", adNew)
	ad.POST("/ad/add", adSave)
	ad.GET("/location/add", locNew)
	ad.POST("/location/add", locSave)
	ad.GET("/site/add", siteNew)
	ad.POST("/site/add", siteSave)

	ad.GET("/trucks", aTrucks)
	ad.GET("/truck/edit", truckEdit)
	ad.POST("/truck/edit", truckUpdate)
	ad.GET("/subs", aSubs)
	ad.GET("/sub/edit", subEdit)
	ad.POST("/sub/edit", subUpdate)
	ad.GET("/ads", aAds)
	ad.GET("/ad/edit", adEdit)
	ad.POST("/ad/edit", adUpdate)
	ad.GET("/locations", aLocations)
	ad.GET("/location/edit", locEdit)
	ad.POST("/location/edit", locUpdate)
	ad.GET("/sites", aSites)
	ad.GET("/site/edit", siteEdit)
	ad.POST("/site/edit", siteUpdate)
	ad.GET("/foursquare", foursquare)
	ad.POST("/image/add", imgAdd)
	ad.GET("/image/edit", imgEdit)
	ad.POST("/image/edit", imgUpdate)
	ad.GET("/queue", queue)
	ad.GET("/queue/done", queueDone)

	log.Info("Server (version " + webSettings.Version() + ") started on port " + webSettings.HTTPPort())
	e.Run(standard.New(":" + webSettings.HTTPPort()))

}

func errorHandler(err error, c echo.Context) {
	code := http.StatusInternalServerError
	msg := http.StatusText(code)
	if he, ok := err.(*echo.HTTPError); ok {
		code = he.Code
		msg = he.Message
	}

	sites, err2 := mdl.GetSites()
	if code == http.StatusNotFound && err2 == nil {
		c.HTML(code, view.Error404(sites))
		return
	}
	if code == http.StatusUnauthorized && err2 == nil {
		c.HTML(code, view.Error401(sites))
		return
	}
	c.String(code, msg)
	return
}

func login(c echo.Context) error {
	return c.HTML(http.StatusOK, view.Login())
}

func loginHandle(c echo.Context) error {
	u, err := mdl.VerifyPassword(c.FormValue("email"), c.FormValue("password"))
	if err != nil {
		c.Response().Header().Set("Method", "GET")
		return echo.NewHTTPError(http.StatusUnauthorized) // The user is invalid!
	}
	session := session.Default(c)
	session.Set("user", u.Email)
	session.Set("site", "nyc")
	session.Save()
	return c.Redirect(http.StatusSeeOther, "/admin")
}

func truck(c echo.Context) error {
	name := c.Param("name")
	if name != "" {
		t := mdl.GetTruck(name)
		if len(t) > 0 {
			site, err := mdl.GetSite(t[0].Site)
			if err != nil {
				log.WithFields(log.Fields{
					"truck": t,
					"err":   err,
				}).Error("Failed getting that site")
				return echo.NewHTTPError(http.StatusNotFound, "")
			}
			return c.HTML(http.StatusOK, view.Truck(site, t))
		}
	}
	return echo.NewHTTPError(http.StatusNotFound, "No truck")
}

func root(c echo.Context) error {
	siteName := c.Param("site")
	if siteName != "" {
		site, err := mdl.GetSite(siteName)
		if err != nil {
			log.WithFields(log.Fields{
				"site": siteName,
				"err":  err,
			}).Error("Failed getting that site")
			return echo.NewHTTPError(http.StatusNotFound, "")
		}
		trucks, err := mdl.Trucks(siteName, 8, "lat", "desc", 0)
		if err != nil {
			log.WithFields(log.Fields{
				"err":  err,
				"site": siteName,
			}).Error("Failed getting trucks")
			return echo.NewHTTPError(http.StatusInternalServerError, "Error getting data")
		}

		zones, err := mdl.GetZones(siteName)
		if err != nil {
			log.WithFields(log.Fields{
				"err":  err,
				"site": siteName,
			}).Error("Failed getting zones")
			return echo.NewHTTPError(http.StatusInternalServerError, "Error getting data")
		}

		lu, err := mdl.LastUpdate(siteName)
		if err != nil {
			log.WithError(err).Error("Unable to retrieve last update")
		}
		return c.HTML(http.StatusOK, view.Index(site, zones, trucks, lu))
	}
	return c.Redirect(http.StatusMovedPermanently, "/nyc")
}

func allTrucks(c echo.Context) error {
	siteName := c.Param("site")
	if siteName != "" {
		site, err := mdl.GetSite(siteName)
		if err != nil {
			log.WithFields(log.Fields{
				"site": site,
				"err":  err,
			}).Error("Failed getting that site")
			return echo.NewHTTPError(http.StatusNotFound, "")
		}
		trucks, err := mdl.Trucks(siteName, 500000, "name", "asc", 0)
		if err != nil {
			log.WithFields(log.Fields{
				"err":  err,
				"site": site,
			}).Error("Failed getting trucks")
			return echo.NewHTTPError(http.StatusInternalServerError, "Error getting data")
		}
		if len(trucks) == 0 {
			return echo.NewHTTPError(http.StatusNotFound, "")
		}
		return c.HTML(http.StatusOK, view.Alltrucks(site, trucks))
	}
	return c.Redirect(http.StatusMovedPermanently, "/nyc/alltrucks")
}

func lastUpdate(c echo.Context) error {
	siteName := c.Param("site")
	if siteName != "" {
		lu, err := mdl.LastUpdate(siteName)
		if err != nil {
			log.WithError(err).Error("Unable to retrieve last update")
		}
		return c.JSON(http.StatusOK, lu)
	}
	return echo.NewHTTPError(http.StatusBadRequest, "")
}

func maps(c echo.Context) error {
	siteName := c.Param("site")
	if siteName != "" {
		site, err := mdl.GetSite(siteName)
		if err != nil {
			log.WithFields(log.Fields{
				"site": site,
				"err":  err,
			}).Error("Failed getting that site")
			return echo.NewHTTPError(http.StatusNotFound, "")
		}
		m := mdl.Markers(siteName, 8)
		mj, _ := json.Marshal(m)
		return c.HTML(http.StatusOK, view.Map(site, string(mj)))
	}
	return c.Redirect(http.StatusMovedPermanently, "/nyc/map")
}

func feedback(c echo.Context) error {
	siteName := c.Param("site")
	if siteName != "" {
		site, err := mdl.GetSite(siteName)
		if err != nil {
			log.WithFields(log.Fields{
				"site": site,
				"err":  err,
			}).Error("Failed getting that site")
			return echo.NewHTTPError(http.StatusNotFound, "")
		}
		return c.HTML(http.StatusOK, view.Feedback(site))
	}
	return echo.NewHTTPError(http.StatusBadRequest, "")
}

func sitemap(c echo.Context) error {
	siteMap := "http://wanderinglunch.com/nyc\n"
	siteMap += "http://wanderinglunch.com/nyc/map\n"
	siteMap += "http://wanderinglunch.com/nyc/feedback\n"
	trucks, _ := mdl.AllTrucks("nyc")
	for _, t := range trucks {
		siteMap += "http://wanderinglunch.com/truck/" + t.Twitname + "\n"
	}

	return c.String(http.StatusOK, siteMap)
}
