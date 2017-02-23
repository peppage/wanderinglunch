package admin

import (
	"net/http"
	"net/url"

	log "github.com/Sirupsen/logrus"
	"github.com/labstack/echo"
	"github.com/peppage/foursquarego"
)

// Foursquare sends JSON of all foursquare photos for a venue
func (s *Server) Foursquare(c echo.Context) error {
	api := foursquarego.NewFoursquareApi(s.FoursquareClientID, s.FoursquareClientSecret)
	uv := url.Values{}
	uv.Set("limit", "200")
	p, err := api.GetVenuePhotos(c.FormValue("id"), uv)
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
			"id":  c.FormValue("id"),
		}).Error("Failed getting foursquare images admin")
		return echo.NewHTTPError(http.StatusInternalServerError)
	}
	return c.JSON(http.StatusOK, p)
}
