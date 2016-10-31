package model

type Sub struct {
	ID          int    `json:"id"`
	Regex       string `json:"regex"`
	Replacement string `json:"replacement"`
}
