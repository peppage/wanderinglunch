package main

import (
	"html/template"
	"log"
	"net/http"

	"bitbucket.org/peppage/wlapi/model"
	"github.com/jmoiron/sqlx"
	_ "github.com/lib/pq"
	"github.com/peppage/sessions"
	"github.com/unrolled/render"
	"github.com/zenazn/goji"
	"github.com/zenazn/goji/web"
	"github.com/zenazn/goji/web/middleware"
)

var db *sqlx.DB
var renderer *render.Render
var secret = "thisismysecret"
var redisSessionStore = sessions.NewRedisStore("tcp", "127.0.0.1:6379")
var Sessions = sessions.NewSessionOptions(secret, redisSessionStore, ".wanderinglunch.com")

func root(c web.C, w http.ResponseWriter, r *http.Request) {
	message := model.GetMessage(1)
	data := make(map[string]interface{})
	data["title"] = "Wandering Lunch: NYC Food Truck Finder"
	data["message"] = template.HTML(message.Message)

	renderer.HTML(w, http.StatusOK, "index", data)
}

func allTrucks(c web.C, w http.ResponseWriter, r *http.Request) {
	data := make(map[string]interface{})
	data["title"] = "Wandering Lunch: NYC Food Truck Finder | All Trucks List"
	data["trucks"] = model.Trucks(8, "lat", "desc", 0)
	renderer.HTML(w, http.StatusOK, "alltrucks", data)
}

func truck(c web.C, w http.ResponseWriter, r *http.Request) {
	var t = model.GetTruck(c.URLParams["id"])
	if t.ID == "" {
		http.Redirect(w, r, "/", http.StatusNotFound)
		return
	}

	data := make(map[string]interface{})
	data["truck"] = t
	data["title"] = "Wandering Lunch: NYC Food Truck Finder | " + t.Name
	data["id"] = c.URLParams["id"]

	renderer.HTML(w, http.StatusOK, "truck", data)
}

func maps(c web.C, w http.ResponseWriter, r *http.Request) {
	data := make(map[string]interface{})
	data["title"] = "Wandering Lunch: NYC Food Truck Finder | Map"
	renderer.HTML(w, http.StatusOK, "map", data)
}

func support(c web.C, w http.ResponseWriter, r *http.Request) {
	renderer.HTML(w, http.StatusOK, "support", nil)
}

func login(c web.C, w http.ResponseWriter, r *http.Request) {
	renderer.HTML(w, http.StatusOK, "login", nil)
}

func loginHandle(c web.C, w http.ResponseWriter, r *http.Request) {
	u, err := model.VerifyPassword(r.FormValue("email"), r.FormValue("password"))
	if err != nil {
		http.Redirect(w, r, "/login", http.StatusTemporaryRedirect) // The user is invalid!
		return
	}
	s := Sessions.GetSessionObject(&c)
	s["user"] = u.Email
	http.Redirect(w, r, "/admin", http.StatusTemporaryRedirect)
}

func serveSingle(pattern string, filename string) {
	http.HandleFunc(pattern, func(w http.ResponseWriter, r *http.Request) {
		http.ServeFile(w, r, filename)
	})
}

func init() {
	var err error
	db, err = sqlx.Open("postgres", "user=mca dbname=foodtruck sslmode=disable")
	if err != nil {
		log.Fatal(err)
	}

	renderer = render.New(render.Options{
		IndentJSON:    false,
		IsDevelopment: true,
		Layout:        "layout",
	})

	http.Handle("/static/", http.StripPrefix("/static/", http.FileServer(http.Dir("./static/"))))
}

func main() {

	serveSingle("/favicon.ico", "./static/images/favicon.ico")

	goji.Use(Sessions.Middleware())
	goji.Get("/", root)
	goji.Get("/truck/:id", truck)
	goji.Get("/alltrucks", allTrucks)
	goji.Get("/map", maps)
	goji.Get("/support", support)
	goji.Get("/login", login)
	goji.Post("/login", loginHandle)

	admin := web.New()
	goji.Get("/admin", http.RedirectHandler("/admin/", http.StatusMovedPermanently))
	goji.Handle("/admin/*", admin)
	admin.Use(Secure)
	admin.Use(middleware.SubRouter)
	admin.Get("/", adminRoot)
	admin.Get("/fix/:id", adminFix)
	admin.Get("/location/new/:tweetId", adminNewLoc)
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

	goji.Serve()
}
