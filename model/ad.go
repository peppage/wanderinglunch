package model

import (
	"time"
	"wanderinglunch/util"
)

type Ad struct {
	ID         int    `json:"id"`
	Name       string `json:"name"`
	Value      string `json:"value"`
	ValidUntil int64  `json:"validUntil"`
	Views      int    `json:"views"`
	Site       string `json:"site"`
}

var adStacks map[string]*util.Stack

//GetAdToShow gets the correct ad to show on the site
func GetAdToShow(siteName string) (*Ad, error) {
	if val, ok := adStacks[siteName]; !ok || val.Len() == 0 {
		err := fillStack(siteName)
		if err != nil {
			return nil, err
		}
	}
	a, _ := adStacks[siteName].Pop()
	ad := a.(Ad)
	return &ad, nil

}

func fillStack(siteName string) error {
	now := time.Now().Unix()
	rows, err := db.Queryx(`SELECT * FROM ads where validuntil > $1 AND (site = $2 OR site = 'all')`, now, siteName)
	if err != nil {
		return err
	}

	adStacks[siteName] = &util.Stack{}
	for rows.Next() {
		ad := Ad{}
		rows.StructScan(&ad)
		adStacks[siteName].Push(ad)
	}
	return nil
}

func GetAds() ([]*Ad, error) {
	var ads []*Ad
	err := db.Select(&ads, `SELECT * from ads ORDER BY id`)
	return ads, err
}

func GetAd(id string) (*Ad, error) {
	var a Ad
	err := db.QueryRowx(`SELECT * FROM ads WHERE id=$1`, id).StructScan(&a)
	return &a, err
}

func AdsAddView(id int) error {
	_, err := db.Exec(`UPDATE ads SET views = views + 1 WHERE id = $1`, id)
	return err
}

func DeleteAd(id string) error {
	_, err := db.Exec(`DELETE FROM ads WHERE id = $1`, id)
	return err
}

func AddAd(a Ad) error {
	_, err := db.NamedExec(`INSERT INTO ads (name, value, validuntil, site) VALUES (:name, :value, :validuntil, :site)`, a)
	return err
}

func UpdateAd(a Ad) error {
	_, err := db.NamedExec(`UPDATE ads SET (name, value, validuntil, site) =
		(:name, :value, :validuntil, :site) WHERE id=:id`, a)
	return err
}
