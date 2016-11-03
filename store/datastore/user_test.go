package datastore

import (
	"testing"
	"wanderinglunch/store"

	"github.com/jmoiron/sqlx"
	"github.com/stretchr/testify/suite"
)

type UserTestSuite struct {
	suite.Suite
	data store.Store
	db   *sqlx.DB
}

func (suite *UserTestSuite) SetupSuite() {
	suite.db = open("pgx", "postgres://mca@localhost:5432/wandering_test")
	suite.data = From(suite.db)
}

func (suite *UserTestSuite) TearDownSuite() {
	suite.db.Close()
}

func (suite *UserTestSuite) SetupTest() {
	suite.db.Exec("DELETE FROM users")
}

func (suite *UserTestSuite) TestGetUser() {
	email := "p@p.com"
	password := "password"
	admin := true

	suite.db.Exec("INSERT INTO users (email, password, admin) VALUES ($1, $2, $3)", email, password, admin)

	u, err := suite.data.GetUser("p@p.com")

	suite.Assert().NoError(err, "Failed getting user")
	suite.Equal(email, u.Email)
	suite.Equal(password, u.Password)
	suite.Equal(admin, u.Admin)
}

func TestUsers(t *testing.T) {
	suite.Run(t, new(UserTestSuite))
}
