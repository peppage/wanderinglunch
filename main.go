package main

//go:generate sqlboiler --wipe psql

import (
	"context"
	"database/sql"
	"log"
	"net/http"
	"os"
	"path/filepath"
	"strings"
	"time"

	"wanderinglunch/models"
	"wanderinglunch/updator"

	"github.com/CloudyKit/jet"
	"github.com/go-chi/chi"
	_ "github.com/lib/pq"
	"github.com/volatiletech/sqlboiler/queries/qm"
)

var db *sql.DB
var View = jet.NewHTMLSet("./views")

type H map[string]interface{}

func init() {
	setupDB()

	updator.InitializeTwitter(updator.TwitterCreds{
		ConsumerKey:    "",
		ConsumerSecret: "",
	})

	//updator.Start(db)
}

func setupDB() {
	var err error
	db, err = sql.Open("postgres", "postgres://mca@localhost:5432/foodtruck?sslmode=disable")
	if err != nil {
		log.Fatalf("Failed opening DB: %v", err)
	}

	if err := db.Ping(); err != nil {
		log.Fatalf("not connected to db: %v", err)
	}

}

func main() {
	router := routes()

	log.Fatal(http.ListenAndServe(":8000", router))
}

func routes() *chi.Mux {
	router := chi.NewRouter()

	workDir, _ := os.Getwd()
	filesDir := filepath.Join(workDir, "static")
	FileServer(router, "/static", http.Dir(filesDir))

	router.Get("/", func(w http.ResponseWriter, r *http.Request) {
		http.Redirect(w, r, "/nyc", http.StatusPermanentRedirect)
	})

	router.Get("/{site:[a-z-]+}", index)

	return router
}

func index(w http.ResponseWriter, r *http.Request) {
	site := chi.URLParam(r, "site")
	spots, err := getSpots(site)
	if err != nil {
		w.Write([]byte(err.Error()))
	}

	template, _ := View.GetTemplate("index.jet")

	vars := make(jet.VarMap)
	vars.Set("spots", spots)
	if err := template.Execute(w, vars, nil); err != nil {
		panic(err)
	}
}

func getSpots(site string) (map[string][]*models.Spot, error) {
	eightHoursAgo := time.Now().Add(time.Duration(-1*238) * (time.Minute * 60)).Unix()
	spots, err := models.Spots(
		qm.Load("Location"),
		qm.Load("Truck"),
		qm.InnerJoin("locations on location_id = locations.id"),
		qm.InnerJoin("tweets on tweet_id = tweets.id"),
		qm.InnerJoin("trucks on truck_id = trucks.twitname"),
		qm.Where("trucks.site = ?", site),
		qm.Where("tweets.time > ?", eightHoursAgo),
		qm.OrderBy("lat DESC")).All(context.Background(), db)
	if err != nil {
		return nil, err
	}

	zones := make(map[string][]*models.Spot)
	for _, s := range spots {
		if _, ok := zones[s.R.Location.Zone]; ok {
			zones[s.R.Location.Zone] = append(zones[s.R.Location.Zone], s)
		} else {
			zones[s.R.Location.Zone] = []*models.Spot{s}
		}
	}

	return zones, nil
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
