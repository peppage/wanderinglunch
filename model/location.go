package model

type Location struct {
	ID      int     `json:"id"`
	Display string  `json:"display"`
	Matcher string  `json:"matcher"`
	Lat     float32 `json:"lat"`
	Long    float32 `json:"long"`
	Zone    string  `json:"zone"`
	Site    string  `json:"site"`
}
