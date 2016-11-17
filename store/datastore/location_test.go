package datastore

import (
	"testing"
	"wanderinglunch/model"
	"wanderinglunch/store"

	"github.com/jmoiron/sqlx"
	"github.com/stretchr/testify/suite"
)

type LocationTestSuite struct {
	suite.Suite
	data store.Store
	db   *sqlx.DB
}

func (suite *LocationTestSuite) SetupSuite() {
	suite.db = open("pgx", "postgres://mca@localhost:5432/wandering_test")
	suite.data = From(suite.db)
}

func (suite *LocationTestSuite) TearDownSuite() {
	suite.db.Close()
}

func (suite *LocationTestSuite) SetupTest() {
	suite.db.Exec("DELETE FROM locations")
}

func (suite *LocationTestSuite) TestAddLocation() {
	location := model.Location{
		Display: "Display",
		Matcher: "Matcher",
		Lat:     3.1038,
		Long:    -83.03,
		Zone:    "zone",
		Site:    "site",
	}

	err := suite.data.AddLocation(&location)

	suite.Assert().NoError(err, "Failed adding location")
}

func (suite *LocationTestSuite) TestGetLocation() {
	location := model.Location{
		Display: "Display",
		Matcher: "Matcher",
		Lat:     3.1038,
		Long:    -83.03,
		Zone:    "zone",
		Site:    "site",
	}

	suite.data.AddLocation(&location)

	getLoc, err := suite.data.GetLocation(location.ID)

	suite.Assert().NoError(err, "Failed getting location")
	suite.Equal(location.ID, getLoc.ID)
	suite.Equal(location.Display, getLoc.Display)
	suite.Equal(location.Matcher, getLoc.Matcher)
	suite.Equal(location.Lat, getLoc.Lat)
	suite.Equal(location.Long, getLoc.Long)
	suite.Equal(location.Zone, getLoc.Zone)
	suite.Equal(location.Site, getLoc.Site)
}

func (suite *LocationTestSuite) TestUpdateLocation() {
	location := model.Location{
		Display: "Display",
		Matcher: "Matcher",
		Lat:     3.1038,
		Long:    -83.03,
		Zone:    "zone",
		Site:    "site",
	}

	suite.data.AddLocation(&location)

	location.Display = "Updated Display"

	err := suite.data.UpdateLocation(&location)

	getLoc, err2 := suite.data.GetLocation(location.ID)

	suite.Assert().NoError(err, "Failed updating location")
	suite.Assert().NoError(err2, "Failed getting location")
	suite.Equal(location.ID, getLoc.ID)
	suite.Equal(location.Display, getLoc.Display)
	suite.Equal(location.Matcher, getLoc.Matcher)
	suite.Equal(location.Lat, getLoc.Lat)
	suite.Equal(location.Long, getLoc.Long)
	suite.Equal(location.Zone, getLoc.Zone)
	suite.Equal(location.Site, getLoc.Site)
}

func TestLocations(t *testing.T) {
	suite.Run(t, new(LocationTestSuite))
}
