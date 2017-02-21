package public

import (
	"net/http"

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
			switch {
			case code == http.StatusNotFound:
				p := &view.Error404{
					BasePage: c.Get(s.BasePageKey).(view.BasePage),
				}
				server.Render(c, p)
			default:
				log.WithError(err).Error("Unhandled web error")
				c.String(code, "Unhandled Error")
			}
		}
	}
}
