package main

import (
	"net/http"
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
		HTTPStatusCode: 500,
		StatusText:     "Sql Error",
		ErrorText:      err.Error(),
	}
}

func ErrViewError(err error) render.Renderer {
	return &ErrResponse{
		Err:            err,
		HTTPStatusCode: 500,
		StatusText:     "View Error",
		ErrorText:      err.Error(),
	}
}

type TruckResponse struct {
	*models.Truck
}

func NewTruckResponse(truck *models.Truck) *TruckResponse {
	resp := &TruckResponse{Truck: truck}

	return resp
}

func (rd *TruckResponse) Render(w http.ResponseWriter, r *http.Request) error {
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
