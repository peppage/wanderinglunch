package main

type Truck struct {
	ID         string
	Name       string
	WebURL     string
	LastUpdate int64
	Type       string
	About      string
	Foursquare string
	Archive    bool
	Images     []*Image
}

type Spot struct {
	ID              string
	Name            string
	LocationDisplay string
	Time            int64
	ImageSuffix     string
	Zone            string
	Lat             float64
	Long            float64
}

type SpotIds struct {
	TruckID    string
	LocationID int
	TweetID    string
}

type Image struct {
	ID         string
	Suffix     string
	Visibility string
	TruckID    string
	Menu       bool
}

type User struct {
	ID       int
	Email    string
	Password string
}

type Tweet struct {
	ID      string
	Text    string
	Time    int64
	TruckID string
	Done    bool
}

type Location struct {
	ID      int
	Display string
	Matcher string
	Lat     float64
	Long    float64
	Zone    string
}

type Sub struct {
	ID          int
	Regex       string
	Replacement string
}
