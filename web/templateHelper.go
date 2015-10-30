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
	var ads []*model.Ad
	site := "nyc"
	if object, found := Cache.Get("ads-" + shape + "-" + site); found {
		ads = object.([]*model.Ad)
	} else {
		ads = model.GetActiveAds(shape, site)
		Cache.Set("ads-"+shape+"-"+site, ads, time.Hour)
	}

	// Cycle through the ads
	adLoc = adLoc + 1
	if adLoc > len(ads)-1 {
		adLoc = 0
	}
	if !strings.Contains(ads[adLoc].Name, "google") {
		go model.AdsAddView(ads[adLoc].ID)
	}
	return ads[adLoc].Value
}
