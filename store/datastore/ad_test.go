package datastore

import (
	"testing"
	"time"
	"wanderinglunch/model"

	"github.com/franela/goblin"
)

func TestAds(t *testing.T) {
	db := open("pgx", "postgres://mca@localhost:5432/wandering_test")
	defer db.Close()

	s := From(db)
	g := goblin.Goblin(t)
	g.Describe("Ad datastore", func() {
		g.BeforeEach(func() {
			db.Exec("DELETE FROM ads")
		})

		g.It("Should create ad", func() {
			ad := model.Ad{
				Name:       "name",
				Value:      "value",
				ValidUntil: 1,
				Views:      0,
				Site:       "nyc",
			}

			err := s.AddAd(&ad)
			g.Assert(err == nil).IsTrue()
		})

		g.It("Should get ad", func() {
			ad := model.Ad{
				Name:       "name",
				Value:      "value",
				ValidUntil: 1,
				Views:      0,
				Site:       "nyc",
			}

			s.AddAd(&ad)

			getAd, err := s.GetAd(ad.ID)

			g.Assert(err == nil).IsTrue()
			g.Assert(ad.ID == getAd.ID).IsTrue()
			g.Assert(ad.Value == getAd.Value).IsTrue()
			g.Assert(ad.ValidUntil == getAd.ValidUntil).IsTrue()
			g.Assert(ad.Site == getAd.Site).IsTrue()
			g.Assert(ad.Views == getAd.Views).IsTrue()
		})

		g.It("Should get ads", func() {
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

			s.AddAd(&ad1)
			s.AddAd(&ad2)

			ads, err := s.GetAds()
			g.Assert(err == nil).IsTrue()
			g.Assert(len(ads) == 2).IsTrue()
		})

		g.It("Should get ads for a site", func() {
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

			s.AddAd(&ad1)
			s.AddAd(&ad2)

			ads, err := s.GetAdsForSite("nyc")
			g.Assert(err == nil).IsTrue()
			g.Assert(len(ads) == 1).IsTrue()
		})

		g.It("Should add a view to an ad", func() {
			ad := model.Ad{
				Name:       "name",
				Value:      "value",
				ValidUntil: 1,
				Site:       "dc",
			}

			s.AddAd(&ad)

			err := s.AdsAddView(ad.ID)
			getAd, err2 := s.GetAd(ad.ID)

			g.Assert(err == nil).IsTrue()
			g.Assert(err2 == nil).IsTrue()
			g.Assert(getAd.Views != ad.Views).IsTrue()
			g.Assert(getAd.Views == 1).IsTrue()
		})

		g.It("Should delete an ad", func() {
			ad := model.Ad{
				Name:       "name",
				Value:      "value",
				ValidUntil: 1,
				Site:       "nyc",
			}

			s.AddAd(&ad)
			err := s.DeleteAd(ad.ID)
			_, err2 := s.GetAd(ad.ID)

			g.Assert(err == nil).IsTrue()
			g.Assert(err2 == nil).IsFalse()
		})

		g.It("Should update an ad", func() {
			ad := model.Ad{
				Name:       "name",
				Value:      "value",
				ValidUntil: 1,
				Site:       "nyc",
			}

			s.AddAd(&ad)

			ad.Name = "New name"

			err := s.UpdateAd(&ad)

			getAd, err2 := s.GetAd(ad.ID)

			g.Assert(err == nil).IsTrue()
			g.Assert(err2 == nil).IsTrue()

			g.Assert(ad.Name == getAd.Name)
			g.Assert(ad.Value == getAd.Value)
			g.Assert(ad.ValidUntil == getAd.ValidUntil)
			g.Assert(ad.Site == getAd.Site)
			g.Assert(ad.Views == getAd.Views)
		})
	})
}
