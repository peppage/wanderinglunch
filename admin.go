package main

import (
	"net/http"
	"strconv"
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
		return echo.NewHTTPError(http.StatusInternalServerError, "")
	}
	return c.Redirect(http.StatusSeeOther, "/admin")
}

func subNew(c echo.Context) error {
	session := session.Default(c)
	site := session.Get("site").(string)
	s, err := mdl.GetSite(site)
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed getting that site")
		return echo.NewHTTPError(http.StatusNotFound, err.Error())
	}

	return c.HTML(http.StatusOK, admin.Subnew(s))
}

func subSave(c echo.Context) error {
	err := mdl.AddSub(mdl.Sub{
		Regex:       c.FormValue("regex"),
		Replacement: c.FormValue("replacement"),
	})
	if err != nil {
		log.WithFields(log.Fields{
			"regex": c.FormValue("regex"),
			"err":   err,
		}).Error("Failed adding sub")
		return echo.NewHTTPError(http.StatusInternalServerError, err.Error())
	}
	return c.Redirect(http.StatusSeeOther, "/admin")
}

func adNew(c echo.Context) error {
	session := session.Default(c)
	site := session.Get("site").(string)
	s, err := mdl.GetSite(site)
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed getting that site")
		return echo.NewHTTPError(http.StatusNotFound, err.Error())
	}

	sites, err := mdl.GetSites()
	if err != nil {
		log.WithError(err).Error("Failed gettings sites")
	}

	return c.HTML(http.StatusOK, admin.Adnew(s, sites))
}

func adSave(c echo.Context) error {
	i, err := strconv.ParseInt(c.FormValue("validuntil"), 10, 64)
	if err != nil {
		log.WithError(err).Error("Failed converting validuntil, saving ad")
		return echo.NewHTTPError(http.StatusBadRequest, "Valid Unil NaN")
	}
	err = mdl.AddAd(mdl.Ad{
		Name:       c.FormValue("name"),
		Value:      c.FormValue("value"),
		ValidUntil: i,
		Site:       c.FormValue("site"),
	})
	if err != nil {
		log.WithFields(log.Fields{
			"name": c.FormValue("name"),
			"err":  err,
		}).Error("Failed adding ad")
		return echo.NewHTTPError(http.StatusInternalServerError, err.Error())
	}
	return c.Redirect(http.StatusSeeOther, "/admin")
}
