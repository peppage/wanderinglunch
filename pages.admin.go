package main

import (
	"context"
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

func adminAddTruck(w http.ResponseWriter, r *http.Request) {
	c := pageContext{
		Version: Version,
	}

	template, _ := View.GetTemplate("admin/truck.jet")
	if err := template.Execute(w, nil, c); err != nil {
		panic(err)
	}

	io.Copy(ioutil.Discard, r.Body)
	defer r.Body.Close()
}

func adminAddTruckHandle(w http.ResponseWriter, r *http.Request) {
	req, err := parseTruckRequest(r)
	if err != nil {
		*r = *r.WithContext(context.WithValue(r.Context(), statusKey, http.StatusBadRequest))
		return
	}

	err = saveTruck(req)
	if err != nil {
		*r = *r.WithContext(context.WithValue(r.Context(), statusKey, http.StatusInternalServerError))
		return
	}

	http.Redirect(w, r, "/admin/truck/"+req.Twitter, http.StatusSeeOther)
	io.Copy(ioutil.Discard, r.Body)
	defer r.Body.Close()
}
