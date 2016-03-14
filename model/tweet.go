package model

type Tweet struct {
	Contents  string `json:"contents"`
	Time      string `json:"time"`
	ID        string `json:"id"`
	Retweeted bool   `json:"retweeted"`
	Twitname  string `json:"twitname"`
}
