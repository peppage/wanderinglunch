package model

type Ad struct {
	ID         int    `json:"id"`
	Name       string `json:"name"`
	Value      string `json:"value"`
	ValidUntil int64  `json:"validUntil"`
	Views      int    `json:"views"`
	Site       string `json:"site"`
}
