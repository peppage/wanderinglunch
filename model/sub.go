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

func AddSub(s Sub) error {
	_, err := db.NamedExec(`INSERT INTO subs (regex, replacement) VALUES (:regex, :replacement)`, s)
	return err
}

func GetSub(id string) (*Sub, error) {
	var s Sub
	err := db.Get(&s, `SELECT * FROM subs WHERE id=$1`, id)
	return &s, err
}

//UpdateSub updates a sub by id in the database
func UpdateSub(s Sub) error {
	_, err := db.NamedExec(`UPDATE subs SET (regex, replacement) = (:regex, :replacement) WHERE id=:id`, s)
	return err
}
