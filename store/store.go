package store

import "wanderinglunch/model"

type Store interface {
	GetAds() ([]*model.Ad, error)
	GetAd(string) (*model.Ad, error)
	AdsAddView(int) error
	DeleteAd(string) error
	AddAd(*model.Ad) error
	UpdateAd(*model.Ad) error

	GetImages(string) ([]*model.Image, error)
	UpdateImage(*model.Image) error
	AddImage(*model.Image) error
	GetImage(string) (*model.Image, error)

	GetLocations() (map[string][]*model.Location, error)
	GetZones(string) ([]string, error)
	AddLocation(*model.Location) error
	UpdateLocation(*model.Location) error
	GetLocation(string) (*model.Location, error)
}
