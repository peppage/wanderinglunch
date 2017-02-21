package public

import (
	"net/http"
	"time"

	"wanderinglunch/server"
	"wanderinglunch/view"

	log "github.com/Sirupsen/logrus"
	"github.com/labstack/echo"
)

// Truck shows a single truck page
func (s *Server) Truck(c echo.Context) error {
	basePage := c.Get(s.BasePageKey).(view.BasePage)
	name := c.Param("name")
	if name == "" {
		return echo.NewHTTPError(http.StatusNotFound)
	}

	t, err := s.Data.GetTruck(name)
	if err != nil || len(t) <= 0 {
		return echo.NewHTTPError(http.StatusNotFound)
	}

	site, err := s.Data.GetSite(t[0].Site)
	if err != nil {
		log.WithFields(log.Fields{
			"truck": t,
			"err":   err,
		}).Error("Failed getting that site")
		return echo.NewHTTPError(http.StatusNotFound)
	}

	basePage.Site = site
	basePage.Ad = server.GetAd(site.Name, s.Data)
	basePage.StartTime = c.Get(s.TimeKey).(*time.Time)
	basePage.AmpURL = "/truck/" + t[0].Twitname + "/amp"

	p := &view.Truck{
		BasePage: basePage,
		Trucks:   t,
	}
	return server.Render(c, p)
}
