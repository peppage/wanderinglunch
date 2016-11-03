package main

import (
	"encoding/json"
	"net/http"
	"net/url"
	"strconv"
	"strings"

	"wanderinglunch/model"
	"wanderinglunch/updator"
	"wanderinglunch/view"

	log "github.com/Sirupsen/logrus"
	"github.com/peppage/foursquarego"
)

func getSiteFromContext(r *http.Request) *model.Site {
	ctx := r.Context()
	return ctx.Value(siteKey).(*model.Site)
}

func setSite(w http.ResponseWriter, r *http.Request) {
	sessions.SetSite(w, r, r.FormValue("site"))
	w.Write([]byte("ok"))
}

func adminRoot(w http.ResponseWriter, r *http.Request) {
	s := sessions.GetSite(r)
	site, _ := data.GetSite(s)
	basePage := getBasePageFromCtx(r)
	basePage.Site = site

	trucks, err := data.GetFailedUpdates(site.Name)
	if err != nil {
		log.WithError(err).Error("Failed getting admin trucks")
		return
	}

	p := &view.Admin{
		BasePage: basePage,
		Trucks:   trucks,
	}

	view.WritePageTemplate(w, p)
}

func debug(w http.ResponseWriter, r *http.Request) {
	basePage := getBasePageFromCtx(r)
	basePage.Site = &model.Site{}

	n := r.FormValue("twitname")
	if n != "" {
		texts, _ := updator.GetReplacedStrings(n)
		p := &view.DebugShow{
			BasePage: basePage,
			Twitname: n,
			Texts:    texts,
		}
		view.WritePageTemplate(w, p)
		return
	}
	p := &view.Debug{
		BasePage: basePage,
	}
	view.WritePageTemplate(w, p)
}

func truckNew(w http.ResponseWriter, r *http.Request) {
	s := sessions.GetSite(r)
	site, _ := data.GetSite(s)
	basePage := getBasePageFromCtx(r)
	basePage.Site = site

	p := &view.AdminTruck{
		BasePage: basePage,
		Sites:    basePage.Sites,
		Truck:    &model.Truck{},
	}

	view.WritePageTemplate(w, p)
}

func truckSave(w http.ResponseWriter, r *http.Request) {
	err := data.AddTruck(&model.Truck{
		ID:         strings.ToLower(r.FormValue("twitname")),
		Name:       r.FormValue("name"),
		Twitname:   strings.ToLower(r.FormValue("twitname")),
		Weburl:     r.FormValue("weburl"),
		Type:       r.FormValue("type"),
		About:      r.FormValue("about"),
		Foursquare: r.FormValue("foursquare"),
		Site:       r.FormValue("site"),
	})
	if err != nil {
		log.WithFields(log.Fields{
			"err":  err,
			"Name": r.FormValue("name"),
		}).Error("Failed adding truck")
		http.Error(w, http.StatusText(http.StatusInternalServerError), http.StatusInternalServerError)
		return
	}
	http.Redirect(w, r, "/admin/truck/add", http.StatusSeeOther)
}

func subNew(w http.ResponseWriter, r *http.Request) {
	s := sessions.GetSite(r)
	site, _ := data.GetSite(s)
	basePage := getBasePageFromCtx(r)
	basePage.Site = site

	p := &view.Sub{
		BasePage: basePage,
		Sub:      &model.Sub{},
	}

	view.WritePageTemplate(w, p)
}

func subSave(w http.ResponseWriter, r *http.Request) {
	err := data.AddSub(&model.Sub{
		Regex:       r.FormValue("regex"),
		Replacement: r.FormValue("replacement"),
	})
	if err != nil {
		log.WithFields(log.Fields{
			"regex": r.FormValue("regex"),
			"err":   err,
		}).Error("Failed adding sub")
		http.Error(w, http.StatusText(http.StatusInternalServerError), http.StatusInternalServerError)
	}
	http.Redirect(w, r, "/admin", http.StatusSeeOther)
}

func adNew(w http.ResponseWriter, r *http.Request) {
	s := sessions.GetSite(r)
	site, _ := data.GetSite(s)
	basePage := getBasePageFromCtx(r)
	basePage.Site = site

	p := &view.Ad{
		BasePage: basePage,
		Sites:    basePage.Sites,
		Ad:       &model.Ad{},
	}
	view.WritePageTemplate(w, p)
}

