package public

import (
	"net/http"

	"wanderinglunch/model"
	"wanderinglunch/server"
	"wanderinglunch/view"

	log "github.com/Sirupsen/logrus"
	"github.com/labstack/echo"
)

func (s *Server) AmpIndex(c echo.Context) error {
	var site *model.Site
	var err error
	if site, err = server.GetSite(c, s.Data); err != nil {
		return err
	}

	trucks, err := s.Data.Trucks(site.Name, 8, "lat", "desc", 0)
	if err != nil {
		log.WithFields(log.Fields{
			"err":  err,
			"site": site.Name,
		}).Error("Failed getting trucks")
		return echo.NewHTTPError(http.StatusInternalServerError)
	}

	zones, err := s.Data.GetZones(site.Name)
	if err != nil {
		log.WithFields(log.Fields{
			"err":  err,
			"site": site.Name,
		}).Error("Failed getting zones")
		return echo.NewHTTPError(http.StatusInternalServerError)
	}

	bp := view.AmpBasePage{
		Site:        site,
		OriginalURL: "/" + site.Name,
		Ad:          server.GetAd(site.Name, s.Data),
	}
	p := &view.AmpIndex{
		AmpBasePage: bp,
		Trucks:      trucks,
		Zones:       zones,
	}
	return server.RenderAmp(c, p)
}

func (s *Server) AmpTruck(c echo.Context) error {
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

	bp := view.AmpBasePage{
		Site:        site,
		OriginalURL: "/truck/" + name,
		Ad:          server.GetAd(site.Name, s.Data),
	}
	p := &view.AmpTruck{
		AmpBasePage: bp,
		Trucks:      t,
	}
	return server.RenderAmp(c, p)
}
