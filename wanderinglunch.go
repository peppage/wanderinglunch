package main

import (
	"encoding/json"
	"fmt"
	"html/template"
	"log"
	"net/http"
	"os"

	"wanderinglunch/model"
	"wanderinglunch/tmpl"

	"github.com/jmoiron/sqlx"
	"github.com/labstack/echo"
	mw "github.com/labstack/echo/middleware"
	_ "github.com/lib/pq"
	"github.com/peppage/sessions"
	"github.com/unrolled/render"
	"github.com/zenazn/goji"
	"github.com/zenazn/goji/web"
	"github.com/zenazn/goji/web/middleware"
)

var db *sqlx.DB
var renderer *render.Render
var secret = "D3MtG1ixqlhavdbxmBclkKvjYtBqWUQexsVCsr5xNWO1af36hZnZP"
var redisSessionStore = sessions.MemoryStore{}
var Sessions = sessions.NewSessionOptions(secret, &redisSessionStore, "*")
var siteJs string

var TITLE = "Wandering Lunch: NYC Food Truck Finder | "

var statics struct {
	SiteCss string `json:"site.css"`
	SiteJs  string `json:"site.js"`
	AdminJs string `json:"admin.js"`
}

func root(c web.C, w http.ResponseWriter, r *http.Request) {
	message := model.GetMessage(1)
	data := make(map[string]interface{})
	data["title"] = "Wandering Lunch: NYC Food Truck Finder"
	data["message"] = template.HTML(message.Message)
	data["css"] = statics.SiteCss
	data["js"] = statics.SiteJs
	data["zones"] = model.Zones("nyc")
	renderer.HTML(w, http.StatusOK, "index", data)
}

func index(c *echo.Context) error {
	return c.HTML(http.StatusOK, tmpl.Index(model.Zones("nyc")))
}

func allTrucks(c *echo.Context) error {
	return c.HTML(http.StatusOK, tmpl.Alltrucks(model.Trucks(730, "lat", "desc", 0)))
}

func truck(c *echo.Context) error {
	var t = model.GetTruck(c.Param("id"))
	if t.ID == "" {
		return echo.NewHTTPError(http.StatusNotFound)
	}
	return c.HTML(http.StatusOK, tmpl.Truck(t))
}

func maps(c *echo.Context) error {
	return c.HTML(http.StatusOK, tmpl.Map())
}

func login(c *echo.Context) error {
	return c.HTML(http.StatusOK, tmpl.Login())
}

func loginHandle(c *echo.Context) error {
	_, err := model.VerifyPassword(c.Form("email"), c.Form("password"))
	if err != nil {
		c.Response().Header().Set("Method", "GET")
		return echo.NewHTTPError(http.StatusUnauthorized) //c.Redirect(http.StatusSeeOther, "/login") // The user is invalid!
	}
	//s := Sessions.GetSessionObject(&c)
	//s["user"] = u.Email
	return c.Redirect(http.StatusSeeOther, "/admin")
}

func notFound(c web.C, w http.ResponseWriter, r *http.Request) {
	renderer.HTML(w, http.StatusNotFound, "404", nil)
}

func serveSingle(pattern string, filename string) {
	http.HandleFunc(pattern, func(w http.ResponseWriter, r *http.Request) {
		w.Header().Add("Cache-Control", "max-age=31536000, public, must-revalidate, proxy-revalidate")
		w.Header().Add("Vary", "Accept-Encoding")
		http.ServeFile(w, r, filename)
	})
}

func maxAgeHandler(seconds int, h http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.Header().Add("Cache-Control", fmt.Sprintf("max-age=%d, public, must-revalidate, proxy-revalidate", seconds))
		w.Header().Add("Vary", "Accept-Encoding")
		h.ServeHTTP(w, r)
	})
}

func errorHandler(err error, c *echo.Context) {
	if err.Error() == "Not Found" {
		c.HTML(http.StatusNotFound, tmpl.Error404())
	}
}

