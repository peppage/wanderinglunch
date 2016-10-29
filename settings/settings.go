package settings

type Settings interface {
	SessionSecret() string
	LogglyID() string
	HTTPPort() string
	LogLevel() string
	RunUpdator() bool
	Version() string
	Develop() bool
}
