package main

import (
	"fmt"
	"log"
	"net/http"

	"wanderinglunch/model"
	"wanderinglunch/tmpl"

	"github.com/jmoiron/sqlx"
	"github.com/labstack/echo"
	mw "github.com/labstack/echo/middleware"
	_ "github.com/lib/pq"
	"github.com/syntaqx/echo-middleware/session"
)

var db *sqlx.DB
var secret = "D3MtG1ixqlhavdbxmBclkKvjYtBqWUQexsVCsr5xNWO1af36hZnZP"
var store = session.NewCookieStore([]byte(secret))

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
	u, err := model.VerifyPassword(c.Form("email"), c.Form("password"))
	if err != nil {
		c.Response().Header().Set("Method", "GET")
		return echo.NewHTTPError(http.StatusUnauthorized) // The user is invalid!
	}
	session := session.Default(c)
	session.Set("user", u.Email)
	session.Save()
	return c.Redirect(http.StatusSeeOther, "/admin")
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
	if err.Error() == "Permission denied!" {
		c.HTML(http.StatusUnauthorized, tmpl.Error401())
	}
}

func init() {
	var err error
	db, err = sqlx.Open("postgres", "user=mca dbname=foodtruck sslmode=disable")
	if err != nil {
		log.Fatal(err)
	}
}

func main() {

	e := echo.New()
	e.Use(session.Sessions("session", store))
	e.SetHTTPErrorHandler(errorHandler)
	e.Use(mw.Logger())

	e.Static("/static/", "static")
	e.Static("/doc/", "doc")
	e.ServeFile("/google7edb19ba8a4a91bb.html", "./static/google7edb19ba8a4a91bb.html")
	e.Favicon("./static/images/favicon.ico")

	e.Get("/", index)
	e.Get("/alltrucks", allTrucks)
	e.Get("/truck/:id", truck)
	e.Get("/map", maps)
	e.Get("/login", login)
	e.Post("/login", loginHandle)

	ad := e.Group("/admin")
	ad.Use(secure())
	ad.Get("", adminRoot)
	ad.Get("/fix/:id", adminFix)
	ad.Get("/location/new/:tweetId", adminNewLoc)
	ad.Get("/subs", adminSubs)
	ad.Get("/sub/add", adminNewSub)
	ad.Get("/sub/:id", adminSub)
	ad.Get("/locations", adminLocs)
	ad.Get("/location/:id", adminEditLoc)
	ad.Get("/trucks", adminTrucks)
	ad.Get("/truck/:id", adminEditTruck)
	ad.Get("/truck/add", adminNewTruck)
	ad.Get("/images", adminImages)
	ad.Get("/image/:id", adminImage)
	ad.Get("/message", adminMessage)
	ad.Get("/foursquare/:id", adminFoursquareImages)
	ad.Get("/ads", adminAds)
	ad.Get("/ad/add", adminNewAd)
	ad.Get("/ad/:id", adminEditAd)

	a := e.Group("/api")
	a.Use(secureApi())
	a.Get("/trucks", trucks)
	a.Put("/trucks/:id", truckUpdate)
	a.Delete("/trucks/:id", truckDelete)
	a.Post("/trucks", truckInsert)
	a.Get("/trucks/failures", failures)
	a.Get("/messages", message)
	a.Get("/trucks/:id", truckById)
	a.Get("/trucks/:id/tweets", truckTweets)
	a.Get("/markers", markers)
	a.Get("/tweets/:id", tweetById)
	a.Get("/subs", substitutions)
	a.Post("/subs", subInsert)
	a.Get("/subs/:id", subsitution)
	a.Put("/subs/:id", subUpdate)
	a.Delete("/subs/:id", subDelete)
	a.Get("/locations", locations)
	a.Get("/locations/:id", location)
	a.Post("/locations", locationInsert)
	a.Put("/locations/:id", locationUpdate)
	a.Delete("/locations/:id", locationDelete)
	a.Get("/zones", zones)
	a.Get("/images", images)
	a.Get("/images/:id", image)
	a.Post("/images", imageInsert)
	a.Put("/images/:id", imageUpdate)
	a.Delete("/images/:id", imageDelete)
	a.Post("/messages", messageSave)
	a.Get("/ads", ads)
	a.Delete("/ads/:id", adDelete)
	a.Get("/ads/:id", advert)
	a.Post("/ads", adInsert)
	a.Put("/ads/:id", adUpdate)
	a.Post("/upload", upload)

	e.Use(mw.Recover())
	e.Run(":8000")
}