func init() {
	var err error
	db, err = sqlx.Open("postgres", "user=mca dbname=foodtruck sslmode=disable")
	if err != nil {
		log.Fatal(err)
	}

	renderer = render.New(render.Options{
		IndentJSON:    false,
		IsDevelopment: false,
		Layout:        "layout",
	})

	staticFiles, err := os.Open("rev-manifest.json")
	if err != nil {
		fmt.Println("opening config file", err.Error())
	}
	jsonParser := json.NewDecoder(staticFiles)
	if err = jsonParser.Decode(&statics); err != nil {
		fmt.Println("parsing config file", err.Error())
	}
	defer staticFiles.Close()
}

func main() {

	e := echo.New()

	e.SetHTTPErrorHandler(errorHandler)
	e.Use(mw.Logger())
	e.Use(mw.Recover())

	e.Static("/static/", "static")
	e.Static("/doc/", "doc")
	e.Favicon("./static/images/favicon.ico")

	e.Get("/", index)
	e.Get("/alltrucks", allTrucks)
	e.Get("/truck/:id", truck)
	e.Get("/map", maps)
	e.Get("/login", login)
	e.Post("/login", loginHandle)

	ad := e.Group("/admin")
	ad.Get("", adminRoot)
	ad.Get("/fix/:id", adminFix)
	ad.Get("/location/new/:tweetId", adminNewLoc)

	a := e.Group("/api")
	a.Get("/trucks", trucks)
	a.Get("/messages", message)
	a.Get("/trucks/:id", truckById)
	a.Get("/trucks/:id/tweets", truckTweets)
	a.Get("/markers", markers)
	a.Get("/tweets/:id", tweetById)

	e.Run(":1234")

	goji.Use(Sessions.Middleware())

	goji.NotFound(notFound)

	admin := web.New()
	goji.Get("/admin", http.RedirectHandler("/admin/", http.StatusMovedPermanently))
	goji.Handle("/admin/*", admin)
	admin.Use(Secure)
	admin.Use(middleware.SubRouter)
	admin.Get("/locations", adminLocs)
	admin.Get("/location/:id", adminEditLoc)
	admin.Get("/trucks", adminTrucks)
	admin.Get("/truck/add", adminNewTruck)
	admin.Get("/truck/:id", adminEditTruck)
	admin.Get("/message", adminMessage)
	admin.Get("/subs", adminSubs)
	admin.Get("/sub/add", adminNewSub)
	admin.Get("/sub/:id", adminSub)
	admin.Get("/images", adminImages)
	admin.Get("/image/:id", adminImage)
	admin.Get("/foursquare/:id", adminFoursquareImages)

	api := web.New()
	goji.Get("/api", http.RedirectHandler("/api/", http.StatusMovedPermanently))
	goji.Handle("/api/*", api)
	api.Use(SecurePost)
	api.Use(middleware.SubRouter)
	api.Get("/trucks/failures", failures)
	api.Put("/trucks/:id", truckUpdate)
	api.Delete("/trucks/:id", truckDelete)
	api.Post("/trucks", truckInsert)
	api.Post("/messages", messageSave)
	api.Get("/subs", substitutions)
	api.Get("/subs/:id", subsitution)
	api.Post("/subs", subInsert)
	api.Put("/subs/:id", subUpdate)
	api.Delete("/subs/:id", subDelete)
	api.Get("/locations", locations)
	api.Get("/locations/:id", location)
	api.Post("/locations", locationInsert)
	api.Put("/locations/:id", locationUpdate)
	api.Delete("/locations/:id", locationDelete)
	api.Get("/images", images)
	api.Get("/images/:id", image)
	api.Post("/images", imageInsert)
	api.Put("/images/:id", imageUpdate)
	api.Delete("/images/:id", imageDelete)

	goji.Serve()
}
