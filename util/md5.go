package util

import (
	"crypto/md5"
	"encoding/hex"
	"fmt"
	"io/ioutil"
	"os"
)

func Md5File(file string) string {
	//if object, found := Cache.Get("statics-" + file); found {
	//		return object.(string)
	//} else {
	wd, err := os.Getwd()
	static, err := ioutil.ReadFile(wd + file)
	if err != nil {
		fmt.Println("opening static file", err.Error())
	}
	md5 := md5.Sum(static)
	md5String := hex.EncodeToString(md5[:])
	//	Cache.Set("statics-"+file, md5String, cache.DefaultExpiration)
	return md5String
	//}
}