func adSave(w http.ResponseWriter, r *http.Request) {
	i, err := strconv.ParseInt(r.FormValue("validuntil"), 10, 64)
	if err != nil {
		log.WithError(err).Error("Failed converting validuntil, saving ad")
		http.Error(w, http.StatusText(http.StatusBadRequest), http.StatusBadRequest)
		return
	}
	err = data.AddAd(&model.Ad{
		Name:       r.FormValue("name"),
		Value:      r.FormValue("value"),
		ValidUntil: i,
		Site:       r.FormValue("site"),
	})
	if err != nil {
		log.WithFields(log.Fields{
			"name": r.FormValue("name"),
			"err":  err,
		}).Error("Failed adding ad")
		http.Error(w, http.StatusText(http.StatusInternalServerError), http.StatusInternalServerError)
		return
	}
	http.Redirect(w, r, "/admin", http.StatusSeeOther)
}

func locNew(w http.ResponseWriter, r *http.Request) {
	s := sessions.GetSite(r)
	site, _ := data.GetSite(s)
	basePage := getBasePageFromCtx(r)
	basePage.Site = site

	zones, err := data.GetZones(site.Name)
	if err != nil {
		log.WithError(err).Error("Failed gettings zones")
	}

	p := &view.Location{
		BasePage: basePage,
		Sites:    basePage.Sites,
		Zones:    zones,
		Location: &model.Location{},
	}
	view.WritePageTemplate(w, p)
}

func locSave(w http.ResponseWriter, r *http.Request) {
	lat, err1 := strconv.ParseFloat(r.FormValue("lat"), 32)
	long, err2 := strconv.ParseFloat(r.FormValue("long"), 32)
	if err1 != nil || err2 != nil {
		log.WithFields(log.Fields{
			"err1": err1,
			"err2": err2,
		}).Error("Failed converting lat or long, saving loc")
		http.Error(w, http.StatusText(http.StatusBadRequest), http.StatusBadRequest)
		return
	}
	err := data.AddLocation(&model.Location{
		Display: r.FormValue("display"),
		Matcher: r.FormValue("matcher"),
		Lat:     float32(lat),
		Long:    float32(long),
		Zone:    r.FormValue("zone"),
		Site:    r.FormValue("site"),
	})
	if err != nil {
		log.WithFields(log.Fields{
			"display": r.FormValue("display"),
			"err":     err,
		}).Error("Failed adding location")
		http.Error(w, http.StatusText(http.StatusInternalServerError), http.StatusInternalServerError)
		return
	}
	http.Redirect(w, r, "/admin/location/add", http.StatusSeeOther)
}

func siteNew(w http.ResponseWriter, r *http.Request) {
	s := sessions.GetSite(r)
	site, _ := data.GetSite(s)
	basePage := getBasePageFromCtx(r)
	basePage.Site = site

	p := &view.Site{
		BasePage: basePage,
		Site:     &model.Site{},
	}

	view.WritePageTemplate(w, p)
}

func siteSave(w http.ResponseWriter, r *http.Request) {
	lat, err1 := strconv.ParseFloat(r.FormValue("lat"), 32)
	long, err2 := strconv.ParseFloat(r.FormValue("long"), 32)
	if err1 != nil || err2 != nil {
		log.WithFields(log.Fields{
			"err1": err1,
			"err2": err2,
		}).Error("Failed converting lat or long, saving site")
		http.Error(w, http.StatusText(http.StatusBadRequest), http.StatusBadRequest)
		return
	}
	err := data.AddSite(&model.Site{
		Name:        r.FormValue("name"),
		Title:       r.FormValue("title"),
		Description: r.FormValue("description"),
		Lat:         float32(lat),
		Long:        float32(long),
	})
	if err != nil {
		log.WithFields(log.Fields{
			"name": r.FormValue("name"),
			"err":  err,
		}).Error("Failed adding site")
		http.Error(w, http.StatusText(http.StatusInternalServerError), http.StatusInternalServerError)
		return
	}
	http.Redirect(w, r, "/admin", http.StatusSeeOther)
}

func aTrucks(w http.ResponseWriter, r *http.Request) {
	s := sessions.GetSite(r)
	site, _ := data.GetSite(s)
	basePage := getBasePageFromCtx(r)
	basePage.Site = site

	trucks, _ := data.AllTrucks(site.Name)

	p := &view.Trucks{
		BasePage: basePage,
		Trucks:   trucks,
	}

	view.WritePageTemplate(w, p)
}

