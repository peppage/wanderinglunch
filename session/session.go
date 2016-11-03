package session

import (
	"net/http"

	"wanderinglunch/model"
)

type Session interface {
	SetUser(http.ResponseWriter, *http.Request, *model.User)
	GetUser(*http.Request) *model.User

	SetSite(http.ResponseWriter, *http.Request, string)
	GetSite(*http.Request) string

	Clear(http.ResponseWriter, *http.Request)
}
