package main

import (
	"io"
	"io/ioutil"
	"net/http"
)

func adminIndex(w http.ResponseWriter, r *http.Request) {
	io.Copy(ioutil.Discard, r.Body)
	defer r.Body.Close()
}
