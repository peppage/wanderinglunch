package main

import (
	"net/http"

	"github.com/gorilla/schema"
)

var decoder = schema.NewDecoder()

type LoginRequest struct {
	Username string
	Password string
}

func parseLoginRequest(r *http.Request) (*LoginRequest, error) {
	if err := r.ParseForm(); err != nil {
		return nil, err
	}

	var request LoginRequest

	err := decoder.Decode(&request, r.PostForm)
	return &request, err
}

type TruckRequest struct {
	Name       string
	Twitter    string
	URL        string
	Type       string
	About      string
	Foursquare string
	Site       string
	Archive    bool
}

func parseTruckRequest(r *http.Request) (*TruckRequest, error) {
	if err := r.ParseForm(); err != nil {
		return nil, err
	}

	var request TruckRequest

	err := decoder.Decode(&request, r.PostForm)
	return &request, err
}
