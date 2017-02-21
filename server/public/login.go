package public

import (
	"net/http"
	"wanderinglunch/model"
	"wanderinglunch/server"
	"wanderinglunch/view"

	log "github.com/Sirupsen/logrus"
	"github.com/labstack/echo"
)

// Login shows the login page
func (s *Server) Login(c echo.Context) error {
	bp := view.BasePage{
		Version: s.Version,
		Build:   s.Build,
		Ad:      &model.Ad{},
		Site:    &model.Site{},
	}
	p := &view.Login{
		BasePage: bp,
	}
	return server.Render(c, p)
}

// LoginHandle takes a login post request and if authed sends them to admin
func (s *Server) LoginHandle(c echo.Context) error {
	u, err := s.Data.GetUser(c.FormValue("email"))
	if err != nil {
		log.WithError(err).Error("failed getting user")
		return echo.NewHTTPError(http.StatusUnauthorized)
	}

	if !u.ValidatePassword(c.FormValue("password")) {
		log.Error("Invalid password")
		return echo.NewHTTPError(http.StatusUnauthorized)
	}

	log.WithField("user", u).Debug("Login handle user")
	s.Sessions.SetUser(c.Response(), c.Request(), u)
	s.Sessions.SetSite(c.Response(), c.Request(), "nyc")
	return c.Redirect(http.StatusSeeOther, "/admin")
}
