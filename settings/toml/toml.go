package toml

import (
	"wanderinglunch/settings"

	"github.com/pelletier/go-toml"
)

type tomlSettings struct {
	sessionSecret string
	logglyID      string
	httpPort      string
	logLevel      string
	runUpdator    bool
	develop       bool
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

	return &tomlSettings{
		httpPort:      config.Get("server.http_port").(string),
		sessionSecret: config.Get("server.session_secret").(string),
		logLevel:      config.Get("server.log_level").(string),
		runUpdator:    config.Get("app.run_updator").(bool),
		develop:       config.Get("app.develop").(bool),
		logglyID:      config.Get("loggly.client_id").(string),
	}
}
