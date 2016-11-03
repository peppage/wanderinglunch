package datastore

import (
	"testing"
	"wanderinglunch/model"
	"wanderinglunch/store"

	"github.com/jmoiron/sqlx"
	"github.com/stretchr/testify/suite"
)

type ImageTestSuite struct {
	suite.Suite
	data store.Store
	db   *sqlx.DB
}

func (suite *ImageTestSuite) SetupSuite() {
	suite.db = open("pgx", "postgres://mca@localhost:5432/wandering_test")
	suite.data = From(suite.db)
}

func (suite *ImageTestSuite) TearDownSuite() {
	suite.db.Close()
}

func (suite *ImageTestSuite) SetupTest() {
	suite.db.Exec("DELETE FROM images")
}

func (suite *ImageTestSuite) TestCreateImage() {
	image := model.Image{
		ID:       "id",
		Suffix:   "suffix",
		Twitname: "twitname",
		Menu:     false,
	}

	err := suite.data.AddImage(&image)

	suite.Assert().NoError(err, "Failed adding image")
}

func (suite *ImageTestSuite) TestGetImage() {
	image := model.Image{
		ID:       "id",
		Suffix:   "suffix",
		Twitname: "twitname",
		Menu:     false,
	}

	suite.data.AddImage(&image)

	getImage, err := suite.data.GetImage("id")

	suite.Assert().NoError(err, "Failed getting Image")
	suite.Equal(image.ID, getImage.ID)
	suite.Equal(image.Suffix, getImage.Suffix)
	suite.Equal(image.Twitname, getImage.Twitname)
	suite.Equal(image.Menu, getImage.Menu)
}

func (suite *ImageTestSuite) TestUpdateImage() {
	image := model.Image{
		ID:       "id",
		Suffix:   "suffix",
		Twitname: "twitname",
		Menu:     false,
	}

	suite.data.AddImage(&image)

	image.Menu = true

	err := suite.data.UpdateImage(&image)

	getImage, err2 := suite.data.GetImage(image.ID)

	suite.Assert().NoError(err, "Failed update image")
	suite.Assert().NoError(err2, "failed getting image")
	suite.Equal(image.ID, getImage.ID)
	suite.Equal(image.Suffix, getImage.Suffix)
	suite.Equal(image.Twitname, getImage.Twitname)
	suite.Equal(image.Menu, getImage.Menu)
}

func (suite *ImageTestSuite) TestGetImages() {
	twitname := "twitname"
	image1 := model.Image{
		ID:       "id1",
		Suffix:   "suffix1",
		Twitname: twitname,
		Menu:     false,
	}

	image2 := model.Image{
		ID:       "id2",
		Suffix:   "suffix2",
		Twitname: twitname,
		Menu:     false,
	}

	suite.data.AddImage(&image1)
	suite.data.AddImage(&image2)

	images, err := suite.data.GetImages(twitname)

	suite.Assert().NoError(err, "failed getting images")
	suite.Equal(len(images), 2)
}

func TestImages(t *testing.T) {
	suite.Run(t, new(ImageTestSuite))
}
