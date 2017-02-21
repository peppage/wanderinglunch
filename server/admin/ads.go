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

func (s *Server) AdNew(c echo.Context) error {
	sessionSite := s.Sessions.GetSite(c.Request())
	site, _ := s.Data.GetSite(sessionSite)
	basePage := c.Get(s.BasePageKey).(view.BasePage)
	basePage.Site = site

	p := &view.Ad{
		BasePage: basePage,
		Sites:    basePage.Sites,
		Ad:       &model.Ad{},
	}
	return server.Render(c, p)
}

func (s *Server) AdSave(c echo.Context) error {
	i, err := strconv.ParseInt(c.FormValue("validuntil"), 10, 64)
	if err != nil {
		log.WithError(err).Error("Failed converting validuntil, saving ad")
		return echo.NewHTTPError(http.StatusBadRequest)
	}
	err = s.Data.AddAd(&model.Ad{
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
		return echo.NewHTTPError(http.StatusInternalServerError)
	}
	return c.Redirect(http.StatusSeeOther, "/admin")
}
func (s *Server) Ads(c echo.Context) error {
	sessionSite := s.Sessions.GetSite(c.Request())
	site, _ := s.Data.GetSite(sessionSite)
	basePage := c.Get(s.BasePageKey).(view.BasePage)
	basePage.Site = site

	ads, _ := s.Data.GetAds()
	p := &view.Ads{
		BasePage: basePage,
		Ads:      ads,
	}
	return server.Render(c, p)
}

func (s *Server) AdEdit(c echo.Context) error {
	sessionSite := s.Sessions.GetSite(c.Request())
	site, _ := s.Data.GetSite(sessionSite)
	basePage := c.Get(s.BasePageKey).(view.BasePage)
	basePage.Site = site

	id, err := strconv.ParseInt(c.FormValue("id"), 10, 0)
	if err != nil {
		return echo.NewHTTPError(http.StatusBadRequest)
	}
	ad, _ := s.Data.GetAd(int(id))

	p := &view.Ad{
		BasePage: basePage,
		Sites:    basePage.Sites,
		Ad:       ad,
	}
	return server.Render(c, p)
}

func (s *Server) AdUpdate(c echo.Context) error {
	i, err := strconv.Atoi(c.FormValue("id"))
	if err != nil {
		log.WithError(err).Error("Failed converting id, updating ad")
		return echo.NewHTTPError(http.StatusBadRequest)
	}
	i2, err := strconv.ParseInt(c.FormValue("validuntil"), 10, 64)
	if err != nil {
		log.WithError(err).Error("Failed converting validuntil, saving ad")
		return echo.NewHTTPError(http.StatusBadRequest)
	}

	err = s.Data.UpdateAd(&model.Ad{
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
		return echo.NewHTTPError(http.StatusInternalServerError)
	}
	return c.Redirect(http.StatusSeeOther, "/admin")
}
