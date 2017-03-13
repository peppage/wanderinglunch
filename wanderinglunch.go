package main

//go:generate fileb0x b0x.yaml

import (
	"encoding/gob"
	"mime"
	"net/http"
	"path/filepath"

	"wanderinglunch/model"
	"wanderinglunch/server/admin"
	"wanderinglunch/server/api"
	"wanderinglunch/server/public"
	"wanderinglunch/session"
	"wanderinglunch/session/cookie"
	"wanderinglunch/settings"
	"wanderinglunch/settings/toml"
	"wanderinglunch/static"
	"wanderinglunch/store"
	"wanderinglunch/store/datastore"
	"wanderinglunch/updator"

	log "github.com/Sirupsen/logrus"
	"github.com/heroku/rollrus"
	"github.com/labstack/echo"
	"github.com/rifflock/lfshook"
)

var sessions session.Session
var webSettings settings.Settings
var data store.Store

// Version is autoset from the build script
var Version string

// Build is autoset from the build script
var Build string

func init() {
	gob.Register(&model.User{})

	webSettings = toml.New("conf.toml")
	sessions = cookie.New()
	data = datastore.New("pgx", "postgres://mca@localhost:5432/foodtruck") //webSettings.DataSourceName())

	ll, err := log.ParseLevel(webSettings.LogLevel())
	if err == nil {
		log.SetLevel(ll)
	}
	if webSettings.Develop() {
		log.SetFormatter(&log.TextFormatter{})
		log.AddHook(lfshook.NewHook(
			lfshook.PathMap{
				log.DebugLevel: "info.log",
				log.ErrorLevel: "error.log",
			}))
	} else {
		log.SetFormatter(&log.JSONFormatter{})
		log.AddHook(rollrus.NewHook(webSettings.RollbarToken(), "production"))
	}

	if webSettings.RunUpdator() {
		go updator.Start(data, webSettings)
	}
}

func main() {
	e := echo.New()
	e.Use(setStartTime)
	e.Use(setBasePage)

	e.GET("/robots.txt", serveFile("static/robots.txt"))
	e.GET("/favicon.ico", serveFile("static/images/favicon.ico"))
	e.GET("/touch-icon-192x192.png", serveFile("static/images/touch-icon-192x192.png"))
	e.GET("/apple-touch-icon.png", serveFile("static/images/touch-icon-192x192.png"))
	e.GET("/apple-touch-icon-precomposed.png", serveFile("static/images/touch-icon-192x192.png"))
	e.GET("/apple-touch-icon-120x120.png", serveFile("static/images/touch-icon-192x192.png"))
	e.GET("/apple-touch-icon-120x120-precomposed.png", serveFile("static/images/touch-icon-192x192.png"))
	e.GET("/BingSiteAuth.xml", serveFile("static/BingSiteAuth.xml"))

	publicServer := &public.Server{
		Data:        data,
		BasePageKey: basePageKey,
		TimeKey:     timeKey,
		Version:     Version,
		Build:       Build,
		Sessions:    sessions,
		Debug:       webSettings.Develop(),
	}

	e.HTTPErrorHandler = publicServer.HTTPErrorHandler

	e.GET("/", publicServer.Index)
	e.GET("/:site", publicServer.Index)
	e.GET("/login", publicServer.Login)
	e.POST("/login", publicServer.LoginHandle)
	e.GET("/truck/:name", publicServer.Truck)
	e.GET("/alltrucks", publicServer.AllTrucks)
	e.GET("/:site/alltrucks", publicServer.AllTrucks)
	e.GET("/:site/lastupdate", publicServer.LastUpdate)
	e.GET("/map", publicServer.Maps)
	e.GET("/:site/map", publicServer.Maps)
	e.GET("/:site/feedback", publicServer.Feedback)
	e.GET("/sitemap.txt", publicServer.Sitemap)
	e.GET("/:site/amp", publicServer.AmpIndex)
	e.GET("/truck/:name/amp", publicServer.AmpTruck)

	apiServer := &api.Server{
		Data:        data,
		BasePageKey: basePageKey,
		TimeKey:     timeKey,
	}

	e.GET("/:site/aboutapi", apiServer.Index)
	apiRouter := e.Group("/:site/api")
	apiRouter.GET("/trucks", apiServer.Trucks)

	adminServer := &admin.Server{
		Data:                   data,
		BasePageKey:            basePageKey,
		Sessions:               sessions,
		FoursquareClientID:     webSettings.FoursquareClientID(),
		FoursquareClientSecret: webSettings.FoursquareClientSecret(),
	}

	adminRouter := e.Group("/admin")
	adminRouter.Use(mustUser)
	adminRouter.Use(siteContext)
	adminRouter.Use(setBasePageAdmin)
	adminRouter.Use(setSitesAdmin)
	adminRouter.GET("", adminServer.Index)
	adminRouter.GET("/setSite", adminServer.SetSite)
	adminRouter.GET("/debug", adminServer.Debug)
	adminRouter.GET("/truck/add", adminServer.TruckNew)
	adminRouter.POST("/truck/add", adminServer.TruckSave)
	adminRouter.GET("/trucks", adminServer.Trucks)
	adminRouter.GET("/truck/edit", adminServer.TruckEdit)
	adminRouter.POST("/truck/edit", adminServer.TruckUpdate)
	adminRouter.GET("/sub/add", adminServer.SubNew)
	adminRouter.POST("/sub/add", adminServer.SubSave)
	adminRouter.GET("/subs", adminServer.Subs)
	adminRouter.GET("/sub/edit", adminServer.SubEdit)
	adminRouter.POST("/sub/edit", adminServer.SubUpdate)
	adminRouter.GET("/ad/add", adminServer.AdNew)
	adminRouter.POST("/ad/add", adminServer.AdSave)
	adminRouter.GET("/ads", adminServer.Ads)
	adminRouter.GET("/ad/edit", adminServer.AdEdit)
	adminRouter.POST("/ad/edit", adminServer.AdUpdate)
	adminRouter.GET("/location/add", adminServer.LocNew)
	adminRouter.POST("/location/add", adminServer.LocSave)
	adminRouter.GET("/locations", adminServer.Locations)
	adminRouter.GET("/location/edit", adminServer.LocEdit)
	adminRouter.POST("/location/edit", adminServer.LocUpdate)
	adminRouter.GET("/site/add", adminServer.SiteNew)
	adminRouter.POST("/site/add", adminServer.SiteSave)
	adminRouter.GET("/sites", adminServer.Sites)
	adminRouter.GET("/site/edit", adminServer.SiteEdit)
	adminRouter.POST("/site/edit", adminServer.SiteUpdate)
	adminRouter.GET("/foursquare", adminServer.Foursquare)
	adminRouter.POST("/image/add", adminServer.ImgAdd)
	adminRouter.GET("/image/edit", adminServer.ImgEdit)
	adminRouter.POST("/image/edit", adminServer.ImgUpdate)
	adminRouter.GET("/queue", adminServer.Queue)
	adminRouter.GET("/queue/done", adminServer.QueueDone)

	e.GET("/static/*", echo.WrapHandler(static.Handler))

	log.Info("Starting up app " + Version + " " + Build + "on port " + webSettings.HTTPPort())
	e.Logger.Fatal(e.Start(":" + webSettings.HTTPPort()))
}

func serveFile(filename string) echo.HandlerFunc {
	return echo.HandlerFunc(func(c echo.Context) error {
		b, _ := static.ReadFile(filename)
		return c.Blob(http.StatusOK, mime.TypeByExtension(filepath.Ext(filename)), b)
	})
}
