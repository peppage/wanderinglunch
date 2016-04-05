package main

import (
	"net/http"
	ept "wanderinglunch/endpoints"
	mdl "wanderinglunch/model"
	"wanderinglunch/updator"
	"wanderinglunch/view"

	log "github.com/Sirupsen/logrus"
	"github.com/labstack/echo"
	"github.com/rifflock/lfshook"
)

func init() {
	log.SetLevel(log.DebugLevel)
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

	api := e.Group("/api")
	api.Get("/trucks", ept.Trucks)
	api.Get("/trucks/:name", ept.Truck)

	log.Info("Server (version " + "null" + ") started on port " + "8000")
	e.Run(":" + "8000")

}

func truck(c *echo.Context) error {
	name := c.Param("name")
	if name != "" {
		t := mdl.GetTruck(name)
		if len(t) > 0 {
			//return c.HTML(http.StatusOK, view.Index(t[0].Site, ""))
		}
	}
	return echo.NewHTTPError(http.StatusNotFound, "No truck")
}

func root(c *echo.Context) error {
	site := c.Param("site")
	if site != "" {
		trucks := mdl.Trucks(site, 8, "lat", "desc", 0)
		return c.HTML(http.StatusOK, view.Index(site, mdl.Zones(site), trucks))
	}
	return c.Redirect(http.StatusMovedPermanently, "/nyc")
}
