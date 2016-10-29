package main

import (
	"net/http"
	"net/url"
	"os"
	"strconv"
	"strings"

	"wanderinglunch/model"
	"wanderinglunch/updator"
	"wanderinglunch/view/admin"

	log "github.com/Sirupsen/logrus"
	"github.com/labstack/echo"
	"github.com/peppage/echo-middleware/session"
	"github.com/peppage/foursquarego"
)

var clientID = os.Getenv("CLIENT_ID")
var clientSecret = os.Getenv("CLIENT_SECRET")

func setSite(c echo.Context) error {
	session := session.Default(c)
	session.Set("site", c.QueryParam("site"))
	session.Save()
	return c.JSON(http.StatusOK, "ok")
}

func adminRoot(c echo.Context) error {
	session := session.Default(c)
	site := session.Get("site").(string)
	trucks, err := model.GetFailedUpdates(site)
	if err != nil {
		log.WithError(err).Error("Failed getting admin trucks")
	}

	s, err := model.GetSite(site)
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
	s, err := model.GetSite(site)
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed getting that site")
		return echo.NewHTTPError(http.StatusNotFound, "")
	}

	sites, err := model.GetSites()
	if err != nil {
		log.WithError(err).Error("Failed gettings sites")
	}
	return c.HTML(http.StatusOK, admin.Truck(s, sites, &model.Truck{}))
}

