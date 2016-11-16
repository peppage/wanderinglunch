package datastore

import (
	"wanderinglunch/store"
	"wanderinglunch/store/cache"
	"wanderinglunch/store/cache/gocache"

	"github.com/jmoiron/sqlx"
)

type datastore struct {
	*sqlx.DB
	cache cache.Cache
}

func New(driver, datasource string) store.Store {
	return From(
		open(driver, datasource),
	)
}

func From(db *sqlx.DB) store.Store {
	return &datastore{DB: db, cache: gocache.New()}
}

func open(driver, datasource string) *sqlx.DB {
	db := sqlx.MustConnect(driver, datasource)
	return db
}
