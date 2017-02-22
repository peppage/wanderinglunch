package api

import (
	"time"

	"wanderinglunch/model"
	"wanderinglunch/server"
	"wanderinglunch/view"

	"github.com/labstack/echo"
)

func (s *Server) Index(c echo.Context) error {
	basePage := c.Get(s.BasePageKey).(view.BasePage)
	var site *model.Site
	var err error
	if site, err = server.GetSite(c, s.Data); err != nil {
		return err
	}
	basePage.Site = site
	basePage.Ad = server.GetAd(site.Name, s.Data)
	basePage.StartTime = c.Get(s.TimeKey).(*time.Time)

	p := &view.ApiIndex{
		BasePage: basePage,
	}

	return server.Render(c, p)
}
