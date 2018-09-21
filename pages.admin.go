package main

import (
	"context"
	"net/http"
	"strconv"
)

func adminIndex(w http.ResponseWriter, r *http.Request) {
	c := pageContext{
		Version: Version,
	}

	template, _ := View.GetTemplate("admin/index.jet")
	if err := template.Execute(w, nil, c); err != nil {
		panic(err)
	}
}

func adminAddTruck(w http.ResponseWriter, r *http.Request) {
	c := pageContext{
		Version: Version,
	}

	template, _ := View.GetTemplate("admin/truck.jet")
	if err := template.Execute(w, nil, c); err != nil {
		panic(err)
	}
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
}

func adminAddSub(w http.ResponseWriter, r *http.Request) {
	c := pageContext{
		Version: Version,
	}

	template, _ := View.GetTemplate("admin/sub.jet")
	if err := template.Execute(w, nil, c); err != nil {
		panic(err)
	}
}

func adminAddSubHandle(w http.ResponseWriter, r *http.Request) {
	req, err := parseSubRequest(r)
	if err != nil {
		*r = *r.WithContext(context.WithValue(r.Context(), statusKey, http.StatusBadRequest))
		return
	}

	sub, err := saveSub(req)
	if err != nil {
		*r = *r.WithContext(context.WithValue(r.Context(), statusKey, http.StatusInternalServerError))
		return
	}

	id := strconv.FormatInt(sub.ID, 10)

	http.Redirect(w, r, "/admin/sub/"+id, http.StatusSeeOther)
}
