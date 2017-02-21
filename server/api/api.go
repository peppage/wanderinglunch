package api

import "wanderinglunch/store"

type Server struct {
	Data        store.Store
	BasePageKey string
	TimeKey     string
}
