package main

import (
	"github.com/gookit/config"
	"github.com/gookit/config/toml"
)

type appConfig struct {
	TwitterConsumerKey    string
	TwitterConsumerSecret string
	DbConnection          string
	Port                  string
	SessionKey            string
	Develop               bool
}

func loadConfig() *appConfig {
	config.AddDriver(toml.Driver)

	err := config.LoadFiles("conf.toml")
	if err != nil {
		panic("Missing config file")
	}

	consumerKey, _ := config.String("twitter.consumer_key")
	consumerSecret, _ := config.String("twitter.consumer_secret")
	dbConn, _ := config.String("app.db_connection")
	port, _ := config.String("server.http_port")
	sessKey, _ := config.String("app.session_key")
	d, _ := config.Bool("app.develop")

	return &appConfig{
		TwitterConsumerKey:    consumerKey,
		TwitterConsumerSecret: consumerSecret,
		DbConnection:          dbConn,
		Port:                  port,
		SessionKey:            sessKey,
		Develop:               d,
	}
}