func truckEdit(w http.ResponseWriter, r *http.Request) {
	s := sessions.GetSite(r)
	site, _ := data.GetSite(s)
	basePage := getBasePageFromCtx(r)
	basePage.Site = site

	t := data.GetTruck(r.FormValue("twitname"))

	p := &view.AdminTruck{
		BasePage: basePage,
		Sites:    basePage.Sites,
		Truck:    t[0],
	}

	view.WritePageTemplate(w, p)
}

func truckUpdate(w http.ResponseWriter, r *http.Request) {
	a := false
	if r.FormValue("archive") != "" && r.FormValue("archive") == "on" {
		a = true
	}
	err := data.UpdateTruck(&model.Truck{
		ID:         strings.ToLower(r.FormValue("twitname")),
		Name:       r.FormValue("name"),
		Twitname:   strings.ToLower(r.FormValue("twitname")),
		Weburl:     r.FormValue("weburl"),
		Type:       r.FormValue("type"),
		About:      r.FormValue("about"),
		Foursquare: r.FormValue("foursquare"),
		Archive:    a,
		Site:       r.FormValue("site"),
	})
	if err != nil {
		log.WithFields(log.Fields{
			"err":  err,
			"Name": r.FormValue("name"),
		}).Error("Failed updating truck")
		http.Error(w, http.StatusText(http.StatusInternalServerError), http.StatusInternalServerError)
		return
	}
	http.Redirect(w, r, "/admin", http.StatusSeeOther)
}

func aSubs(w http.ResponseWriter, r *http.Request) {
	s := sessions.GetSite(r)
	site, _ := data.GetSite(s)
	basePage := getBasePageFromCtx(r)
	basePage.Site = site

	subs, _ := data.GetSubs()

	p := &view.Subs{
		BasePage: basePage,
		Subs:     subs,
	}

	view.WritePageTemplate(w, p)
}

func subEdit(w http.ResponseWriter, r *http.Request) {
	s := sessions.GetSite(r)
	site, _ := data.GetSite(s)
	basePage := getBasePageFromCtx(r)
	basePage.Site = site

	id, err := strconv.Atoi(r.FormValue("id"))
	if err != nil {
		log.WithError(err).Error("Failed getting that sub")
		http.Error(w, http.StatusText(http.StatusBadRequest), http.StatusBadRequest)
		return
	}

	sub, _ := data.GetSub(id)

	p := &view.Sub{
		BasePage: basePage,
		Sub:      sub,
	}

	view.WritePageTemplate(w, p)
}

func subUpdate(w http.ResponseWriter, r *http.Request) {
	i, err := strconv.Atoi(r.FormValue("id"))
	if err != nil {
		log.WithError(err).Error("Failed converting id, updating sub")
		http.Error(w, http.StatusText(http.StatusBadRequest), http.StatusBadRequest)
		return
	}
	err = data.UpdateSub(&model.Sub{
		ID:          i,
		Regex:       r.FormValue("regex"),
		Replacement: r.FormValue("replacement"),
	})
	if err != nil {
		log.WithFields(log.Fields{
			"err":   err,
			"Regex": r.FormValue("regex"),
		}).Error("Failed updating sub")
		http.Error(w, http.StatusText(http.StatusInternalServerError), http.StatusInternalServerError)
		return
	}
	http.Redirect(w, r, "/admin", http.StatusSeeOther)
}

func aAds(w http.ResponseWriter, r *http.Request) {
	s := sessions.GetSite(r)
	site, _ := data.GetSite(s)
	basePage := getBasePageFromCtx(r)
	basePage.Site = site

	ads, _ := data.GetAds()
	p := &view.Ads{
		BasePage: basePage,
		Ads:      ads,
	}
	view.WritePageTemplate(w, p)
}

func adEdit(w http.ResponseWriter, r *http.Request) {
	s := sessions.GetSite(r)
	site, _ := data.GetSite(s)
	basePage := getBasePageFromCtx(r)
	basePage.Site = site

	id, err := strconv.ParseInt(r.FormValue("id"), 10, 0)
	if err != nil {
		http.Error(w, http.StatusText(http.StatusBadRequest), http.StatusBadRequest)
		return
	}
	ad, _ := data.GetAd(int(id))

	p := &view.Ad{
		BasePage: basePage,
		Sites:    basePage.Sites,
		Ad:       ad,
	}
	view.WritePageTemplate(w, p)
}

