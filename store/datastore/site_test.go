package datastore

import (
	"testing"
	"wanderinglunch/model"
	"wanderinglunch/store"

	"github.com/jmoiron/sqlx"
	"github.com/stretchr/testify/suite"
)

type SiteTestSuite struct {
	suite.Suite
	data store.Store
	db   *sqlx.DB
}

func (suite *SiteTestSuite) SetupSuite() {
	suite.db = open("pgx", "postgres://mca@localhost:5432/wandering_test")
	suite.data = From(suite.db)
}

func (suite *SiteTestSuite) TearDownSuite() {
	suite.db.Close()
}

func (suite *SiteTestSuite) SetupTest() {
	suite.db.Exec("DELETE FROM sites")
}

func (suite *SiteTestSuite) TestAddSite() {
	site := model.Site{
		Name:        "name",
		Title:       "title",
		Description: "desc",
		Lat:         -92.34,
		Long:        29.393,
	}

	err := suite.data.AddSite(&site)

	suite.Assert().NoError(err, "Failed adding site")
}

func (suite *SiteTestSuite) TestGetSite() {
	site := model.Site{
		Name:        "name",
		Title:       "title",
		Description: "desc",
		Lat:         -92.34,
		Long:        29.393,
	}

	suite.data.AddSite(&site)

	getSite, err := suite.data.GetSite(site.Name)

	suite.Assert().NoError(err, "Failed getting site")

	suite.Equal(site.Name, getSite.Name)
	suite.Equal(site.Title, getSite.Title)
	suite.Equal(site.Description, getSite.Description)
	suite.Equal(site.Lat, getSite.Lat)
	suite.Equal(site.Long, getSite.Long)
}

func (suite *SiteTestSuite) TestUpdateSite() {
	site := model.Site{
		Name:        "name",
		Title:       "title",
		Description: "desc",
		Lat:         -92.34,
		Long:        29.393,
	}

	suite.data.AddSite(&site)

	site.Title = "New Title"

	err := suite.data.UpdateSite(&site)
	getSite, err2 := suite.data.GetSite(site.Name)

	suite.Assert().NoError(err, "Failed updating site")
	suite.Assert().NoError(err2, "Failed getting site")

	suite.Equal(site.Name, getSite.Name)
	suite.Equal(site.Title, getSite.Title)
	suite.Equal(site.Description, getSite.Description)
	suite.Equal(site.Lat, getSite.Lat)
	suite.Equal(site.Long, getSite.Long)
}

func TestSites(t *testing.T) {
	suite.Run(t, new(SiteTestSuite))
}
