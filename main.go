package main

//go:generate sqlboiler --wipe psql

import (
	"database/sql"
	"log"
	"net/http"
	"os"
	"path/filepath"
	"strings"

	"wanderinglunch/updator"

	"github.com/CloudyKit/jet"
	"github.com/go-chi/chi"
	_ "github.com/lib/pq"
)

var db *sql.DB
var View = jet.NewHTMLSet("./views")
var conf *appConfig

type H map[string]interface{}

func init() {
	conf = loadConfig()
	setupDB(conf.DbConnection)
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

	log.Fatal(http.ListenAndServe(":"+conf.Port, router))
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
