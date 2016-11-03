package model

import "github.com/stretchr/testify/suite"

type AdTestSuite struct {
	suite.Suite
}

func (suite *AdTestSuite) TestFillStack() {
	site := "nyc"

	ad1 := Ad{
		ID:         1,
		Name:       "Test Ad 1",
		Value:      "Value",
		ValidUntil: 1,
		Site:       site,
	}

	ad2 := Ad{
		ID:         1,
		Name:       "Test Ad 2",
		Value:      "Value",
		ValidUntil: 1,
		Site:       site,
	}

	var ads []*Ad

	ads = append(ads, &ad1)
	ads = append(ads, &ad2)

	adStack := AdStack{}

	adStack.Fill(ads, site)

	suite.Equal(len(ads), adStack.Len(site))
}

func (suite *AdTestSuite) TestGetAd() {
	site := "nyc"
	ad := Ad{
		ID:         1,
		Name:       "Test Ad",
		Value:      "Value",
		ValidUntil: 1,
		Site:       site,
	}

	var ads []*Ad
	ads = append(ads, &ad)

	adStack := AdStack{}
	adStack.Fill(ads, site)

	getAd, err := adStack.GetAd(site)

	suite.Assert().NoError(err, "Get ad failed")
	suite.Equal(ad.ID, getAd.ID)
	suite.Equal(ad.Name, getAd.Name)
	suite.Equal(ad.Value, getAd.Value)
	suite.Equal(ad.ValidUntil, getAd.ValidUntil)
	suite.Equal(ad.Site, getAd.Site)
}
