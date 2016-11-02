package settings

type Settings interface {
	SessionSecret() string
	LogglyID() string
	HTTPPort() string
	LogLevel() string
	RunUpdator() bool
	Develop() bool
}
