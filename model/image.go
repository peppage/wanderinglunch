package model

type Image struct {
	ID         string `json:"id"`
	Suffix     string `json:"suffix"`
	Visibility string `json:"visibility"`
	Twitname   string `json:"twitname"`
	Menu       bool   `json:"menu"`
}

func GetImages(twitname string) ([]*Image, error) {
	var images []*Image
	err := db.Select(&images, `SELECT id, suffix, visibility, twitname, menu
		FROM images WHERE twitname = $1 ORDER BY menu DESC, id`, twitname)
	return images, err
}

func UpdateImage(i Image) error {
	_, err := db.NamedExec(`UPDATE images SET (suffix, visibility, twitname, menu) =
		(:suffix, :visibility, :twitname, :menu) WHERE id=:id`, i)
	return err
}

func AddImage(i Image) error {
	_, err := db.Exec(`INSERT INTO images (id, suffix, twitname, menu) VALUES ($1, $2, $3, $4)`,
		i.ID, i.Suffix, i.Twitname, i.Menu)
	return err
}

func GetImage(id string) (Image, error) {
	var i Image
	err := db.Get(&i, `SELECT id, suffix, visibility, twitname, menu FROM images WHERE id=$1`, id)
	return i, err
}
