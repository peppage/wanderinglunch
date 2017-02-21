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

func (s *Server) SubNew(c echo.Context) error {
	sessionSite := s.Sessions.GetSite(c.Request())
	site, _ := s.Data.GetSite(sessionSite)
	basePage := c.Get(s.BasePageKey).(view.BasePage)
	basePage.Site = site

	p := &view.Sub{
		BasePage: basePage,
		Sub:      &model.Sub{},
	}

	return server.Render(c, p)
}

func (s *Server) SubSave(c echo.Context) error {
	err := s.Data.AddSub(&model.Sub{
		Regex:       c.FormValue("regex"),
		Replacement: c.FormValue("replacement"),
	})
	if err != nil {
		log.WithFields(log.Fields{
			"regex": c.FormValue("regex"),
			"err":   err,
		}).Error("Failed adding sub")
		return echo.NewHTTPError(http.StatusInternalServerError)
	}
	return c.Redirect(http.StatusSeeOther, "/admin")
}

func (s *Server) Subs(c echo.Context) error {
	sessionSite := s.Sessions.GetSite(c.Request())
	site, _ := s.Data.GetSite(sessionSite)
	basePage := c.Get(s.BasePageKey).(view.BasePage)
	basePage.Site = site

	subs, _ := s.Data.GetSubs()

	p := &view.Subs{
		BasePage: basePage,
		Subs:     subs,
	}

	return server.Render(c, p)
}

func (s *Server) SubEdit(c echo.Context) error {
	sessionSite := s.Sessions.GetSite(c.Request())
	site, _ := s.Data.GetSite(sessionSite)
	basePage := c.Get(s.BasePageKey).(view.BasePage)
	basePage.Site = site

	id, err := strconv.Atoi(c.FormValue("id"))
	if err != nil {
		log.WithError(err).Error("Failed getting that sub")
		return echo.NewHTTPError(http.StatusBadRequest)
	}

	sub, _ := s.Data.GetSub(id)

	p := &view.Sub{
		BasePage: basePage,
		Sub:      sub,
	}

	return server.Render(c, p)
}

func (s *Server) SubUpdate(c echo.Context) error {
	i, err := strconv.Atoi(c.FormValue("id"))
	if err != nil {
		log.WithError(err).Error("Failed converting id, updating sub")
		return echo.NewHTTPError(http.StatusBadRequest)
	}
	err = s.Data.UpdateSub(&model.Sub{
		ID:          i,
		Regex:       c.FormValue("regex"),
		Replacement: c.FormValue("replacement"),
	})
	if err != nil {
		log.WithFields(log.Fields{
			"err":   err,
			"Regex": c.FormValue("regex"),
		}).Error("Failed updating sub")
		return echo.NewHTTPError(http.StatusInternalServerError)
	}
	return c.Redirect(http.StatusSeeOther, "/admin")
}
