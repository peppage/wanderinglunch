package datastore

import (
	"testing"
	"time"

	"wanderinglunch/model"
	"wanderinglunch/store"

	"github.com/jmoiron/sqlx"
	"github.com/stretchr/testify/suite"
)

type AdTestSuite struct {
	suite.Suite
	data store.Store
	db   *sqlx.DB
}

func (suite *AdTestSuite) SetupSuite() {
	suite.db = open("pgx", "postgres://mca@localhost:5432/wandering_test")
	suite.data = From(suite.db)
}

func (suite *AdTestSuite) TearDownSuite() {
	suite.db.Close()
}

func (suite *AdTestSuite) SetupTest() {
	suite.db.Exec("DELETE FROM ads")
}

func (suite *AdTestSuite) TestCreateAd() {
	ad := model.Ad{
		Name:       "name",
		Value:      "value",
		ValidUntil: 1,
		Views:      0,
		Site:       "nyc",
	}

	err := suite.data.AddAd(&ad)
	suite.Assert().NoError(err, "Failed adding ad")
}

func (suite *AdTestSuite) TestGetAd() {
	ad := model.Ad{
		Name:       "name",
		Value:      "value",
		ValidUntil: 1,
		Views:      0,
		Site:       "nyc",
	}

	suite.data.AddAd(&ad)

	getAd, err := suite.data.GetAd(ad.ID)

	suite.Assert().NoError(err, "failed getting ad")
	suite.Equal(ad.ID, getAd.ID)
	suite.Equal(ad.Value, getAd.Value)
	suite.Equal(ad.ValidUntil, getAd.ValidUntil)
	suite.Equal(ad.Site, getAd.Site)
	suite.Equal(ad.Views, getAd.Views)
}

func (suite *AdTestSuite) TestGetAds() {
	ad1 := model.Ad{
		Name:       "name1",
		Value:      "value1",
		ValidUntil: 1,
		Site:       "nyc",
	}

	ad2 := model.Ad{
		Name:       "name2",
		Value:      "value2",
		ValidUntil: 1,
		Site:       "nyc",
	}

	suite.data.AddAd(&ad1)
	suite.data.AddAd(&ad2)

	ads, err := suite.data.GetAds()
	suite.Assert().NoError(err, "Failed getting ads")
	suite.Equal(len(ads), 2)
}

func (suite *AdTestSuite) TestGetSiteAds() {
	ad1 := model.Ad{
		Name:       "name1",
		Value:      "value1",
		ValidUntil: time.Now().Unix() + 100,
		Site:       "dc",
	}

	ad2 := model.Ad{
		Name:       "name2",
		Value:      "value2",
		ValidUntil: time.Now().Unix() + 100,
		Site:       "nyc",
	}

	suite.data.AddAd(&ad1)
	suite.data.AddAd(&ad2)

	ads, err := suite.data.GetAdsForSite("nyc")
	suite.Assert().NoError(err, "Failed getting ads for site")
	suite.Equal(len(ads), 1)
}

func (suite *AdTestSuite) TestAddAView() {
	ad := model.Ad{
		Name:       "name",
		Value:      "value",
		ValidUntil: 1,
		Site:       "dc",
	}

	suite.data.AddAd(&ad)

	err := suite.data.AdsAddView(ad.ID)
	getAd, err2 := suite.data.GetAd(ad.ID)

	suite.Assert().NoError(err, "Ads add view failed")
	suite.Assert().NoError(err2, "Failed getting the ad")
	suite.NotEqual(getAd.Views, ad.Views)
	suite.Equal(getAd.Views, 1)
}

func (suite *AdTestSuite) TestDeleteAd() {
	ad := model.Ad{
		Name:       "name",
		Value:      "value",
		ValidUntil: 1,
		Site:       "nyc",
	}

	suite.data.AddAd(&ad)
	err := suite.data.DeleteAd(ad.ID)
	_, err2 := suite.data.GetAd(ad.ID)

	suite.Assert().NoError(err, "Failed to delete add")
	suite.Assert().Error(err2, "Did get ad after it was deleted")
}

func (suite *AdTestSuite) TestUpdateAd() {
	ad := model.Ad{
		Name:       "name",
		Value:      "value",
		ValidUntil: 1,
		Site:       "nyc",
	}

	suite.data.AddAd(&ad)

	ad.Name = "New name"

	err := suite.data.UpdateAd(&ad)

	getAd, err2 := suite.data.GetAd(ad.ID)

	suite.Assert().NoError(err, "Failed updating ad")
	suite.Assert().NoError(err2, "Failed getting ad")

	suite.Equal(ad.Name, getAd.Name)
	suite.Equal(ad.Value, getAd.Value)
	suite.Equal(ad.ValidUntil, getAd.ValidUntil)
	suite.Equal(ad.Site, getAd.Site)
	suite.Equal(ad.Views, getAd.Views)
}

func TestAds(t *testing.T) {
	suite.Run(t, new(AdTestSuite))
}
