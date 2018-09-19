package main

//go:generate sqlboiler --wipe psql

import (
	"database/sql"
	"encoding/gob"
	"log"
	"net/http"
	"os"
	"path/filepath"
	"strings"

	"wanderinglunch/models"
	"wanderinglunch/updator"

	"github.com/CloudyKit/jet"
	"github.com/go-chi/chi"
	"github.com/gorilla/context"
	"github.com/gorilla/sessions"
	_ "github.com/lib/pq"
)

var db *sql.DB
var View = jet.NewHTMLSet("./views")
var conf *appConfig
var store *sessions.CookieStore

// Version is autoset from the build script
var Version string

// Build is autoset from the build script
var Build string

type H map[string]interface{}

func init() {
	conf = loadConfig()
	setupDB(conf.DbConnection)
	store = sessions.NewCookieStore([]byte(conf.SessionKey))
	gob.Register(&models.User{})
	loadFastFunctions()

	updator.InitializeTwitter(updator.TwitterCreds{
		ConsumerKey:    conf.TwitterConsumerKey,
		ConsumerSecret: conf.TwitterConsumerSecret,
	})

	//updator.Start(db)
}

func setupDB(dbConn string) {
	var err error
	db, err = sql.Open("postgres", dbConn)
	if err != nil {
		log.Fatalf("Failed opening DB: %v", err)
	}

	if err := db.Ping(); err != nil {
		log.Fatalf("not connected to db: %v", err)
	}

}

func main() {
	router := routes()

	log.Fatal(http.ListenAndServe(":"+conf.Port, context.ClearHandler(router)))
}

func routes() *chi.Mux {
	router := chi.NewRouter()

	workDir, _ := os.Getwd()
	filesDir := filepath.Join(workDir, "static")
	FileServer(router, "/static", http.Dir(filesDir))

	router.Get("/", func(w http.ResponseWriter, r *http.Request) {
		http.Redirect(w, r, "/nyc", http.StatusPermanentRedirect)
	})

	router.Route("/{site:[a-z-]+}", func(r chi.Router) {
		r.Get("/", index)
		r.Get("/alltrucks", allTrucks)
		r.Get("/map", mapPage)
	})

	router.Get("/truck/{id:[a-z-0-9]+}", truckPage)

	router.Route("/admin", func(r chi.Router) {
		if !conf.Develop {
			r.Use(mustUser)
		}
		r.Get("/", adminIndex)
		r.Get("/truck/add", adminAddTruck)
		r.Post("/truck/add", adminAddTruckHandle)
	})

	router.Get("/login", login)
	router.Post("/login", loginHandler)

	return router
}

// FileServer conveniently sets up a http.FileServer handler to serve
// static files from a http.FileSystem.
func FileServer(r chi.Router, path string, root http.FileSystem) {
	if strings.ContainsAny(path, "{}*") {
		panic("FileServer does not permit URL parameters.")
	}

	fs := http.StripPrefix(path, http.FileServer(root))

	if path != "/" && path[len(path)-1] != '/' {
		r.Get(path, http.RedirectHandler(path+"/", 301).ServeHTTP)
		path += "/"
	}
	path += "*"

	r.Get(path, http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		fs.ServeHTTP(w, r)
	}))
}
