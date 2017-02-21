package public

import (
	"encoding/json"
	"net/http"
	"time"

	"wanderinglunch/model"
	"wanderinglunch/server"
	"wanderinglunch/view"

	"github.com/labstack/echo"
)

// Maps renders the map page
func (s *Server) Maps(c echo.Context) error {
	basePage := c.Get(s.BasePageKey).(view.BasePage)
	var site *model.Site
	var err error
	if site, err = server.GetSite(c, s.Data); err != nil {
		return echo.NewHTTPError(http.StatusInternalServerError)
	}
	basePage.Site = site
	basePage.Ad = server.GetAd(site.Name, s.Data)
	basePage.StartTime = c.Get(s.TimeKey).(*time.Time)

	m := s.Data.Markers(site.Name, 8)
	mj, _ := json.Marshal(m)

	p := &view.Map{
		BasePage: basePage,
		Markers:  mj,
	}
	return server.Render(c, p)
}
