package main

//go:generate sqlboiler --wipe psql

import (
	"context"
	"database/sql"
	"log"
	"net/http"

	"wanderinglunch/models"
	"wanderinglunch/updator"

	"github.com/go-chi/chi"
	"github.com/go-chi/render"
	_ "github.com/lib/pq"
	"github.com/volatiletech/sqlboiler/queries/qm"
)

var db *sql.DB

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

	router.Get("/", index)

	return router
}

func index(w http.ResponseWriter, r *http.Request) {
	spots, err := models.Spots(qm.Load("Location"), qm.Load("Truck")).All(context.Background(), db)
	if err != nil {
		w.Write([]byte(err.Error()))
	}

	for _, spot := range spots {
		render.JSON(w, r, spot)
		return
	}

}
