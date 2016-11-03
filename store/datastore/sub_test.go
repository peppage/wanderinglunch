package datastore

import (
	"testing"
	"wanderinglunch/model"
	"wanderinglunch/store"

	"github.com/jmoiron/sqlx"
	"github.com/stretchr/testify/suite"
)

type SubTestSuite struct {
	suite.Suite
	data store.Store
	db   *sqlx.DB
}

func (suite *SubTestSuite) SetupSuite() {
	suite.db = open("pgx", "postgres://mca@localhost:5432/wandering_test")
	suite.data = From(suite.db)
}

func (suite *SubTestSuite) TearDownSuite() {
	suite.db.Close()
}

func (suite *SubTestSuite) SetupTest() {
	suite.db.Exec("DELETE FROM subs")
}

func (suite *SubTestSuite) TestAddSub() {
	sub := model.Sub{
		Regex:       "regex",
		Replacement: "replace",
	}

	err := suite.data.AddSub(&sub)

	suite.Assert().NoError(err, "Failed adding sub")
}

func (suite *SubTestSuite) TestGetSub() {
	sub := model.Sub{
		Regex:       "regex",
		Replacement: "replace",
	}

	suite.data.AddSub(&sub)

	getSub, err := suite.data.GetSub(sub.ID)

	suite.Assert().NoError(err, "Failed getting sub")
	suite.Equal(sub.Regex, getSub.Regex)
	suite.Equal(sub.Replacement, getSub.Replacement)
}

func (suite *SubTestSuite) TestUpdateSub() {
	sub := model.Sub{
		Regex:       "regex",
		Replacement: "replace",
	}

	suite.data.AddSub(&sub)

	sub.Regex = "diff*regex"

	err := suite.data.UpdateSub(&sub)

	getSub, err2 := suite.data.GetSub(sub.ID)

	suite.Assert().NoError(err, "failed updating sub")
	suite.Assert().NoError(err2, "faield getting sub after update")
	suite.Equal(sub.Regex, getSub.Regex)
	suite.Equal(sub.Replacement, getSub.Replacement)
}

func (suite *SubTestSuite) TestGetSubs() {
	sub1 := model.Sub{
		Regex:       "regex",
		Replacement: "replace",
	}

	sub2 := model.Sub{
		Regex:       "regex2",
		Replacement: "replace2",
	}

	suite.data.AddSub(&sub1)
	suite.data.AddSub(&sub2)

	subs, err := suite.data.GetSubs()

	suite.Assert().NoError(err, "failed getting subs")
	suite.Equal(len(subs), 2)
}

func TestSubs(t *testing.T) {
	suite.Run(t, new(SubTestSuite))
}
