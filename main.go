package main

//go:generate sqlboiler --wipe psql

import (
	"database/sql"
	"log"
	"net/http"

	"wanderinglunch/updator"

	"github.com/go-chi/chi"
	_ "github.com/lib/pq"
)

var db *sql.DB

func init() {
	setupDB()

	updator.InitializeTwitter(updator.TwitterCreds{
		ConsumerKey:    "",
		ConsumerSecret: "",
	})

	updator.Start(db)
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

	router.Get("/", index)

	return router
}

func index(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("hey"))
}
