package main

import (
	"io"
	"io/ioutil"
	"net/http"
)

func adminIndex(w http.ResponseWriter, r *http.Request) {
	c := pageContext{
		Version: Version,
	}

	template, _ := View.GetTemplate("admin/index.jet")
	if err := template.Execute(w, nil, c); err != nil {
		panic(err)
	}

	io.Copy(ioutil.Discard, r.Body)
	defer r.Body.Close()
}
