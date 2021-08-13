package main

import (
	"log"

	"github.com/knadh/koanf"
	"github.com/knadh/koanf/parsers/json"
	"github.com/knadh/koanf/providers/file"
)

type config struct {
	TwitterConsumerKey    string
	TwitterConsumerSecret string
	DbFilename            string
	SentryDsn             string
	Debug                 bool
	Port                  string
}

func loadConfig() *config {
	var k = koanf.New(".")
	if err := k.Load(file.Provider("config.json"), json.Parser()); err != nil {
		log.Fatalf("error loading config: %v", err)
	}

	return &config{
		TwitterConsumerKey:    k.String("twitter.consumerKey"),
		TwitterConsumerSecret: k.String("twitter.consumerSecret"),
		DbFilename:            k.String("database.name"),
		SentryDsn:             k.String("sentry.dsn"),
		Debug:                 k.Bool("debug.on"),
		Port:                  k.String("port.value"),
	}
}
