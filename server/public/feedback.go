package public

import (
	"net/http"

	"wanderinglunch/model"
	"wanderinglunch/server"
	"wanderinglunch/view"

	"github.com/labstack/echo"
)

// Feedback renders the feedback page
func (s *Server) Feedback(c echo.Context) error {
	basePage := c.Get(s.BasePageKey).(view.BasePage)
	var site *model.Site
	var err error
	if site, err = server.GetSite(c, s.Data); err != nil {
		return echo.NewHTTPError(http.StatusInternalServerError)
	}

	basePage.Site = site
	basePage.Ad = server.GetAd(site.Name, s.Data)

	p := &view.Feedback{
		BasePage: basePage,
	}
	return server.Render(c, p)
}
