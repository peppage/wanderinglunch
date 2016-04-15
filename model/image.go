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
	err := db.Select(&images, `SELECT * FROM images WHERE twitname = $1 ORDER BY menu DESC, id`, twitname)
	return images, err
}

func UpdateImage(i Image) error {
	_, err := db.NamedExec(`UPDATE images SET (suffix, visibility, twitname, menu) = (:suffix, :visibility, :twitname, :menu) WHERE id=:id`, i)
	return err
}
