package admin

import (
	"wanderinglunch/model"
	"wanderinglunch/server"
	"wanderinglunch/updator"
	"wanderinglunch/view"

	"github.com/labstack/echo"
)

func (s *Server) Debug(c echo.Context) error {
	basePage := c.Get(s.BasePageKey).(view.BasePage)
	basePage.Site = &model.Site{}

	n := c.FormValue("twitname")
	if n != "" {
		texts, _ := updator.GetReplacedStrings(n)
		p := &view.DebugShow{
			BasePage: basePage,
			Twitname: n,
			Texts:    texts,
		}
		return server.Render(c, p)
	}
	p := &view.Debug{
		BasePage: basePage,
	}
	return server.Render(c, p)
}
