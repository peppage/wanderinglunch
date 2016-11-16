package cache

import "wanderinglunch/model"

type Cache interface {
	GetSites() ([]*model.Site, bool)
	SetSites([]*model.Site)
}
