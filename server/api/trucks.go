package api

import (
	"net/http"

	log "github.com/Sirupsen/logrus"
	"github.com/labstack/echo"
)

// Trucks returns json of the recently updated trucks
func (s *Server) Trucks(c echo.Context) error {
	siteName := c.Param("site")
	if siteName == "" {
		return c.Redirect(http.StatusMovedPermanently, "/nyc/api/trucks")
	}

	trucks, err := s.Data.Trucks(siteName, 8, "lat", "desc", 0)
	if err != nil {
		log.WithError(err).Error("Failed getting all trucks api")
		return echo.NewHTTPError(http.StatusInternalServerError)
	}

	return c.JSON(http.StatusOK, trucks)
}
