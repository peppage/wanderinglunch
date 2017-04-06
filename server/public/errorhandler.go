package public

import (
	"net/http"

	"wanderinglunch/model"
	"wanderinglunch/server"
	"wanderinglunch/view"

	log "github.com/Sirupsen/logrus"
	"github.com/labstack/echo"
)

// HTTPErrorHandler gives the correct page for the error
func (s *Server) HTTPErrorHandler(err error, c echo.Context) {
	code := http.StatusInternalServerError
	//msg := http.StatusText(code)
	if he, ok := err.(*echo.HTTPError); ok {
		code = he.Code
		//msg = he.Message
	}
	if !c.Response().Committed {
		if c.Request().Method == echo.HEAD { // Issue #608
			c.NoContent(code)
		} else {
			log.WithField("code", code).Debug("Error handling")
			switch {
			case code == http.StatusNotFound:
				sites, _ := s.Data.GetSites()
				bp := view.BasePage{
					Version: s.Version,
					Build:   s.Build,
					Ad:      &model.Ad{},
					Site:    &model.Site{},
					Develop: s.Debug,
				}
				p := &view.Error404{
					BasePage: bp,
					Sites:    sites,
				}
				server.Render(c, p)
			default:
				log.WithFields(log.Fields{
					"Error": err,
					"Path":  c.Request().URL.Path,
				}).Error("Unhandled web error")
				c.String(code, "Unhandled Error")
			}
		}
	}
}
