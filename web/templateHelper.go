package web

import (
	"crypto/md5"
	"encoding/hex"
	"fmt"
	"io/ioutil"
	"os"
	"strings"
	"time"

	"wanderinglunch/model"

	"github.com/pmylund/go-cache"
)

var Cache = cache.New(1440*time.Minute, 30*time.Second)
var adLoc = 0

type adUnit struct {
	Ads []*model.Ad
	Loc int
}

func Md5File(file string) string {
	if object, found := Cache.Get("statics-" + file); found {
		return object.(string)
	} else {
		wd, err := os.Getwd()
		static, err := ioutil.ReadFile(wd + "/static/" + file)
		if err != nil {
			fmt.Println("opening js file", err.Error())
		}
		md5 := md5.Sum(static)
		md5String := hex.EncodeToString(md5[:])
		Cache.Set("statics-"+file, md5String, cache.DefaultExpiration)
		return md5String
	}
}

func Advert(shape string) string {
	a := &adUnit{Loc: 0}
	site := "nyc"
	if object, found := Cache.Get("ads-" + shape + "-" + site); found {
		a = object.(*adUnit)
	} else {
		ads := model.GetActiveAds(shape, site)
		a.Ads = ads
		Cache.Set("ads-"+shape+"-"+site, a, time.Hour)
	}

	a.Loc = a.Loc + 1
	// Cycle through the ads
	if a.Loc > len(a.Ads)-1 {
		a.Loc = 0
	}
	if !strings.Contains(a.Ads[a.Loc].Name, "google") {
		go model.AdsAddView(a.Ads[a.Loc].ID)
	}

	return a.Ads[a.Loc].Value
}
