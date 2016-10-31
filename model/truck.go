package model

type Truck struct {
	ID         string   `json:"id"`
	Name       string   `json:"name"`
	Twitname   string   `json:"twitname"`
	Weburl     string   `json:"weburl"`
	Retweeted  bool     `json:"retweeted"`
	Lastupdate int64    `json:"lastupdate"`
	Updated    string   `json:"updated"`
	Type       string   `json:"type"`
	About      string   `json:"about"`
	Foursquare string   `json:"foursquare"`
	Location   string   `json:"location"`
	Zone       string   `json:"zone"`
	Image      string   `json:"image"`
	Tweets     []*Tweet `json:"tweets"`
	Images     []*Image `json:"images"`
	Site       string   `json:"site"`
	Archive    bool     `json:"archive"`
}
