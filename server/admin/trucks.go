package admin

import (
	"net/http"
	"strings"

	"wanderinglunch/model"
	"wanderinglunch/server"
	"wanderinglunch/view"

	log "github.com/Sirupsen/logrus"
	"github.com/labstack/echo"
)

func (s *Server) TruckNew(c echo.Context) error {
	sessionSite := s.Sessions.GetSite(c.Request())
	site, _ := s.Data.GetSite(sessionSite)
	basePage := c.Get(s.BasePageKey).(view.BasePage)
	basePage.Site = site

	p := &view.AdminTruck{
		BasePage: basePage,
		Sites:    basePage.Sites,
		Truck:    &model.Truck{},
	}
	return server.Render(c, p)
}

func (s *Server) TruckSave(c echo.Context) error {
	err := s.Data.AddTruck(&model.Truck{
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
		return echo.NewHTTPError(http.StatusInternalServerError)
	}
	return c.Redirect(http.StatusSeeOther, "/admin/truck/add")
}

func (s *Server) Trucks(c echo.Context) error {
	sessionSite := s.Sessions.GetSite(c.Request())
	site, _ := s.Data.GetSite(sessionSite)
	basePage := c.Get(s.BasePageKey).(view.BasePage)
	basePage.Site = site

	trucks, _ := s.Data.AllTrucks(site.Name)

	p := &view.Trucks{
		BasePage: basePage,
		Trucks:   trucks,
	}

	return server.Render(c, p)
}

func (s *Server) TruckEdit(c echo.Context) error {
	sessionSite := s.Sessions.GetSite(c.Request())
	site, _ := s.Data.GetSite(sessionSite)
	basePage := c.Get(s.BasePageKey).(view.BasePage)
	basePage.Site = site

	t, err := s.Data.GetTruck(c.FormValue("twitname"))
	if err != nil {
		log.WithFields(log.Fields{
			"err":      err,
			"twitname": c.FormValue("twitname"),
		}).Error("faield to get truck")
		return echo.NewHTTPError(http.StatusInternalServerError)
	}

	p := &view.AdminTruck{
		BasePage: basePage,
		Sites:    basePage.Sites,
		Truck:    t[0],
	}

	return server.Render(c, p)
}

func (s *Server) TruckUpdate(c echo.Context) error {
	a := false
	if c.FormValue("archive") != "" && c.FormValue("archive") == "on" {
		a = true
	}
	err := s.Data.UpdateTruck(&model.Truck{
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
		return echo.NewHTTPError(http.StatusInternalServerError)
	}
	return c.Redirect(http.StatusSeeOther, "/admin")
}
