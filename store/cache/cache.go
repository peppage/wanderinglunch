package cache

import "wanderinglunch/model"

type Cache interface {
	GetSites() ([]*model.Site, bool)
	SetSites([]*model.Site)
	GetSite(string) (*model.Site, bool)
	SetSite(*model.Site)
}
