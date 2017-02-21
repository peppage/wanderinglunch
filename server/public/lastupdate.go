package public

import (
	"net/http"

	log "github.com/Sirupsen/logrus"
	"github.com/labstack/echo"
)

// LastUpdate returns the last time this site got new twitter data
func (s *Server) LastUpdate(c echo.Context) error {
	siteName := c.Param("site")
	if siteName == "" {
		return echo.NewHTTPError(http.StatusBadRequest)
	}

	lu, err := s.Data.LastUpdate(siteName)
	if err != nil {
		log.WithError(err).Error("Unable to retrieve last update")
		return echo.NewHTTPError(http.StatusInternalServerError)
	}

	return c.JSON(http.StatusOK, lu)
}
