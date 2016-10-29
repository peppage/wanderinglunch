package model

import (
	log "github.com/Sirupsen/logrus"
	_ "github.com/jackc/pgx/stdlib"
	"github.com/jmoiron/sqlx"
)

var db *sqlx.DB

func init() {
	var err error
	db, err = sqlx.Connect("pgx", "postgres://mca@localhost:5432/foodtruck")
	if err != nil {
		log.WithError(err).Error("Failed to connect to sql")
	}
}
