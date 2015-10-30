package model

import (
	"fmt"
	"time"
)

type Ad struct {
	ID         string `json:"id"`
	Name       string `json:"name"`
	Value      string `json:"value"`
	ValidUntil int    `json:"validUntil"`
	Views      int    `json:"views"`
	Site       string `json:"site"`
	Shape      string `json:"shape"`
}

func GetAds() []*Ad {
	var ads []*Ad
	err := db.Select(&ads, `SELECT * from ads ORDER BY id`)
	if err != nil {
		fmt.Println(err)
	}
	return ads
}

func GetAd(id string) Ad {
	var a Ad
	err := db.QueryRowx(`SELECT * FROM ads WHERE id=$1`, id).StructScan(&a)
	if err != nil {
		fmt.Println(err)
	}
	return a
}

func GetActiveAds(shape string, site string) []*Ad {
	var ads []*Ad
	now := time.Now().Unix()
	err := db.Select(&ads, `SELECT * FROM ads where validuntil > $1 AND (site = $2 OR site = 'all') AND shape=$3`, now, site, shape)
	if err != nil {
		fmt.Println(err)
	}
	return ads
}

func AdsAddView(id string) error {
	_, err := db.Exec(`UPDATE ads SET views = views + 1 WHERE id = $1`, id)
	if err != nil {
		fmt.Println(err)
		return err
	}
	return nil
}
