package main

import (
	"fmt"
	"net/http"
	"net/url"
	"os"
	"time"

	"wanderinglunch/model"
	"wanderinglunch/tmpl/admin"

	"github.com/labstack/echo"
	"github.com/peppage/foursquarego"
)

var clientID = os.Getenv("CLIENT_ID")
var clientSecret = os.Getenv("CLIENT_SECRET")

func adminRoot(c *echo.Context) error {
	t1 := time.Now().Add(-24 * (time.Minute * 60)).Unix()
	now := time.Now()
	t2 := time.Date(now.Year(), now.Month(), now.Day(), 0, 0, 0, 0, now.Location()).Unix()

	var trucks []*model.Truck
	err := db.Select(&trucks, `SELECT twitname, id FROM trucks WHERE lastupdate < $1 AND lastupdate > $2`, t1, t2)
	if err != nil {
		fmt.Println(err)
	}

	return c.HTML(http.StatusOK, admin.Index())
}

func adminFix(c *echo.Context) error {
	t := model.GetTruck(c.Param("id"))
	if t.ID == "" {
		return echo.NewHTTPError(http.StatusNotFound)
	}
	return c.HTML(http.StatusOK, admin.Fix(t))
}

func adminNewLoc(c *echo.Context) error {
	return c.HTML(http.StatusOK, admin.Newloc(model.Sites(), c.Param("tweetId")))
}

func adminLocs(c *echo.Context) error {
	return c.HTML(http.StatusOK, admin.Locations())
}

func adminEditLoc(c *echo.Context) error {
	return c.HTML(http.StatusOK, admin.Editloc(c.Param("id")))
}

func adminTrucks(c *echo.Context) error {
	return c.HTML(http.StatusOK, admin.Trucks())
}

func adminEditTruck(c *echo.Context) error {
	return c.HTML(http.StatusOK, admin.Edittruck(c.Param("id")))
}

func adminNewTruck(c *echo.Context) error {
	return c.HTML(http.StatusOK, admin.Newtruck(model.Sites()))
}

func adminMessage(c *echo.Context) error {
	return c.HTML(http.StatusOK, admin.Message())
}

func adminSubs(c *echo.Context) error {
	return c.HTML(http.StatusOK, admin.Subs())
}

func adminSub(c *echo.Context) error {
	return c.HTML(http.StatusOK, admin.Sub(c.Param("id")))
}

func adminNewSub(c *echo.Context) error {
	return c.HTML(http.StatusOK, admin.Newsub())
}

func adminImages(c *echo.Context) error {
	return c.HTML(http.StatusOK, admin.Images())
}

func adminImage(c *echo.Context) error {
	return c.HTML(http.StatusOK, admin.Image(c.Param("id")))
}

func adminFoursquareImages(c *echo.Context) error {
	api := foursquarego.NewFoursquareApi(clientID, clientSecret)
	uv := url.Values{}
	uv.Set("limit", "200")
	p, err := api.GetVenuePhotos(c.Param("id"), uv)
	if err != nil {
		fmt.Println(err)
	}
	return c.JSON(http.StatusOK, p)
}