func truckSave(c echo.Context) error {
	err := model.AddTruck(model.Truck{
		ID:         strings.ToLower(c.FormValue("twitname")),
		Name:       c.FormValue("name"),
		Twitname:   strings.ToLower(c.FormValue("twitname")),
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
	return c.Redirect(http.StatusSeeOther, "/admin/truck/add")
}

func subNew(c echo.Context) error {
	session := session.Default(c)
	site := session.Get("site").(string)
	s, err := model.GetSite(site)
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed getting that site")
		return echo.NewHTTPError(http.StatusNotFound, err.Error())
	}

	return c.HTML(http.StatusOK, admin.Sub(s, &model.Sub{}))
}

func subSave(c echo.Context) error {
	err := model.AddSub(model.Sub{
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
	s, err := model.GetSite(site)
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed getting that site")
		return echo.NewHTTPError(http.StatusNotFound, err.Error())
	}

	sites, err := model.GetSites()
	if err != nil {
		log.WithError(err).Error("Failed gettings sites")
	}

	return c.HTML(http.StatusOK, admin.Ad(s, sites, &model.Ad{}))
}

func adSave(c echo.Context) error {
	i, err := strconv.ParseInt(c.FormValue("validuntil"), 10, 64)
	if err != nil {
		log.WithError(err).Error("Failed converting validuntil, saving ad")
		return echo.NewHTTPError(http.StatusBadRequest, "Valid Until NaN")
	}
	err = data.AddAd(&model.Ad{
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
	s, err := model.GetSite(site)
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed getting that site")
		return echo.NewHTTPError(http.StatusNotFound, err.Error())
	}

	sites, err := model.GetSites()
	if err != nil {
		log.WithError(err).Error("Failed gettings sites")
	}

	zones, err := model.GetZones(site)
	if err != nil {
		log.WithError(err).Error("Failed gettings zones")
	}

	return c.HTML(http.StatusOK, admin.Loc(s, sites, zones, &model.Location{}))
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
	err := model.AddLocation(model.Location{
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
	return c.Redirect(http.StatusSeeOther, "/admin/location/add")
}

func siteNew(c echo.Context) error {
	session := session.Default(c)
	site := session.Get("site").(string)
	s, err := model.GetSite(site)
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed getting that site")
		return echo.NewHTTPError(http.StatusNotFound, err.Error())
	}

	return c.HTML(http.StatusOK, admin.Site(s, &model.Site{}))
}

func siteSave(c echo.Context) error {
	lat, err1 := strconv.ParseFloat(c.FormValue("lat"), 32)
	long, err2 := strconv.ParseFloat(c.FormValue("long"), 32)
	if err1 != nil || err2 != nil {
		log.WithFields(log.Fields{
			"err1": err1,
			"err2": err2,
		}).Error("Failed converting lat or long, saving site")
		return echo.NewHTTPError(http.StatusBadRequest, "lat or long NaN")
	}
	err := model.AddSite(model.Site{
		Name:        c.FormValue("name"),
		Title:       c.FormValue("title"),
		Description: c.FormValue("description"),
		Lat:         float32(lat),
		Long:        float32(long),
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
	s, err := model.GetSite(site)
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed getting that site")
		return echo.NewHTTPError(http.StatusNotFound, err.Error())
	}
	trucks, _ := model.AllTrucks(site)
	return c.HTML(http.StatusOK, admin.Trucks(s, trucks))
}

func truckEdit(c echo.Context) error {
	session := session.Default(c)
	site := session.Get("site").(string)
	s, err := model.GetSite(site)
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed getting that site")
		return echo.NewHTTPError(http.StatusNotFound, "")
	}

	sites, err := model.GetSites()
	if err != nil {
		log.WithError(err).Error("Failed gettings sites")
	}
	t := model.GetTruck(c.QueryParam("twitname"))
	return c.HTML(http.StatusOK, admin.Truck(s, sites, t[0]))
}

func truckUpdate(c echo.Context) error {
	a := false
	if c.FormValue("archive") != "" && c.FormValue("archive") == "on" {
		a = true
	}
	err := model.UpdateTruck(model.Truck{
		ID:         strings.ToLower(c.FormValue("twitname")),
		Name:       c.FormValue("name"),
		Twitname:   strings.ToLower(c.FormValue("twitname")),
		Weburl:     c.FormValue("weburl"),
		Type:       c.FormValue("type"),
		About:      c.FormValue("about"),
		Foursquare: c.FormValue("foursquare"),
		Archive:    a,
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
	s, err := model.GetSite(site)
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed getting that site")
		return echo.NewHTTPError(http.StatusNotFound, err.Error())
	}
	subs, _ := model.GetSubs()
	return c.HTML(http.StatusOK, admin.Subs(s, subs))
}

func subEdit(c echo.Context) error {
	session := session.Default(c)
	site := session.Get("site").(string)
	s, err := model.GetSite(site)
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed getting that site")
		return echo.NewHTTPError(http.StatusNotFound, err.Error())
	}
	sub, _ := model.GetSub(c.QueryParam("id"))
	return c.HTML(http.StatusOK, admin.Sub(s, sub))
}

func subUpdate(c echo.Context) error {
	i, err := strconv.Atoi(c.FormValue("id"))
	if err != nil {
		log.WithError(err).Error("Failed converting id, updating sub")
		return echo.NewHTTPError(http.StatusBadRequest, "id NaN")
	}
	err = model.UpdateSub(model.Sub{
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
	s, err := model.GetSite(site)
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed getting that site")
		return echo.NewHTTPError(http.StatusNotFound, err.Error())
	}
	ads, _ := data.GetAds()
	return c.HTML(http.StatusOK, admin.Ads(s, ads))
}

func adEdit(c echo.Context) error {
	session := session.Default(c)
	site := session.Get("site").(string)
	s, err := model.GetSite(site)
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed getting that site")
		return echo.NewHTTPError(http.StatusNotFound, err.Error())
	}

	sites, err := model.GetSites()
	if err != nil {
		log.WithError(err).Error("Failed gettings sites")
	}

	ad, _ := data.GetAd(c.QueryParam("id"))
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

	err = data.UpdateAd(&model.Ad{
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
	s, err := model.GetSite(site)
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed getting that site")
		return echo.NewHTTPError(http.StatusNotFound, err.Error())
	}
	locations, _ := model.GetLocations()
	return c.HTML(http.StatusOK, admin.Locs(s, locations[site]))
}

func locEdit(c echo.Context) error {
	session := session.Default(c)
	site := session.Get("site").(string)
	s, err := model.GetSite(site)
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed getting that site")
		return echo.NewHTTPError(http.StatusNotFound, err.Error())
	}

	sites, err := model.GetSites()
	if err != nil {
		log.WithError(err).Error("Failed gettings sites")
	}

	zones, err := model.GetZones(site)
	if err != nil {
		log.WithError(err).Error("Failed gettings zones")
	}

	loc, _ := model.GetLocation(c.QueryParam("id"))

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

	err = model.UpdateLocation(model.Location{
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
	s, err := model.GetSite(site)
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed getting that site")
		return echo.NewHTTPError(http.StatusNotFound, err.Error())
	}
	sites, _ := model.GetSites()
	return c.HTML(http.StatusOK, admin.Sites(s, sites))
}

func siteEdit(c echo.Context) error {
	session := session.Default(c)
	site := session.Get("site").(string)
	s, err := model.GetSite(site)
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed getting that site")
		return echo.NewHTTPError(http.StatusNotFound, err.Error())
	}

	thisSite, _ := model.GetSite(c.QueryParam("name"))

	return c.HTML(http.StatusOK, admin.Site(s, thisSite))
}

func siteUpdate(c echo.Context) error {
	lat, err1 := strconv.ParseFloat(c.FormValue("lat"), 32)
	long, err2 := strconv.ParseFloat(c.FormValue("long"), 32)
	if err1 != nil || err2 != nil {
		log.WithFields(log.Fields{
			"err1": err1,
			"err2": err2,
		}).Error("Failed converting lat or long, updating site")
		return echo.NewHTTPError(http.StatusBadRequest, "lat or long NaN")
	}
	err := model.UpdateSite(model.Site{
		Name:        c.FormValue("name"),
		Title:       c.FormValue("title"),
		Description: c.FormValue("description"),
		Lat:         float32(lat),
		Long:        float32(long),
	})

	if err != nil {
		log.WithFields(log.Fields{
			"err":  err,
			"Name": c.FormValue("name"),
		}).Error("Failed updating site")
		return echo.NewHTTPError(http.StatusInternalServerError, "")
	}
	return c.Redirect(http.StatusSeeOther, "/admin")
}

func foursquare(c echo.Context) error {
	api := foursquarego.NewFoursquareApi(clientID, clientSecret)
	uv := url.Values{}
	uv.Set("limit", "200")
	p, err := api.GetVenuePhotos(c.QueryParam("id"), uv)
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
			"id":  c.QueryParam("id"),
		}).Error("Failed getting foursquare images admin")
		return echo.NewHTTPError(http.StatusInternalServerError, "")
	}
	return c.JSON(http.StatusOK, p)
}

func imgAdd(c echo.Context) error {
	err := model.AddImage(model.Image{
		ID:         c.FormValue("id"),
		Suffix:     c.FormValue("suffix"),
		Visibility: "public",
		Twitname:   strings.ToLower(c.FormValue("twitname")),
		Menu:       false,
	})
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
			"ID":  c.FormValue("id"),
		}).Error("Failed adding image")
		return echo.NewHTTPError(http.StatusInternalServerError, "")
	}
	return c.String(http.StatusOK, "ok")
}

