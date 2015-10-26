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
	"github.com/zenazn/goji/web"
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

func adminMessage(c web.C, w http.ResponseWriter, r *http.Request) {
	data := make(map[string]interface{})
	data["title"] = TITLE + "Admin - Message"
	data["admin"] = true
	data["css"] = statics.SiteCss
	data["js"] = statics.SiteJs
	data["adminjs"] = statics.AdminJs

	renderer.HTML(w, http.StatusOK, "admin/message", data)
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

func adminImages(c web.C, w http.ResponseWriter, r *http.Request) {
	data := make(map[string]interface{})
	data["title"] = TITLE + "Admin - Invalid Images "
	data["admin"] = true
	data["css"] = statics.SiteCss
	data["js"] = statics.SiteJs
	data["adminjs"] = statics.AdminJs

	renderer.HTML(w, http.StatusOK, "admin/images", data)
}

func adminImage(c web.C, w http.ResponseWriter, r *http.Request) {
	data := make(map[string]interface{})
	data["title"] = TITLE + "Admin - Edit Image "
	data["admin"] = true
	data["id"] = c.URLParams["id"]
	data["css"] = statics.SiteCss
	data["js"] = statics.SiteJs
	data["adminjs"] = statics.AdminJs

	renderer.HTML(w, http.StatusOK, "admin/image", data)
}

func adminFoursquareImages(c web.C, w http.ResponseWriter, r *http.Request) {
	api := foursquarego.NewFoursquareApi(clientID, clientSecret)
	uv := url.Values{}
	uv.Set("limit", "200")
	p, err := api.GetVenuePhotos(c.URLParams["id"], uv)
	if err != nil {
		fmt.Println(err)
	}
	renderer.JSON(w, http.StatusOK, p)
}
