package datastore

import (
	"testing"
	"wanderinglunch/model"

	"github.com/franela/goblin"
)

func TestImages(t *testing.T) {
	db := open("pgx", "postgres://mca@localhost:5432/wandering_test")
	defer db.Close()

	s := From(db)
	g := goblin.Goblin(t)
	g.Describe("Image datastore", func() {
		g.BeforeEach(func() {
			db.Exec("DELETE FROM images")
		})

		g.It("Should create an image", func() {
			image := model.Image{
				ID:       "id",
				Suffix:   "suffix",
				Twitname: "twitname",
				Menu:     false,
			}

			err := s.AddImage(&image)

			g.Assert(err == nil).IsTrue()
		})

		g.It("Should get an image", func() {
			image := model.Image{
				ID:       "id",
				Suffix:   "suffix",
				Twitname: "twitname",
				Menu:     false,
			}

			s.AddImage(&image)

			getImage, err := s.GetImage("id")

			g.Assert(err == nil).IsTrue()
			g.Assert(image.ID == getImage.ID)
			g.Assert(image.Suffix == getImage.Suffix)
			g.Assert(image.Twitname == getImage.Twitname)
			g.Assert(image.Menu == getImage.Menu)
		})

		g.It("Should update an image", func() {
			image := model.Image{
				ID:       "id",
				Suffix:   "suffix",
				Twitname: "twitname",
				Menu:     false,
			}

			s.AddImage(&image)

			image.Menu = true

			err := s.UpdateImage(&image)

			getImage, err2 := s.GetImage(image.ID)

			g.Assert(err == nil).IsTrue()
			g.Assert(err2 == nil).IsTrue()
			g.Assert(image.ID == getImage.ID)
			g.Assert(image.Suffix == getImage.Suffix)
			g.Assert(image.Twitname == getImage.Twitname)
			g.Assert(image.Menu == getImage.Menu)
		})

		g.It("Should get images", func() {
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

			s.AddImage(&image1)
			s.AddImage(&image2)

			images, err := s.GetImages(twitname)

			g.Assert(err == nil).IsTrue()
			g.Assert(len(images) == 2).IsTrue()
		})
	})
}
