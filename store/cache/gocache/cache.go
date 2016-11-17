package gocache

import (
	"time"

	"wanderinglunch/store/cache"

	gcache "github.com/patrickmn/go-cache"
)

type gocache struct {
	cache *gcache.Cache
}

func New() cache.Cache {
	return &gocache{gcache.New(5*time.Minute, 30*time.Second)}

}
