package main

import (
	"net/http"
	mdl "wanderinglunch/model"
	"wanderinglunch/view/admin"

	log "github.com/Sirupsen/logrus"
	"github.com/labstack/echo"
)

func adminRoot(c echo.Context) error {
	trucks, err := mdl.GetFailedUpdates("nyc")
	if err != nil {
		log.WithError(err).Error("Failed getting admin trucks")
	}

	return c.HTML(http.StatusOK, admin.Index(trucks))
}
