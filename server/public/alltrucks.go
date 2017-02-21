package public

import (
	"net/http"
	"time"

	"wanderinglunch/model"
	"wanderinglunch/server"
	"wanderinglunch/view"

	log "github.com/Sirupsen/logrus"
	"github.com/labstack/echo"
)

// AllTrucks shows all the trucks that were updated recently
func (s *Server) AllTrucks(c echo.Context) error {
	basePage := c.Get(s.BasePageKey).(view.BasePage)
	var site *model.Site
	var err error
	if site, err = server.GetSite(c, s.Data); err != nil {
		return echo.NewHTTPError(http.StatusInternalServerError)
	}
	basePage.Site = site
	basePage.Ad = server.GetAd(site.Name, s.Data)
	basePage.StartTime = c.Get(s.TimeKey).(*time.Time)

	trucks, err := s.Data.Trucks(site.Name, 500000, "name", "asc", 0)
	if err != nil {
		log.WithFields(log.Fields{
			"err":  err,
			"site": site,
		}).Error("Failed getting trucks")
		return echo.NewHTTPError(http.StatusInternalServerError)
	}

	p := &view.AllTrucks{
		BasePage: basePage,
		Trucks:   trucks,
	}

	return server.Render(c, p)
}