func adUpdate(w http.ResponseWriter, r *http.Request) {
	i, err := strconv.Atoi(r.FormValue("id"))
	if err != nil {
		log.WithError(err).Error("Failed converting id, updating ad")
		http.Error(w, http.StatusText(http.StatusBadRequest), http.StatusBadRequest)
		return
	}
	i2, err := strconv.ParseInt(r.FormValue("validuntil"), 10, 64)
	if err != nil {
		log.WithError(err).Error("Failed converting validuntil, saving ad")
		http.Error(w, http.StatusText(http.StatusBadRequest), http.StatusBadRequest)
		return
	}

	err = data.UpdateAd(&model.Ad{
		ID:         i,
		Name:       r.FormValue("name"),
		Value:      r.FormValue("value"),
		ValidUntil: i2,
		Site:       r.FormValue("site"),
	})
	if err != nil {
		log.WithFields(log.Fields{
			"err":   err,
			"Regex": r.FormValue("regex"),
		}).Error("Failed updating sub")
		http.Error(w, http.StatusText(http.StatusInternalServerError), http.StatusInternalServerError)
		return
	}
	http.Redirect(w, r, "/admin", http.StatusSeeOther)
}

func aLocations(w http.ResponseWriter, r *http.Request) {
	s := sessions.GetSite(r)
	site, _ := data.GetSite(s)
	basePage := getBasePageFromCtx(r)
	basePage.Site = site

	locations, _ := data.GetLocations()
	p := &view.Locations{
		BasePage:  basePage,
		Locations: locations[site.Name],
	}

	view.WritePageTemplate(w, p)
}

func locEdit(w http.ResponseWriter, r *http.Request) {
	s := sessions.GetSite(r)
	site, _ := data.GetSite(s)
	basePage := getBasePageFromCtx(r)
	basePage.Site = site

	zones, err := data.GetZones(site.Name)
	if err != nil {
		log.WithError(err).Error("Failed gettings zones")
	}

	loc, _ := data.GetLocation(r.FormValue("id"))

	p := &view.Location{
		BasePage: basePage,
		Sites:    basePage.Sites,
		Zones:    zones,
		Location: loc,
	}

	view.WritePageTemplate(w, p)
}

func locUpdate(w http.ResponseWriter, r *http.Request) {
	i, err := strconv.Atoi(r.FormValue("id"))
	if err != nil {
		log.WithError(err).Error("Failed converting id, updating loc")
		http.Error(w, http.StatusText(http.StatusBadRequest), http.StatusBadRequest)
		return
	}

	lat, err1 := strconv.ParseFloat(r.FormValue("lat"), 32)
	long, err2 := strconv.ParseFloat(r.FormValue("long"), 32)
	if err1 != nil || err2 != nil {
		log.WithFields(log.Fields{
			"err1": err1,
			"err2": err2,
		}).Error("Failed converting lat or long, saving loc")
		http.Error(w, http.StatusText(http.StatusBadRequest), http.StatusBadRequest)
		return
	}

	err = data.UpdateLocation(&model.Location{
		ID:      i,
		Display: r.FormValue("display"),
		Matcher: r.FormValue("matcher"),
		Lat:     float32(lat),
		Long:    float32(long),
		Zone:    r.FormValue("zone"),
		Site:    r.FormValue("site"),
	})
	if err != nil {
		log.WithFields(log.Fields{
			"err":     err,
			"Display": r.FormValue("Display"),
		}).Error("Failed updating location")
		http.Error(w, http.StatusText(http.StatusInternalServerError), http.StatusInternalServerError)
		return
	}
	http.Redirect(w, r, "/admin", http.StatusSeeOther)
}

func aSites(w http.ResponseWriter, r *http.Request) {
	s := sessions.GetSite(r)
	site, _ := data.GetSite(s)
	basePage := getBasePageFromCtx(r)
	basePage.Site = site

	p := &view.Sites{
		BasePage: basePage,
		Sites:    basePage.Sites,
	}

	view.WritePageTemplate(w, p)
}

func siteEdit(w http.ResponseWriter, r *http.Request) {
	s := sessions.GetSite(r)
	site, _ := data.GetSite(s)
	basePage := getBasePageFromCtx(r)
	basePage.Site = site

	thisSite, _ := data.GetSite(r.FormValue("name"))

	p := &view.Site{
		BasePage: basePage,
		Site:     thisSite,
	}

	view.WritePageTemplate(w, p)
}

