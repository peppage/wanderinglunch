package endpoints

import (
	"net/http"
	"strconv"
	"wanderinglunch/model"

	"github.com/labstack/echo"
)

func Trucks(c *echo.Context) error {
	//var ae apiErrors

	site := c.Query("site")
	if site == "" {
		//ae.Errors = append(ae.Errors, apiError{Message: "Site is required"})
	}

	h := c.Query("updated_since")
	hours := 500000
	if h != "" {
		var err error
		hours, err = strconv.Atoi(h)
		if err != nil {
			//ae.Errors = append(ae.Errors, apiError{Message: "Hours is not an int"})
		}
	}

	s := c.Query("sort")
	sort := "name"
	if s != "" {
		if s == "name" || s == "lat" {
			sort = s
		} else {
			//ae.Errors = append(ae.Errors, apiError{Message: "Invalid sort"})
		}
	}

	d := c.Query("sort_dir")
	dir := "asc"
	if d != "" {
		if d == "asc" || d == "desc" {
			dir = d
		} else {
			//ae.Errors = append(ae.Errors, apiError{Message: "Invalid sort direction"})
		}
	}

	l := c.Query("location_id")
	loc := 0
	if l != "" {
		var err error
		loc, err = strconv.Atoi(l)
		if err != nil {
			//ae.Errors = append(ae.Errors, apiError{Message: "Location id is not an int"})
		}
	}

	//if len(ae.Errors) > 0 {
	//		return c.JSON(http.StatusBadRequest, ae)
	//}
	return c.JSON(http.StatusOK, model.Trucks(site, hours, sort, dir, loc))
}
