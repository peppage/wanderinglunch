package admin

import (
	"net/http"

	"wanderinglunch/server"
	"wanderinglunch/view"

	log "github.com/Sirupsen/logrus"
	"github.com/labstack/echo"
)

func (s *Server) Index(c echo.Context) error {
	siteSession := s.Sessions.GetSite(c.Request())
	site, _ := s.Data.GetSite(siteSession)
	basePage := c.Get(s.BasePageKey).(view.BasePage)
	basePage.Site = site

	trucks, err := s.Data.GetFailedUpdates(site.Name)
	if err != nil {
		log.WithError(err).Error("Failed getting admin trucks")
		return echo.NewHTTPError(http.StatusInternalServerError)
	}

	p := &view.Admin{
		BasePage: basePage,
		Trucks:   trucks,
	}

	return server.Render(c, p)
}
