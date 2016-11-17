package gocache

import (
	"wanderinglunch/model"

	gcache "github.com/patrickmn/go-cache"
)

const sitesKey = "_sites"

func (c gocache) GetSites() ([]*model.Site, bool) {
	if x, found := c.cache.Get(sitesKey); found {
		return x.([]*model.Site), found
	}
	return nil, false
}

func (c gocache) SetSites(sites []*model.Site) {
	c.cache.Set(sitesKey, sites, gcache.DefaultExpiration)
}

const siteKey = "_site_"

func (c gocache) GetSite(name string) (*model.Site, bool) {
	if x, found := c.cache.Get(siteKey + name); found {
		return x.(*model.Site), found
	}
	return nil, false
}

func (c gocache) SetSite(site *model.Site) {
	c.cache.Set(siteKey+site.Name, site, gcache.DefaultExpiration)
}