func imgEdit(c echo.Context) error {
	session := session.Default(c)
	site := session.Get("site").(string)
	s, err := model.GetSite(site)
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed getting that site")
		return echo.NewHTTPError(http.StatusNotFound, err.Error())
	}

	img, _ := model.GetImage(c.QueryParam("id"))

	return c.HTML(http.StatusOK, admin.Image(s, &img))
}

func imgUpdate(c echo.Context) error {
	m := false
	if c.FormValue("menu") != "" && c.FormValue("menu") == "on" {
		m = true
	}
	err := model.UpdateImage(model.Image{
		ID:         c.FormValue("id"),
		Suffix:     c.FormValue("suffix"),
		Visibility: c.FormValue("visibility"),
		Twitname:   strings.ToLower(c.FormValue("twitname")),
		Menu:       m,
	})
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
			"ID":  c.FormValue("id"),
		}).Error("Failed saving image")
		return echo.NewHTTPError(http.StatusInternalServerError, "")
	}
	return c.Redirect(http.StatusSeeOther, "/admin/truck/edit?twitname="+c.FormValue("twitname"))
}

func queue(c echo.Context) error {
	session := session.Default(c)
	site := session.Get("site").(string)
	s, err := model.GetSite(site)
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed getting that site")
		return echo.NewHTTPError(http.StatusNotFound, err.Error())
	}
	t, err := model.GetSiteTweets(s.Name, 20)
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed getting site tweets")
		return echo.NewHTTPError(http.StatusInternalServerError, err.Error())
	}
	l, err := model.GetLocations()
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed getting locations")
		return echo.NewHTTPError(http.StatusInternalServerError, err.Error())
	}
	subs, err := model.GetSubs()
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed getting subs")
		return echo.NewHTTPError(http.StatusInternalServerError, err.Error())
	}
	return c.HTML(http.StatusOK, admin.Queue(s, t, l[s.Name], subs))
}

func queueDone(c echo.Context) error {
	err := model.MarkTweetDone(c.QueryParam("id"))
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed marking tweet done")
	}
	return c.Redirect(http.StatusSeeOther, "/admin/queue")
}
