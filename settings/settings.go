package settings

type Settings interface {
	SessionSecret() string
	LogglyID() string
	HTTPPort() string
	LogLevel() string
	RunUpdator() bool
	Develop() bool
	TwitterConsumerKey() string
	TwitterConsumerSecret() string
	TwitterAccessToken() string
	TwitterAccessTokenSecret() string
	FoursquareClientID() string
	FoursquareClientSecret() string
}
