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

func (s *Server) ImgAdd(c echo.Context) error {
	err := s.Data.AddImage(&model.Image{
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
		return echo.NewHTTPError(http.StatusInternalServerError)
	}
	return c.String(http.StatusOK, "ok")
}

func (s *Server) ImgEdit(c echo.Context) error {
	sessionSite := s.Sessions.GetSite(c.Request())
	site, _ := s.Data.GetSite(sessionSite)
	basePage := c.Get(s.BasePageKey).(view.BasePage)
	basePage.Site = site

	img, _ := s.Data.GetImage(c.FormValue("id"))

	p := &view.Image{
		BasePage: basePage,
		Image:    img,
	}

	return server.Render(c, p)
}

func (s *Server) ImgUpdate(c echo.Context) error {
	m := false
	if c.FormValue("menu") != "" && c.FormValue("menu") == "on" {
		m = true
	}
	err := s.Data.UpdateImage(&model.Image{
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
		return echo.NewHTTPError(http.StatusInternalServerError)
	}
	return c.Redirect(http.StatusSeeOther, "/admin/truck/edit?twitname="+c.FormValue("twitname"))
}
