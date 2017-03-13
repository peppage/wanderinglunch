package main

import (
	"net/http"
	"time"

	"wanderinglunch/view"

	log "github.com/Sirupsen/logrus"
	"github.com/labstack/echo"
)

const timeKey = "_startTime"

func setStartTime(next echo.HandlerFunc) echo.HandlerFunc {
	return (func(c echo.Context) error {
		now := time.Now()
		c.Set(timeKey, &now)
		return next(c)
	})
}

func mustUser(next echo.HandlerFunc) echo.HandlerFunc {
	return (func(c echo.Context) error {
		user := sessions.GetUser(c.Request())
		switch {
		case user == nil:
			return c.Redirect(http.StatusSeeOther, "/login")
		default:
			return next(c)
		}
	})
}

const siteKey = "_adminSite"

func siteContext(next echo.HandlerFunc) echo.HandlerFunc {
	return (func(c echo.Context) error {
		site := sessions.GetSite(c.Request())
		s, err := data.GetSite(site)
		if err != nil {
			log.WithFields(log.Fields{
				"err": err,
			}).Error("Failed getting admin set site from db")
			return echo.NewHTTPError(http.StatusNotFound)
		}
		c.Set(siteKey, s)
		return next(c)
	})
}

const basePageKey = "_basePage"

func setBasePage(next echo.HandlerFunc) echo.HandlerFunc {
	return (func(c echo.Context) error {
		dbp := view.BasePage{
			Version: Version,
			Build:   Build,
			Develop: webSettings.Develop(),
		}
		c.Set(basePageKey, dbp)
		return next(c)
	})
}

func setBasePageAdmin(next echo.HandlerFunc) echo.HandlerFunc {
	return (func(c echo.Context) error {
		bp := c.Get(basePageKey).(view.BasePage)
		bp.Admin = true
		c.Set(basePageKey, bp)
		return next(c)
	})
}

func setSitesAdmin(next echo.HandlerFunc) echo.HandlerFunc {
	return (func(c echo.Context) error {
		bp := c.Get(basePageKey).(view.BasePage)
		sites, _ := data.GetSites()
		bp.Sites = sites
		c.Set(basePageKey, bp)
		return next(c)
	})
}
