package server

import (
	"errors"
	"net/http"

	"wanderinglunch/model"
	"wanderinglunch/store"
	"wanderinglunch/view"

	log "github.com/Sirupsen/logrus"
	"github.com/labstack/echo"
)

// Render renders a page to the current context
func Render(c echo.Context, p view.Page) error {
	c.Response().Header().Set(echo.HeaderContentType, echo.MIMETextHTMLCharsetUTF8)
	view.WritePageTemplate(c.Response(), p)
	return nil
}

func GetSite(c echo.Context, data store.Store) (*model.Site, error) {
	siteName := c.Param("site")
	if siteName == "" {
		c.Redirect(http.StatusMovedPermanently, "/nyc")
		return nil, errors.New("Site moved!")
	}

	site, err := data.GetSite(siteName)
	if err != nil {
		return nil, echo.NewHTTPError(http.StatusNotFound)
	}

	return site, nil
}

func RenderAmp(c echo.Context, p view.AmpPage) error {
	c.Response().Header().Set(echo.HeaderContentType, echo.MIMETextHTMLCharsetUTF8)
	view.WriteAmpPageTemplate(c.Response(), p)
	return nil
}

func GetAd(site string, data store.Store) *model.Ad {
	ad, err := data.GetAdForSite(site)
	if err != nil {
		log.WithError(err).Error("Failed to get ad")
		return &model.Ad{}
	}
	return ad
}
