package datastore

import (
	"errors"
	"time"
	"wanderinglunch/model"
)

func (db *datastore) GetAds() ([]*model.Ad, error) {
	ads := []*model.Ad{}
	err := db.Select(&ads, getAdsQuery)
	return ads, err
}

func (db *datastore) GetAd(id int) (*model.Ad, error) {
	var a = new(model.Ad)
	err := db.Get(a, getAdQuery, id)
	return a, err
}

// GetAdsForSite gets all the relevant ads for a site, based on time.Now()
func (db *datastore) GetAdsForSite(siteName string) ([]*model.Ad, error) {
	ads := []*model.Ad{}
	now := time.Now().Unix()
	err := db.Select(&ads, getAdsBySiteQuery, now, siteName)
	return ads, err
}

func (db *datastore) AdsAddView(id int) error {
	_, err := db.Exec(adsAddViewQuery, id)
	return err
}

func (db *datastore) DeleteAd(id int) error {
	_, err := db.Exec(deleteAdQuery, id)
	return err
}

func (db *datastore) AddAd(a *model.Ad) error {
	if a.Name == "" || a.Value == "" || a.ValidUntil == 0 || a.Site == "" {
		return errors.New("No fields can be empty")
	}
	var lastInsertID int
	err := db.Get(&lastInsertID, createAdQuery,
		a.Name, a.Value, a.ValidUntil, a.Site)

	a.ID = lastInsertID
	return err
}

func (db *datastore) UpdateAd(a *model.Ad) error {
	if a.Name == "" || a.Value == "" || a.ValidUntil == 0 || a.Site == "" {
		return errors.New("No fields can be empty")
	}
	_, err := db.NamedExec(updateAdQuery, a)
	return err
}

const getAdsQuery = `
SELECT *
FROM   ads 
ORDER  BY id 
`

const getAdQuery = `
SELECT *
FROM   ads
WHERE  id = $1 
`

const getAdsBySiteQuery = `
SELECT *
FROM   ads
WHERE  validuntil > $1
       AND ( site = $2
              OR site = 'all' ) 
`

const adsAddViewQuery = `
UPDATE ads
SET    views = views + 1
WHERE  id = $1 
`

const deleteAdQuery = `
DELETE FROM ads
WHERE  id = $1 
`

const createAdQuery = `
INSERT INTO ads
            (name,
             value,
             validuntil,
             site)
VALUES      ($1,
             $2,
             $3,
             $4)
RETURNING id
`

const updateAdQuery = `
UPDATE ads
SET    ( name, value, validuntil, site ) = ( :name, :value, :validuntil, :site )
WHERE  id = :id 
`
