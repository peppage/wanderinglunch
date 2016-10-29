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

func (db *datastore) GetAdsForSite(siteName string) ([]*model.Ad, error) {
	ads := []*model.Ad{}
	now := time.Now().Unix()
	err := db.Select(&ads, getAdsBySiteQuery, now, siteName)
	return ads, err
}

func (db *datastore) GetAd(id string) (*model.Ad, error) {
	var a = new(model.Ad)
	err := db.Get(a, getAdQuery, id)
	return a, err
}

func (db *datastore) AdsAddView(id int) error {
	_, err := db.Exec(adsAddViewQuery, id)
	return err
}

func (db *datastore) DeleteAd(id string) error {
	_, err := db.Exec(deleteAdQuery, id)
	return err
}

func (db *datastore) AddAd(a *model.Ad) error {
	if a.Name == "" || a.Value == "" || a.ValidUntil == 0 || a.Site == "" {
		return errors.New("No fields can be empty")
	}
	_, err := db.NamedExec(addAdQuery, a)
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
SELECT id, 
       NAME, 
       value, 
       validuntil, 
       views, 
       site 
FROM   ads 
ORDER  BY id 
`

const getAdsBySiteQuery = `
SELECT id,
       NAME,
       value,
       validuntil,
       views,
       site
FROM   ads
WHERE  validuntil > $1
       AND ( site = $2
              OR site = 'all' ) 
`

const getAdQuery = `
SELECT id,
       NAME,
       value,
       validuntil,
       views,
       site
FROM   ads
WHERE  id = $1 
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

const addAdQuery = `
INSERT INTO ads
            (NAME,
             value,
             validuntil,
             site)
VALUES      (:name,
             :value,
             :validuntil,
             :site) 
`

const updateAdQuery = `
UPDATE ads
SET    ( NAME, value, validuntil, site ) = ( :name, :value, :validuntil, :site )
WHERE  id = :id 
`
