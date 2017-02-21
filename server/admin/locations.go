package admin

import (
	"net/http"
	"strconv"

	"wanderinglunch/model"
	"wanderinglunch/server"
	"wanderinglunch/view"

	log "github.com/Sirupsen/logrus"
	"github.com/labstack/echo"
)

func (s *Server) LocNew(c echo.Context) error {
	sessionSite := s.Sessions.GetSite(c.Request())
	site, _ := s.Data.GetSite(sessionSite)
	basePage := c.Get(s.BasePageKey).(view.BasePage)
	basePage.Site = site

	zones, err := s.Data.GetZones(site.Name)
	if err != nil {
		log.WithError(err).Error("Failed gettings zones")
	}

	p := &view.Location{
		BasePage: basePage,
		Sites:    basePage.Sites,
		Zones:    zones,
		Location: &model.Location{},
	}
	return server.Render(c, p)
}

func (s *Server) LocSave(c echo.Context) error {
	lat, err1 := strconv.ParseFloat(c.FormValue("lat"), 32)
	long, err2 := strconv.ParseFloat(c.FormValue("long"), 32)
	if err1 != nil || err2 != nil {
		log.WithFields(log.Fields{
			"err1": err1,
			"err2": err2,
		}).Error("Failed converting lat or long, saving loc")
		return echo.NewHTTPError(http.StatusBadRequest)
	}
	err := s.Data.AddLocation(&model.Location{
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
		return echo.NewHTTPError(http.StatusInternalServerError)
	}
	return c.Redirect(http.StatusSeeOther, "/admin/location/add")
}

func (s *Server) Locations(c echo.Context) error {
	sessionSite := s.Sessions.GetSite(c.Request())
	site, _ := s.Data.GetSite(sessionSite)
	basePage := c.Get(s.BasePageKey).(view.BasePage)
	basePage.Site = site

	locations, _ := s.Data.GetLocations()
	p := &view.Locations{
		BasePage:  basePage,
		Locations: locations[site.Name],
	}

	return server.Render(c, p)
}

func (s *Server) LocEdit(c echo.Context) error {
	sessionSite := s.Sessions.GetSite(c.Request())
	site, _ := s.Data.GetSite(sessionSite)
	basePage := c.Get(s.BasePageKey).(view.BasePage)
	basePage.Site = site

	zones, err := s.Data.GetZones(site.Name)
	if err != nil {
		log.WithError(err).Error("Failed gettings zones")
	}

	id, err := strconv.Atoi(c.FormValue("id"))
	if err != nil {
		log.WithError(err).Error("Failed converting id, editing loc")
		return echo.NewHTTPError(http.StatusBadRequest)
	}

	loc, _ := s.Data.GetLocation(id)

	p := &view.Location{
		BasePage: basePage,
		Sites:    basePage.Sites,
		Zones:    zones,
		Location: loc,
	}

	return server.Render(c, p)
}

func (s *Server) LocUpdate(c echo.Context) error {
	i, err := strconv.Atoi(c.FormValue("id"))
	if err != nil {
		log.WithError(err).Error("Failed converting id, updating loc")
		return echo.NewHTTPError(http.StatusBadRequest)
	}

	lat, err1 := strconv.ParseFloat(c.FormValue("lat"), 32)
	long, err2 := strconv.ParseFloat(c.FormValue("long"), 32)
	if err1 != nil || err2 != nil {
		log.WithFields(log.Fields{
			"err1": err1,
			"err2": err2,
		}).Error("Failed converting lat or long, saving loc")
		return echo.NewHTTPError(http.StatusBadRequest)
	}

	err = s.Data.UpdateLocation(&model.Location{
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
		return echo.NewHTTPError(http.StatusInternalServerError)
	}
	return c.Redirect(http.StatusSeeOther, "/admin")
}
