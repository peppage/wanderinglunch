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

func adminFix(c web.C, w http.ResponseWriter, r *http.Request) {
	t := model.GetTruck(c.URLParams["id"])
	if t.ID == "" {
		http.Redirect(w, r, "/admin", http.StatusNotFound)
		return
	}

	data := make(map[string]interface{})
	data["truck"] = t
	data["title"] = TITLE + "Admin - Fixing " + t.Name
	data["admin"] = true
	data["css"] = statics.SiteCss
	data["js"] = statics.SiteJs
	data["adminjs"] = statics.AdminJs

	renderer.HTML(w, http.StatusOK, "admin/fix", data)
}

func adminNewLoc(c web.C, w http.ResponseWriter, r *http.Request) {
	data := make(map[string]interface{})
	data["title"] = TITLE + "Admin - Add Location"
	data["id"] = c.URLParams["tweetId"]
	data["admin"] = true
	data["css"] = statics.SiteCss
	data["js"] = statics.SiteJs
	data["adminjs"] = statics.AdminJs
	data["sites"] = model.Sites()

	renderer.HTML(w, http.StatusOK, "admin/newloc", data)
}

func adminLocs(c web.C, w http.ResponseWriter, r *http.Request) {
	data := make(map[string]interface{})
	data["title"] = TITLE + "Admin - Locations"
	data["admin"] = true
	data["css"] = statics.SiteCss
	data["js"] = statics.SiteJs
	data["adminjs"] = statics.AdminJs

	renderer.HTML(w, http.StatusOK, "admin/locations", data)
}

func adminEditLoc(c web.C, w http.ResponseWriter, r *http.Request) {
	data := make(map[string]interface{})
	data["title"] = TITLE + "Admin - Location " + c.URLParams["id"]
	data["admin"] = true
	data["id"] = c.URLParams["id"]
	data["css"] = statics.SiteCss
	data["js"] = statics.SiteJs
	data["adminjs"] = statics.AdminJs

	renderer.HTML(w, http.StatusOK, "admin/location", data)
}

func adminTrucks(c web.C, w http.ResponseWriter, r *http.Request) {
	data := make(map[string]interface{})
	data["title"] = TITLE + "Admin - Trucks "
	data["admin"] = true
	data["css"] = statics.SiteCss
	data["js"] = statics.SiteJs
	data["adminjs"] = statics.AdminJs

	renderer.HTML(w, http.StatusOK, "admin/trucks", data)
}

func adminEditTruck(c web.C, w http.ResponseWriter, r *http.Request) {
	data := make(map[string]interface{})
	data["title"] = TITLE + "Admin - Truck " + c.URLParams["id"]
	data["admin"] = true
	data["id"] = c.URLParams["id"]
	data["css"] = statics.SiteCss
	data["js"] = statics.SiteJs
	data["adminjs"] = statics.AdminJs

	renderer.HTML(w, http.StatusOK, "admin/truck", data)
}

func adminNewTruck(c web.C, w http.ResponseWriter, r *http.Request) {
	data := make(map[string]interface{})
	data["title"] = TITLE + "Admin - Add Truck "
	data["admin"] = true
	data["css"] = statics.SiteCss
	data["js"] = statics.SiteJs
	data["adminjs"] = statics.AdminJs
	data["sites"] = model.Sites()

	renderer.HTML(w, http.StatusOK, "admin/newtruck", data)
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

func adminSubs(c web.C, w http.ResponseWriter, r *http.Request) {
	data := make(map[string]interface{})
	data["title"] = TITLE + "Admin - Subs"
	data["admin"] = true
	data["css"] = statics.SiteCss
	data["js"] = statics.SiteJs
	data["adminjs"] = statics.AdminJs

	renderer.HTML(w, http.StatusOK, "admin/subs", data)
}

func adminSub(c web.C, w http.ResponseWriter, r *http.Request) {
	data := make(map[string]interface{})
	data["title"] = TITLE + "Admin - Sub " + c.URLParams["id"]
	data["admin"] = true
	data["id"] = c.URLParams["id"]
	data["css"] = statics.SiteCss
	data["js"] = statics.SiteJs
	data["adminjs"] = statics.AdminJs

	renderer.HTML(w, http.StatusOK, "admin/sub", data)
}

func adminNewSub(c web.C, w http.ResponseWriter, r *http.Request) {
	data := make(map[string]interface{})
	data["title"] = TITLE + "Admin - Add Sub "
	data["admin"] = true
	data["css"] = statics.SiteCss
	data["js"] = statics.SiteJs
	data["adminjs"] = statics.AdminJs

	renderer.HTML(w, http.StatusOK, "admin/newsub", data)
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