func siteUpdate(w http.ResponseWriter, r *http.Request) {
	lat, err1 := strconv.ParseFloat(r.FormValue("lat"), 32)
	long, err2 := strconv.ParseFloat(r.FormValue("long"), 32)
	if err1 != nil || err2 != nil {
		log.WithFields(log.Fields{
			"err1": err1,
			"err2": err2,
		}).Error("Failed converting lat or long, updating site")
		http.Error(w, http.StatusText(http.StatusBadRequest), http.StatusBadRequest)
		return
	}
	err := data.UpdateSite(&model.Site{
		Name:        r.FormValue("name"),
		Title:       r.FormValue("title"),
		Description: r.FormValue("description"),
		Lat:         float32(lat),
		Long:        float32(long),
	})

	if err != nil {
		log.WithFields(log.Fields{
			"err":  err,
			"Name": r.FormValue("name"),
		}).Error("Failed updating site")
		http.Error(w, http.StatusText(http.StatusInternalServerError), http.StatusInternalServerError)
		return
	}
	http.Redirect(w, r, "/admin", http.StatusSeeOther)
}

func foursquare(w http.ResponseWriter, r *http.Request) {
	api := foursquarego.NewFoursquareApi(webSettings.FoursquareClientID(), webSettings.FoursquareClientSecret())
	uv := url.Values{}
	uv.Set("limit", "200")
	p, err := api.GetVenuePhotos(r.FormValue("id"), uv)
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
			"id":  r.FormValue("id"),
		}).Error("Failed getting foursquare images admin")
		http.Error(w, http.StatusText(http.StatusInternalServerError), http.StatusInternalServerError)
		return
	}
	js, _ := json.Marshal(p)
	w.Write(js)
}

func imgAdd(w http.ResponseWriter, r *http.Request) {
	err := data.AddImage(&model.Image{
		ID:         r.FormValue("id"),
		Suffix:     r.FormValue("suffix"),
		Visibility: "public",
		Twitname:   strings.ToLower(r.FormValue("twitname")),
		Menu:       false,
	})
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
			"ID":  r.FormValue("id"),
		}).Error("Failed adding image")
		http.Error(w, http.StatusText(http.StatusInternalServerError), http.StatusInternalServerError)
		return
	}
	w.Write([]byte("ok"))
}

func imgEdit(w http.ResponseWriter, r *http.Request) {
	s := sessions.GetSite(r)
	site, _ := data.GetSite(s)
	basePage := getBasePageFromCtx(r)
	basePage.Site = site

	img, _ := data.GetImage(r.FormValue("id"))

	p := &view.Image{
		BasePage: basePage,
		Image:    img,
	}

	view.WritePageTemplate(w, p)
}

func imgUpdate(w http.ResponseWriter, r *http.Request) {
	m := false
	if r.FormValue("menu") != "" && r.FormValue("menu") == "on" {
		m = true
	}
	err := data.UpdateImage(&model.Image{
		ID:         r.FormValue("id"),
		Suffix:     r.FormValue("suffix"),
		Visibility: r.FormValue("visibility"),
		Twitname:   strings.ToLower(r.FormValue("twitname")),
		Menu:       m,
	})
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
			"ID":  r.FormValue("id"),
		}).Error("Failed saving image")
		http.Error(w, http.StatusText(http.StatusInternalServerError), http.StatusInternalServerError)
		return
	}
	http.Redirect(w, r, "/admin/truck/edit?twitname="+r.FormValue("twitname"), http.StatusSeeOther)
}

func queue(w http.ResponseWriter, r *http.Request) {
	s := sessions.GetSite(r)
	site, _ := data.GetSite(s)
	basePage := getBasePageFromCtx(r)
	basePage.Site = site

	t, err := data.GetSiteTweets(site.Name, 20)
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed getting site tweets")
		http.Error(w, http.StatusText(http.StatusInternalServerError), http.StatusInternalServerError)
		return
	}
	l, err := data.GetLocations()
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed getting locations")
		http.Error(w, http.StatusText(http.StatusInternalServerError), http.StatusInternalServerError)
		return
	}
	subs, err := data.GetSubs()
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed getting subs")
		http.Error(w, http.StatusText(http.StatusInternalServerError), http.StatusInternalServerError)
		return
	}

	p := &view.Queue{
		BasePage:  basePage,
		Tweets:    t,
		Locations: l[site.Name],
		Subs:      subs,
	}

	view.WritePageTemplate(w, p)
}

func queueDone(w http.ResponseWriter, r *http.Request) {
	err := data.MarkTweetDone(r.FormValue("id"))
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed marking tweet done")
	}
	http.Redirect(w, r, "/admin/queue", http.StatusSeeOther)
}
