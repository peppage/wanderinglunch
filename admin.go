package main

import (
	"net/http"
	mdl "wanderinglunch/model"
	"wanderinglunch/updator"
	"wanderinglunch/view/admin"

	log "github.com/Sirupsen/logrus"
	"github.com/labstack/echo"
	"github.com/peppage/echo-middleware/session"
)

func setSite(c echo.Context) error {
	session := session.Default(c)
	session.Set("site", c.QueryParam("site"))
	session.Save()
	return c.JSON(http.StatusOK, "ok")
}

func adminRoot(c echo.Context) error {
	session := session.Default(c)
	site := session.Get("site").(string)
	trucks, err := mdl.GetFailedUpdates(site)
	if err != nil {
		log.WithError(err).Error("Failed getting admin trucks")
	}

	s, err := mdl.GetSite(site)
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed getting that site")
		return echo.NewHTTPError(http.StatusNotFound, "")
	}

	return c.HTML(http.StatusOK, admin.Index(s, trucks))
}

func debug(c echo.Context) error {
	n := c.QueryParam("twitname")
	if n != "" {
		texts, _ := updator.GetReplacedStrings(n)
		return c.HTML(http.StatusOK, admin.Debugshow(texts))
	}
	return c.HTML(http.StatusOK, admin.Debug())
}

func truckNew(c echo.Context) error {
	session := session.Default(c)
	site := session.Get("site").(string)
	s, err := mdl.GetSite(site)
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed getting that site")
		return echo.NewHTTPError(http.StatusNotFound, "")
	}

	sites, err := mdl.GetSites()
	if err != nil {
		log.WithError(err).Error("Failed gettings sites")
	}
	return c.HTML(http.StatusOK, admin.Trucknew(s, sites))
}

func truckSave(c echo.Context) error {
	err := mdl.AddTruck(mdl.Truck{
		ID:         c.FormValue("id"),
		Name:       c.FormValue("name"),
		Twitname:   c.FormValue("twitname"),
		Weburl:     c.FormValue("weburl"),
		Type:       c.FormValue("type"),
		About:      c.FormValue("about"),
		Foursquare: c.FormValue("foursquare"),
		Site:       c.FormValue("site"),
	})
	if err != nil {
		log.WithFields(log.Fields{
			"err":  err,
			"Name": c.FormValue("name"),
		}).Error("Failed adding truck")
		return c.Redirect(http.StatusSeeOther, "/admin/truck/add")
	}
	return c.Redirect(http.StatusSeeOther, "/admin")
}
