package public

import (
	"time"
	"wanderinglunch/model"
	"wanderinglunch/server"
	"wanderinglunch/view"

	"net/http"

	log "github.com/Sirupsen/logrus"
	"github.com/labstack/echo"
)

// Index servers the main page of the site
func (s *Server) Index(c echo.Context) error {
	basePage := c.Get(s.BasePageKey).(view.BasePage)
	var site *model.Site
	var err error
	if site, err = server.GetSite(c, s.Data); err != nil {
		return echo.NewHTTPError(http.StatusInternalServerError)
	}
	basePage.Site = site
	basePage.Ad = server.GetAd(site.Name, s.Data)
	basePage.StartTime = c.Get(s.TimeKey).(*time.Time)
	basePage.AmpURL = "/" + site.Name + "/amp"

	siteName := basePage.Site.Name

	trucks, err := s.Data.Trucks(siteName, 8, "lat", "desc", 0)
	if err != nil {
		log.WithFields(log.Fields{
			"err":  err,
			"site": siteName,
		}).Error("Failed getting trucks")
		return echo.NewHTTPError(http.StatusInternalServerError)
	}

	zones, err := s.Data.GetZones(siteName)
	if err != nil {
		log.WithFields(log.Fields{
			"err":  err,
			"site": siteName,
		}).Error("Failed getting zones")
		return echo.NewHTTPError(http.StatusInternalServerError)
	}

	lu, err := s.Data.LastUpdate(siteName)
	if err != nil {
		log.WithError(err).Error("Unable to retrieve last update")
	}
	p := &view.Root{
		BasePage:   basePage,
		Trucks:     trucks,
		Zones:      zones,
		LastUpdate: lu,
	}

	h := c.Response().Header()
	h.Add("Link", "</static/site.css?v="+s.Version+">; rel=preload; as=stylesheet")
	h.Add("Link", "</static/site.js?v="+s.Version+">; rel=preload; as=script")
	h.Add("Link", "</static/images/wl.png>; rel=preload; as=image")

	return server.Render(c, p)
}
