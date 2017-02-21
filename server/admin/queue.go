package admin

import (
	"net/http"

	"wanderinglunch/server"
	"wanderinglunch/view"

	log "github.com/Sirupsen/logrus"
	"github.com/labstack/echo"
)

func (s *Server) Queue(c echo.Context) error {
	sessionSite := s.Sessions.GetSite(c.Request())
	site, _ := s.Data.GetSite(sessionSite)
	basePage := c.Get(s.BasePageKey).(view.BasePage)
	basePage.Site = site

	t, err := s.Data.GetSiteTweets(site.Name, 20)
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed getting site tweets")
		return echo.NewHTTPError(http.StatusInternalServerError)
	}
	l, err := s.Data.GetLocations()
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed getting locations")
		return echo.NewHTTPError(http.StatusInternalServerError)
	}
	subs, err := s.Data.GetSubs()
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed getting subs")
		return echo.NewHTTPError(http.StatusInternalServerError)
	}

	p := &view.Queue{
		BasePage:  basePage,
		Tweets:    t,
		Locations: l[site.Name],
		Subs:      subs,
	}

	return server.Render(c, p)
}

func (s *Server) QueueDone(c echo.Context) error {
	err := s.Data.MarkTweetDone(c.FormValue("id"))
	if err != nil {
		log.WithFields(log.Fields{
			"err": err,
		}).Error("Failed marking tweet done")
	}
	return c.Redirect(http.StatusSeeOther, "/admin/queue")
}
