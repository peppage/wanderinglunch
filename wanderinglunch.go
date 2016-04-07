package main

import (
	"net/http"
	mdl "wanderinglunch/model"
	"wanderinglunch/setting"
	"wanderinglunch/updator"
	"wanderinglunch/view"

	"github.com/labstack/echo/engine/fasthttp"

	log "github.com/Sirupsen/logrus"
	"github.com/labstack/echo"
	"github.com/rifflock/lfshook"
)

func init() {
	setting.Initialize()
	ll, err := log.ParseLevel(setting.LogLevel)
	if err == nil {
		log.SetLevel(ll)
	}
	//log.SetFormatter(&log.JSONFormatter{})
	log.AddHook(lfshook.NewHook(
		lfshook.PathMap{
			log.DebugLevel: "info.log",
			log.ErrorLevel: "error.log",
		}))
	go updator.Start()
}

func main() {
	e := echo.New()

	e.Static("/static/", "static")

	e.Get("/", root)
	e.Get("/:site", root)
	e.Get("/truck/:name", truck)
	e.Get("/:site/alltrucks", allTrucks)

	log.Info("Server (version " + "null" + ") started on port " + setting.HTTPPort)
	e.Run(fasthttp.New(":" + setting.HTTPPort))

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

		zones, err := mdl.Zones(siteName)
		if err != nil {
			log.WithFields(log.Fields{
				"err":  err,
				"site": siteName,
			}).Error("Failed getting zones")
			return echo.NewHTTPError(http.StatusInternalServerError, "Error getting data")
		}
		return c.HTML(http.StatusOK, view.Index(site, zones, trucks))
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
