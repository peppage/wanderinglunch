package setting

import (
	"github.com/pelletier/go-toml"
)

var (
	HTTPPort string
	LogLevel string
	config   *toml.TomlTree
)

const Version = "3.0-Alpha"

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

	HTTPPort = config.Get("server.http_port").(string)
	LogLevel = config.Get("server.log_level").(string)
}
