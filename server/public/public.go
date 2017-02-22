package public

import (
	"wanderinglunch/session"
	"wanderinglunch/store"
)

type Server struct {
	Data        store.Store
	BasePageKey string
	TimeKey     string
	Version     string
	Build       string
	Debug       bool
	Sessions    session.Session
}
