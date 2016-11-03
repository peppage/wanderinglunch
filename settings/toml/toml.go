package toml

import (
	"wanderinglunch/settings"

	"github.com/pelletier/go-toml"
)

type tomlSettings struct {
	sessionSecret            string
	logglyID                 string
	httpPort                 string
	logLevel                 string
	runUpdator               bool
	develop                  bool
	twitterConsumerKey       string
	twitterConsumerSecret    string
	twitterAccessToken       string
	twitterAccessTokenSecret string
	foursquareClientID       string
	foursquareClientSecret   string
}

func (t *tomlSettings) SessionSecret() string {
	return t.sessionSecret
}

func (t *tomlSettings) LogglyID() string {
	return t.logglyID
}

func (t *tomlSettings) HTTPPort() string {
	return t.httpPort
}

func (t *tomlSettings) LogLevel() string {
	return t.logLevel
}

func (t *tomlSettings) RunUpdator() bool {
	return t.runUpdator
}

func (t *tomlSettings) Develop() bool {
	return t.develop
}

func (t *tomlSettings) TwitterConsumerKey() string {
	return t.twitterConsumerKey
}

func (t *tomlSettings) TwitterConsumerSecret() string {
	return t.twitterConsumerSecret
}

func (t *tomlSettings) TwitterAccessToken() string {
	return t.twitterAccessToken
}

func (t *tomlSettings) TwitterAccessTokenSecret() string {
	return t.twitterAccessTokenSecret
}

func (t *tomlSettings) FoursquareClientID() string {
	return t.foursquareClientID
}

func (t *tomlSettings) FoursquareClientSecret() string {
	return t.foursquareClientSecret
}

// New the settings and set them up from the toml file
func New(filename string) settings.Settings {
	config, err := toml.LoadFile("conf.toml")
	if err != nil {
		panic("Missing conf.toml")
	}

	if !config.Has("server.http_port") {
		panic("Config requires http_port setting")
	}

	if !config.Has("server.log_level") {
		panic("Config requires log_level setting")
	}

	if !config.Has("server.session_secret") {
		panic("Config requires session_secret setting")
	}

	if !config.Has("app.run_updator") {
		panic("Config requires updator setting")
	}

	if !config.Has("app.develop") {
		panic("Config requires develop setting")
	}

	if !config.Has("loggly.client_id") {
		panic("Config requires loggly client_id")
	}

	if !config.Has("twitter.consumer_key") {
		panic("Config requires twitter consumer key")
	}

	if !config.Has("twitter.consumer_secret") {
		panic("Config requires twitter consumer secret")
	}

	if !config.Has("twitter.access_token") {
		panic("Config requires twitter access token")
	}

	if !config.Has("twitter.access_token_secret") {
		panic("Config requires twitter access token secret")
	}

	if !config.Has("foursquare.client_id") {
		panic("Config requires foursquare client id")
	}

	if !config.Has("foursquare.client_secret") {
		panic("Config requires foursquare client secret")
	}

	return &tomlSettings{
		httpPort:                 config.Get("server.http_port").(string),
		sessionSecret:            config.Get("server.session_secret").(string),
		logLevel:                 config.Get("server.log_level").(string),
		runUpdator:               config.Get("app.run_updator").(bool),
		develop:                  config.Get("app.develop").(bool),
		logglyID:                 config.Get("loggly.client_id").(string),
		twitterConsumerKey:       config.Get("twitter.consumer_key").(string),
		twitterConsumerSecret:    config.Get("twitter.consumer_secret").(string),
		twitterAccessToken:       config.Get("twitter.access_token").(string),
		twitterAccessTokenSecret: config.Get("twitter.access_token_secret").(string),
		foursquareClientID:       config.Get("foursquare.client_id").(string),
		foursquareClientSecret:   config.Get("foursquare.client_secret").(string),
	}
}
