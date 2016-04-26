package setting

import (
	"github.com/pelletier/go-toml"
)

var (
	HTTPPort   string
	LogLevel   string
	RunUpdator bool
	config     *toml.TomlTree
)

const Version = "3.2.0"

func init() {
	var err error
	config, err = toml.LoadFile("conf.toml")
	if err != nil {
		panic("Missing conf.toml")
	}
}

//Initialize saves all settings from config file
func Initialize() {
	if !config.Has("server.http_port") {
		panic("Config requires http_port setting")
	}

	if !config.Has("server.log_level") {
		panic("Config requires log_level setting")
	}

	if !config.Has("app.run_updator") {
		panic("Config requires updator setting")
	}

	HTTPPort = config.Get("server.http_port").(string)
	LogLevel = config.Get("server.log_level").(string)
	RunUpdator = config.Get("app.run_updator").(bool)
}

//Develop tells if the app is in develop mode
func Develop() bool {
	return LogLevel == "debug"
}
