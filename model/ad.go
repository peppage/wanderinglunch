package model

import (
	"errors"
	"fmt"
	"time"
)

/**
 * @apiDefine Ad
 * @apiParam {String} Name the name of the ad
 * @apiParam {String} Value the html to display to put on site
 * @apiParam {Number} ValidUntil How long the ad runs
 * @apiParam {Number} [Views=0] Not editable how many times this ad as run
 * @apiParam {String} Site What site this ad runs on
 * @apiParam {String=banner,square} Shape The shape of the ad
 */
type Ad struct {
	ID         int    `json:"id"`
	Name       string `json:"name"`
	Value      string `json:"value"`
	ValidUntil int64  `json:"validUntil"`
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

func AdsAddView(id int) error {
	_, err := db.Exec(`UPDATE ads SET views = views + 1 WHERE id = $1`, id)
	if err != nil {
		fmt.Println(err)
		return err
	}
	return nil
}

func DeleteAd(id string) error {
	result, err := db.Exec(`DELETE FROM ads WHERE id = $1`, id)
	if err != nil {
		fmt.Println(err)
		return err
	}
	if result != nil {
		return nil
	}
	return errors.New("Unknown error")
}

func AddAd(a Ad) error {
	_, err := db.NamedExec(`INSERT INTO ads (name, value, validuntil, shape, site) VALUES (:name, :value, :validuntil, :shape, :site)`, a)
	if err != nil {
		fmt.Println(err)
		return err
	}
	return nil
}

func UpdateAd(a Ad) error {
	_, err := db.NamedExec(`UPDATE ads SET (name, value, validuntil, site, shape) = (:name, :value, :validuntil, :site, :shape) WHERE id=:id`, a)
	if err != nil {
		fmt.Println(err)
		return err
	}
	return nil
}
