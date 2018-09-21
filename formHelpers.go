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

type SubRequest struct {
	Regex       string
	Replacement string
}

func parseSubRequest(r *http.Request) (*SubRequest, error) {
	if err := r.ParseForm(); err != nil {
		return nil, err
	}

	var request SubRequest

	err := decoder.Decode(&request, r.PostForm)
	return &request, err
}

type LocationRequest struct {
	Display string
	Matcher string
	Lat     float64
	Long    float64
	Zone    string
	Site    string
}

func parseLocationRequest(r *http.Request) (*LocationRequest, error) {
	if err := r.ParseForm(); err != nil {
		return nil, err
	}

	var request LocationRequest

	err := decoder.Decode(&request, r.PostForm)
	return &request, err
}
