package main

import (
	"net/http"
	ept "wanderinglunch/endpoints"
	"wanderinglunch/tmpl"
	"wanderinglunch/updator"

	log "github.com/Sirupsen/logrus"
	"github.com/labstack/echo"
)

func init() {
	go updator.Start()
}

func main() {
	e := echo.New()

	e.Static("/static/", "static")

	e.Get("/", root)
	e.Get("/:site", root)

	api := e.Group("/api")
	api.Get("/trucks", ept.Trucks)

	log.Info("Server (version " + "null" + ") started on port " + "8000")
	e.Run(":" + "8000")

}

func root(c *echo.Context) error {
	return c.HTML(http.StatusOK, tmpl.Index())
	//return c.Redirect(http.StatusMovedPermanently, "/nyc")
}
