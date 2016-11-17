package gocache

import (
	"time"
	"wanderinglunch/model"
)

const adKey = "_ad_"

func (c gocache) GetAd(siteName string) (*model.Ad, bool) {
	if x, found := c.cache.Get(adKey + siteName); found {
		return x.(*model.Ad), found
	}
	return nil, false
}

func (c gocache) SetAd(ad *model.Ad) {
	c.cache.Set(adKey+ad.Site, ad, time.Second*5)
}
