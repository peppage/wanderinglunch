package model

type Image struct {
	ID         string `json:"id"`
	Suffix     string `json:"suffix"`
	Visibility string `json:"visibility"`
	Twitname   string `json:"twitname"`
	Menu       bool   `json:"menu"`
}
