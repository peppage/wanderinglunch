package main

import (
	"errors"
	"net/http"
	"wanderinglunch/models"

	"github.com/go-chi/render"
)

func adminIndex(w http.ResponseWriter, r *http.Request) {
	c := pageContext{
		Site:    &models.Site{},
		Version: Version,
	}

	template, _ := View.GetTemplate("admin/index.jet")
	if err := template.Execute(w, nil, c); err != nil {
		render.Render(w, r, ErrViewError(err))
		return
	}
}

func adminAPIQueue(w http.ResponseWriter, r *http.Request) {
	tweets, err := getTweetsBySite("nyc", 20)
	if err != nil {
		render.Render(w, r, ErrSqlError(err))
		return
	}

	render.RenderList(w, r, NewQueueListResponse(tweets))
}

type DoneRequest struct {
	ID string `json:"id"`
}

func (d *DoneRequest) Bind(r *http.Request) error {
	if d.ID == "" {
		return errors.New("ID missing in request")
	}

	return nil
}

func adminAPIQueueDone(w http.ResponseWriter, r *http.Request) {
	data := &DoneRequest{}
	if err := render.Bind(r, data); err != nil {
		render.Render(w, r, ErrBadRequest(err))
		return
	}

	err := markTweetDone(data.ID)
	if err != nil {
		render.Render(w, r, ErrSqlError(err))
		return
	}

	render.Status(r, http.StatusOK)
}
