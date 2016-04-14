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
