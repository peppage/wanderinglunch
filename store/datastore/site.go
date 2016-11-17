package datastore

import "wanderinglunch/model"

//GetSite get a site entry from db
func (db *datastore) GetSite(name string) (*model.Site, error) {
	if site, ok := db.cache.GetSite(name); ok {
		return site, nil
	}

	var s = new(model.Site)
	err := db.Get(s, getSiteQuery, name)
	db.cache.SetSite(s)
	return s, err
}

func (db *datastore) GetSites() ([]*model.Site, error) {
	if sites, ok := db.cache.GetSites(); ok {
		return sites, nil
	}
	var sites []*model.Site
	err := db.Select(&sites, getSitesQuery)
	db.cache.SetSites(sites)
	return sites, err
}

//AddSite adds a site to the database
func (db *datastore) AddSite(s *model.Site) error {
	_, err := db.NamedExec(addSiteQuery, s)
	return err
}

func (db *datastore) UpdateSite(s *model.Site) error {
	db.cache.DelSite(s.Name)
	_, err := db.NamedExec(updateSitesQuery, s)
	return err
}

const getSiteQuery = `
SELECT NAME,
       title,
       description,
       lat,
       long
FROM   sites
WHERE  NAME = $1
`
const getSitesQuery = `
SELECT NAME,
       title,
       description,
       lat,
       long
FROM   sites 
`

const addSiteQuery = `
INSERT INTO sites
            (NAME,
             title,
             description,
             lat,
             long)
VALUES      (:name,
             :title,
             :description,
             :lat,
             :long) 
`

const updateSitesQuery = `
UPDATE sites
SET    title = :title,
       description = :description,
       lat = :lat,
       long = :long
WHERE  NAME = :name 
`
