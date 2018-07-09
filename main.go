package main

import (
	"log"
	"net/http"

	"github.com/go-chi/chi"
)

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
