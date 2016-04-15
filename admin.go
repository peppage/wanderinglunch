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
		return c.HTML(http.StatusOK, admin.Debugshow(n, texts))
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
	return c.HTML(http.StatusOK, admin.Truck(s, sites, &mdl.Truck{}))
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

	return c.HTML(http.StatusOK, admin.Sub(s, &mdl.Sub{}))
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

	return c.HTML(http.StatusOK, admin.Ad(s, sites, &mdl.Ad{}))
}

func adSave(c echo.Context) error {
	i, err := strconv.ParseInt(c.FormValue("validuntil"), 10, 64)
	if err != nil {
		log.WithError(err).Error("Failed converting validuntil, saving ad")
		return echo.NewHTTPError(http.StatusBadRequest, "Valid Until NaN")
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

func locNew(c echo.Context) error {
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

	zones, err := mdl.GetZones(site)
	if err != nil {
		log.WithError(err).Error("Failed gettings zones")
	}

	return c.HTML(http.StatusOK, admin.Loc(s, sites, zones, &mdl.Location{}))
}

func locSave(c echo.Context) error {
	lat, err1 := strconv.ParseFloat(c.FormValue("lat"), 32)
	long, err2 := strconv.ParseFloat(c.FormValue("long"), 32)
	if err1 != nil || err2 != nil {
		log.WithFields(log.Fields{
			"err1": err1,
			"err2": err2,
		}).Error("Failed converting lat or long, saving loc")
		return echo.NewHTTPError(http.StatusBadRequest, "lat or long NaN")
	}
	err := mdl.AddLocation(mdl.Location{
		Display: c.FormValue("display"),
		Matcher: c.FormValue("matcher"),
		Lat:     float32(lat),
		Long:    float32(long),
		Zone:    c.FormValue("zone"),
		Site:    c.FormValue("site"),
	})
	if err != nil {
		log.WithFields(log.Fields{
			"display": c.FormValue("display"),
			"err":     err,
		}).Error("Failed adding location")
		return echo.NewHTTPError(http.StatusInternalServerError, err.Error())
	}
	return c.Redirect(http.StatusSeeOther, "/admin")
}

func siteNew(c echo.Context) error {
	session := session.Default(c)
	site := session.Get("site").(string)
	s, err := mdl.GetSite(site)
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed getting that site")
		return echo.NewHTTPError(http.StatusNotFound, err.Error())
	}

	return c.HTML(http.StatusOK, admin.Site(s, &mdl.Site{}))
}

func siteSave(c echo.Context) error {
	err := mdl.AddSite(mdl.Site{
		Name:  c.FormValue("name"),
		Title: c.FormValue("title"),
	})
	if err != nil {
		log.WithFields(log.Fields{
			"name": c.FormValue("name"),
			"err":  err,
		}).Error("Failed adding site")
		return echo.NewHTTPError(http.StatusInternalServerError, err.Error())
	}
	return c.Redirect(http.StatusSeeOther, "/admin")
}

func aTrucks(c echo.Context) error {
	session := session.Default(c)
	site := session.Get("site").(string)
	s, err := mdl.GetSite(site)
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed getting that site")
		return echo.NewHTTPError(http.StatusNotFound, err.Error())
	}
	trucks, _ := mdl.AllTrucks(site)
	return c.HTML(http.StatusOK, admin.Trucks(s, trucks))
}

func truckEdit(c echo.Context) error {
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
	t := mdl.GetTruck(c.QueryParam("twitname"))
	return c.HTML(http.StatusOK, admin.Truck(s, sites, t[0]))
}

func truckUpdate(c echo.Context) error {
	err := mdl.UpdateTruck(mdl.Truck{
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
		}).Error("Failed updating truck")
		return echo.NewHTTPError(http.StatusInternalServerError, "")
	}
	return c.Redirect(http.StatusSeeOther, "/admin")
}

func aSubs(c echo.Context) error {
	session := session.Default(c)
	site := session.Get("site").(string)
	s, err := mdl.GetSite(site)
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed getting that site")
		return echo.NewHTTPError(http.StatusNotFound, err.Error())
	}
	subs, _ := mdl.GetSubs()
	return c.HTML(http.StatusOK, admin.Subs(s, subs))
}

func subEdit(c echo.Context) error {
	session := session.Default(c)
	site := session.Get("site").(string)
	s, err := mdl.GetSite(site)
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed getting that site")
		return echo.NewHTTPError(http.StatusNotFound, err.Error())
	}
	sub, _ := mdl.GetSub(c.QueryParam("id"))
	return c.HTML(http.StatusOK, admin.Sub(s, sub))
}

