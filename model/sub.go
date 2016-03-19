package model

type Sub struct {
	ID          int    `json:"id"`
	Regex       string `json:"regex"`
	Replacement string `json:"replacement"`
}

func GetSubs() ([]*Sub, error) {
	var subs []*Sub
	err := db.Select(&subs, `SELECT regex, replacement, id FROM subs ORDER BY id`)
	return subs, err
}
