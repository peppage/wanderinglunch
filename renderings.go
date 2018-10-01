package main

import (
	"net/http"
	"strings"

	"wanderinglunch/models"

	"github.com/go-chi/render"
)

type ErrResponse struct {
	Err            error  `json:"-"`
	HTTPStatusCode int    `json:"-"`
	StatusText     string `json:"status"`
	ErrorText      string `json:"error,omitempty"`
}

// Need to write one of these with a template for an HTML error page
func (e *ErrResponse) Render(w http.ResponseWriter, r *http.Request) error {
	render.Status(r, e.HTTPStatusCode)
	return nil
}

func ErrSqlError(err error) render.Renderer {
	return &ErrResponse{
		Err:            err,
		HTTPStatusCode: http.StatusInternalServerError,
		StatusText:     "Sql Error",
		ErrorText:      err.Error(),
	}
}

func ErrViewError(err error) render.Renderer {
	return &ErrResponse{
		Err:            err,
		HTTPStatusCode: http.StatusInternalServerError,
		StatusText:     "View Error",
		ErrorText:      err.Error(),
	}
}

func ErrBadRequest(err error) render.Renderer {
	return &ErrResponse{
		Err:            err,
		HTTPStatusCode: http.StatusBadRequest,
		StatusText:     "Bad request/form parse",
		ErrorText:      err.Error(),
	}
}

type TruckResponse struct {
	*models.Truck
	UpdatedText string `json:"updatetext"`
}

func NewTruckResponse(truck *models.Truck) *TruckResponse {
	resp := &TruckResponse{Truck: truck}
	return resp
}

func (rd *TruckResponse) Render(w http.ResponseWriter, r *http.Request) error {
	rd.UpdatedText = relativeTime(rd.Lastupdate)
	return nil
}

type TruckListResponse []*TruckResponse

func NewTruckListResponse(trucks []*models.Truck) []render.Renderer {
	list := []render.Renderer{}
	for _, truck := range trucks {
		list = append(list, NewTruckResponse(truck))
	}

	return list
}

type SubResponse struct {
	*models.Sub
}

func NewSubResponse(sub *models.Sub) *SubResponse {
	resp := &SubResponse{Sub: sub}
	return resp
}

func (rd *SubResponse) Render(w http.ResponseWriter, r *http.Request) error {
	return nil
}

type SubListResponse []*SubResponse

func NewSubListResponse(subs []*models.Sub) []render.Renderer {
	list := []render.Renderer{}
	for _, sub := range subs {
		list = append(list, NewSubResponse(sub))
	}
	return list
}

type LocationResponse struct {
	*models.Location
}

func NewLocationResponse(loc *models.Location) *LocationResponse {
	resp := &LocationResponse{Location: loc}
	return resp
}

func (rd *LocationResponse) Render(w http.ResponseWriter, r *http.Request) error {
	return nil
}

func NewLocationListResponse(locs []*models.Location) []render.Renderer {
	list := []render.Renderer{}
	for _, loc := range locs {
		list = append(list, NewLocationResponse(loc))
	}

	return list
}

type QueueResponse struct {
	*models.Tweet
	SubbedText string             `json:"subbedtext"`
	Locations  []*models.Location `json:"locations"`
}

func NewQueueResponse(tweet *models.Tweet) *QueueResponse {
	resp := &QueueResponse{Tweet: tweet}
	return resp
}

func (rd *QueueResponse) Render(w http.ResponseWriter, r *http.Request) error {
	rd.SubbedText = substitutions(strings.ToLower(rd.Text))
	rd.Locations = findLocations(rd.SubbedText)
	return nil
}

func NewQueueListResponse(tweets []*models.Tweet) []render.Renderer {
	list := []render.Renderer{}
	for _, tweet := range tweets {
		list = append(list, NewQueueResponse(tweet))
	}
	return list
}
