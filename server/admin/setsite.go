package admin

import (
	"net/http"

	"github.com/labstack/echo"
)

func (s *Server) SetSite(c echo.Context) error {
	s.Sessions.SetSite(c.Response(), c.Request(), c.FormValue("site"))
	return c.String(http.StatusOK, "ok")
}
