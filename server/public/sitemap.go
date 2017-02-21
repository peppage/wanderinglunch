package public

import (
	"net/http"

	"github.com/labstack/echo"
)

// Sitemap builds the txt file of all pages on site
func (s *Server) Sitemap(c echo.Context) error {
	siteMap := ""

	sites, _ := s.Data.GetSites()
	for _, site := range sites {
		siteMap += "http://wanderinglunch.com/" + site.Name + "\n"
		siteMap += "http://wanderinglunch.com/" + site.Name + "/map\n"
		siteMap += "http://wanderinglunch.com/" + site.Name + "/feedback\n"

		trucks, _ := s.Data.AllTrucks(site.Name)
		for _, t := range trucks {
			siteMap += "http://wanderinglunch.com/truck/" + t.Twitname + "\n"
		}
	}

	return c.String(http.StatusOK, siteMap)
}