func subUpdate(c echo.Context) error {
	i, err := strconv.Atoi(c.FormValue("id"))
	if err != nil {
		log.WithError(err).Error("Failed converting id, updating sub")
		return echo.NewHTTPError(http.StatusBadRequest, "id NaN")
	}
	err = mdl.UpdateSub(mdl.Sub{
		ID:          i,
		Regex:       c.FormValue("regex"),
		Replacement: c.FormValue("replacement"),
	})
	if err != nil {
		log.WithFields(log.Fields{
			"err":   err,
			"Regex": c.FormValue("regex"),
		}).Error("Failed updating sub")
		return echo.NewHTTPError(http.StatusInternalServerError, "")
	}
	return c.Redirect(http.StatusSeeOther, "/admin")
}

func aAds(c echo.Context) error {
	session := session.Default(c)
	site := session.Get("site").(string)
	s, err := mdl.GetSite(site)
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed getting that site")
		return echo.NewHTTPError(http.StatusNotFound, err.Error())
	}
	ads, _ := mdl.GetAds()
	return c.HTML(http.StatusOK, admin.Ads(s, ads))
}

func adEdit(c echo.Context) error {
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

	ad, _ := mdl.GetAd(c.QueryParam("id"))
	return c.HTML(http.StatusOK, admin.Ad(s, sites, ad))
}

func adUpdate(c echo.Context) error {
	i, err := strconv.Atoi(c.FormValue("id"))
	if err != nil {
		log.WithError(err).Error("Failed converting id, updating ad")
		return echo.NewHTTPError(http.StatusBadRequest, "id NaN")
	}
	i2, err := strconv.ParseInt(c.FormValue("validuntil"), 10, 64)
	if err != nil {
		log.WithError(err).Error("Failed converting validuntil, saving ad")
		return echo.NewHTTPError(http.StatusBadRequest, "Valid Until NaN")
	}

	err = mdl.UpdateAd(mdl.Ad{
		ID:         i,
		Name:       c.FormValue("name"),
		Value:      c.FormValue("value"),
		ValidUntil: i2,
		Site:       c.FormValue("site"),
	})
	if err != nil {
		log.WithFields(log.Fields{
			"err":   err,
			"Regex": c.FormValue("regex"),
		}).Error("Failed updating sub")
		return echo.NewHTTPError(http.StatusInternalServerError, "")
	}
	return c.Redirect(http.StatusSeeOther, "/admin")
}

func aLocations(c echo.Context) error {
	session := session.Default(c)
	site := session.Get("site").(string)
	s, err := mdl.GetSite(site)
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed getting that site")
		return echo.NewHTTPError(http.StatusNotFound, err.Error())
	}
	locations, _ := mdl.GetLocations()
	return c.HTML(http.StatusOK, admin.Locs(s, locations[site]))
}

func locEdit(c echo.Context) error {
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

	zones, err := mdl.GetZones(site)
	if err != nil {
		log.WithError(err).Error("Failed gettings zones")
	}

	loc, _ := mdl.GetLocation(c.QueryParam("id"))

	return c.HTML(http.StatusOK, admin.Loc(s, sites, zones, &loc))
}

func locUpdate(c echo.Context) error {
	i, err := strconv.Atoi(c.FormValue("id"))
	if err != nil {
		log.WithError(err).Error("Failed converting id, updating loc")
		return echo.NewHTTPError(http.StatusBadRequest, "id NaN")
	}

	lat, err1 := strconv.ParseFloat(c.FormValue("lat"), 32)
	long, err2 := strconv.ParseFloat(c.FormValue("long"), 32)
	if err1 != nil || err2 != nil {
		log.WithFields(log.Fields{
			"err1": err1,
			"err2": err2,
		}).Error("Failed converting lat or long, saving loc")
		return echo.NewHTTPError(http.StatusBadRequest, "lat or long NaN")
	}

	err = mdl.UpdateLocation(mdl.Location{
		ID:      i,
		Display: c.FormValue("display"),
		Matcher: c.FormValue("matcher"),
		Lat:     float32(lat),
		Long:    float32(long),
		Zone:    c.FormValue("zone"),
		Site:    c.FormValue("site"),
	})
	if err != nil {
		log.WithFields(log.Fields{
			"err":     err,
			"Display": c.FormValue("Display"),
		}).Error("Failed updating location")
		return echo.NewHTTPError(http.StatusInternalServerError, "")
	}
	return c.Redirect(http.StatusSeeOther, "/admin")
}

func aSites(c echo.Context) error {
	session := session.Default(c)
	site := session.Get("site").(string)
	s, err := mdl.GetSite(site)
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed getting that site")
		return echo.NewHTTPError(http.StatusNotFound, err.Error())
	}
	sites, _ := mdl.GetSites()
	return c.HTML(http.StatusOK, admin.Sites(s, sites))
}
