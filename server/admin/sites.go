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

func (s *Server) SiteNew(c echo.Context) error {
	sessionSite := s.Sessions.GetSite(c.Request())
	site, _ := s.Data.GetSite(sessionSite)
	basePage := c.Get(s.BasePageKey).(view.BasePage)
	basePage.Site = site

	p := &view.Site{
		BasePage: basePage,
		Site:     &model.Site{},
	}

	return server.Render(c, p)
}

func (s *Server) SiteSave(c echo.Context) error {
	lat, err1 := strconv.ParseFloat(c.FormValue("lat"), 32)
	long, err2 := strconv.ParseFloat(c.FormValue("long"), 32)
	if err1 != nil || err2 != nil {
		log.WithFields(log.Fields{
			"err1": err1,
			"err2": err2,
		}).Error("Failed converting lat or long, saving site")
		return echo.NewHTTPError(http.StatusBadRequest)
	}
	err := s.Data.AddSite(&model.Site{
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
		return echo.NewHTTPError(http.StatusInternalServerError)
	}
	return c.Redirect(http.StatusSeeOther, "/admin")
}

func (s *Server) Sites(c echo.Context) error {
	sessionSite := s.Sessions.GetSite(c.Request())
	site, _ := s.Data.GetSite(sessionSite)
	basePage := c.Get(s.BasePageKey).(view.BasePage)
	basePage.Site = site

	p := &view.Sites{
		BasePage: basePage,
		Sites:    basePage.Sites,
	}

	return server.Render(c, p)
}

func (s *Server) SiteEdit(c echo.Context) error {
	sessionSite := s.Sessions.GetSite(c.Request())
	site, _ := s.Data.GetSite(sessionSite)
	basePage := c.Get(s.BasePageKey).(view.BasePage)
	basePage.Site = site

	thisSite, _ := s.Data.GetSite(c.FormValue("name"))

	p := &view.Site{
		BasePage: basePage,
		Site:     thisSite,
	}

	return server.Render(c, p)
}

func (s *Server) SiteUpdate(c echo.Context) error {
	lat, err1 := strconv.ParseFloat(c.FormValue("lat"), 32)
	long, err2 := strconv.ParseFloat(c.FormValue("long"), 32)
	if err1 != nil || err2 != nil {
		log.WithFields(log.Fields{
			"err1": err1,
			"err2": err2,
		}).Error("Failed converting lat or long, updating site")
		return echo.NewHTTPError(http.StatusBadRequest)
	}
	err := s.Data.UpdateSite(&model.Site{
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
		return echo.NewHTTPError(http.StatusInternalServerError)
	}
	return c.Redirect(http.StatusSeeOther, "/admin")
}
