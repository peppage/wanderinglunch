package main

import (
	"net/http"
	ept "wanderinglunch/endpoints"
	"wanderinglunch/tmpl"
	"wanderinglunch/updator"

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

func root(c *echo.Context) error {
	site := c.Param("site")
	if site != "" {
		return c.HTML(http.StatusOK, tmpl.Index(site))
	}
	return c.Redirect(http.StatusMovedPermanently, "/nyc")
}

func truck(c *echo.Context) error {
	return nil
}
