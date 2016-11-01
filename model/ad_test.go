package model

import (
	"testing"

	"github.com/franela/goblin"
)

func TestAdStack(t *testing.T) {
	g := goblin.Goblin(t)

	g.Describe("Ad Stack", func() {
		g.It("Should fill a stack", func() {
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

			g.Assert(len(ads) == adStack.Len(site)).IsTrue()
		})

		g.It("Should Get an ad", func() {
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

			g.Assert(err == nil).IsTrue()
			g.Assert(ad.ID == getAd.ID)
			g.Assert(ad.Name == getAd.Name)
			g.Assert(ad.Value == getAd.Value)
			g.Assert(ad.ValidUntil == getAd.ValidUntil)
			g.Assert(ad.Site == getAd.Site)
		})
	})
}
