package admin

import (
	"wanderinglunch/session"
	"wanderinglunch/store"
)

type Server struct {
	Data                   store.Store
	BasePageKey            string
	Sessions               session.Session
	FoursquareClientID     string
	FoursquareClientSecret string
}
