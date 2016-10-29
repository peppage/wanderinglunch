package datastore

import (
	"wanderinglunch/store"

	"github.com/jmoiron/sqlx"
)

type datastore struct {
	*sqlx.DB
}

func New(driver, datasource string) store.Store {
	return From(
		open(driver, datasource),
	)
}

func From(db *sqlx.DB) store.Store {
	return &datastore{db}
}

func open(driver, datasource string) *sqlx.DB {
	db := sqlx.MustConnect(driver, datasource)
	return db
}
