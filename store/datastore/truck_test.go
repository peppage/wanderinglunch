package datastore

import (
	"testing"
	"wanderinglunch/model"
	"wanderinglunch/store"

	"github.com/jmoiron/sqlx"
	"github.com/stretchr/testify/suite"
)

type TruckTestSuite struct {
	suite.Suite
	data store.Store
	db   *sqlx.DB
}

func (suite *TruckTestSuite) SetupSuite() {
	suite.db = open("pgx", "postgres://mca@localhost:5432/wandering_test")
	suite.data = From(suite.db)
}

func (suite *TruckTestSuite) TearDownSuite() {
	suite.db.Close()
}

func (suite *TruckTestSuite) SetupTest() {
	suite.db.Exec("DELETE FROM trucks")
}

func (suite *TruckTestSuite) TestAddTruck() {
	truck := model.Truck{
		Name:       "name",
		Twitname:   "twitname",
		Weburl:     "web url",
		Type:       "type",
		About:      "about",
		Foursquare: "foursquare",
		Archive:    false,
		ID:         "twitname",
		Site:       "nyc",
	}

	err := suite.data.AddTruck(&truck)

	suite.Assert().NoError(err, "Failed adding truck")
}

func (suite *TruckTestSuite) TestGetTruck() {
	truck := model.Truck{
		Name:       "name",
		Twitname:   "twitname",
		Weburl:     "web url",
		Type:       "type",
		About:      "about",
		Foursquare: "foursquare",
		Archive:    false,
		ID:         "twitname",
		Site:       "nyc",
	}

	suite.data.AddTruck(&truck)

	getTruck, err := suite.data.GetTruck(truck.Twitname)

	suite.Assert().NoError(err, "Failed getting truck")
	suite.Exactly(1, len(getTruck))
	suite.Equal(truck.Name, getTruck[0].Name)
	suite.Equal(truck.Twitname, getTruck[0].Twitname)
	suite.Equal(truck.Weburl, getTruck[0].Weburl)
	suite.Equal(truck.Type, getTruck[0].Type)
	suite.Equal(truck.About, getTruck[0].About)
	suite.Equal(truck.Foursquare, getTruck[0].Foursquare)
	suite.Equal(truck.Archive, getTruck[0].Archive)
	suite.Equal(truck.ID, getTruck[0].ID)
	suite.Equal(truck.Site, getTruck[0].Site)
}

func (suite *TruckTestSuite) TestUpdateTruck() {
	truck := model.Truck{
		Name:       "name",
		Twitname:   "twitname",
		Weburl:     "web url",
		Type:       "type",
		About:      "about",
		Foursquare: "foursquare",
		Archive:    false,
		ID:         "twitname",
		Site:       "nyc",
	}

	suite.data.AddTruck(&truck)

	truck.Foursquare = "new foursquare"

	err := suite.data.UpdateTruck(&truck)

	getTruck, err2 := suite.data.GetTruck(truck.Twitname)

	suite.Assert().NoError(err, "Failed updating truck")
	suite.Assert().NoError(err2, "Failed getting truck")
	suite.Exactly(1, len(getTruck))
	suite.Equal(truck.Name, getTruck[0].Name)
	suite.Equal(truck.Twitname, getTruck[0].Twitname)
	suite.Equal(truck.Weburl, getTruck[0].Weburl)
	suite.Equal(truck.Type, getTruck[0].Type)
	suite.Equal(truck.About, getTruck[0].About)
	suite.Equal(truck.Foursquare, getTruck[0].Foursquare)
	suite.Equal(truck.Archive, getTruck[0].Archive)
	suite.Equal(truck.ID, getTruck[0].ID)
	suite.Equal(truck.Site, getTruck[0].Site)
}

func TestTrucks(t *testing.T) {
	suite.Run(t, new(TruckTestSuite))
}
