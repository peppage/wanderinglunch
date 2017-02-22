package settings

type Settings interface {
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
	RollbarToken() string
}
