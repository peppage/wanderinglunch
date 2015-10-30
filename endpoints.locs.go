package main

import (
	"net/http"
	"strconv"

	"wanderinglunch/model"

	"github.com/labstack/echo"
)

/**
 * @api {get} /locations List Locations
 * @apiName GetLocations
 * @apiDescription To get an array of all the locations in the database
 * @apiVersion 1.0.0
 * @apiGroup Locations
 * @apiExample {GET} Example usage:
 *     http://api.wanderinglunch.com/locations
 * @apiSuccessExample {json} Success-Response:
 * [
 *  {
 *    "id": 1,
 *    "display": "20th & 5th",
 *    "matcher": "(5(th|ave)?|20(th)?) & (5th|20(th)?)",
 *    "lat": "40.739680",
 *    "long": "-73.990847",
 *    "zone": "Manhatten",
 *    "site": "nyc"
 *  },
 *  {
 *    "id": 2,
 *    "display": "26th between 11th & 12th",
 *    "matcher": "26th between 11th & 12th",
 *    "lat": "40.751356",
 *    "long": "-74.006822",
 *    "zone": "Manhatten",
 *    "site": "nyc"
 *  }
 * ]
 */
func locations(c *echo.Context) error {
	return c.JSON(http.StatusOK, model.GetLocations())
}

/**
* @api {get} /location/:id Get Location
* @apiName GetLocation
* @apiDescription Get a location by id
* @apiVersion 1.0.0
 * @apiGroup Locations
* @apiExample {GET} Example usage:
*     http://api.wanderinglunch.com/location/1
* @apiSuccessExample {json} Success-Response:
*  {
*    "id": 1,
*    "display": "20th & 5th",
*    "matcher": "(5(th|ave)?|20(th)?) & (5th|20(th)?)",
*    "lat": "40.739680",
*    "long": "-73.990847",
*    "zone": "Manhatten",
*    "site": "nyc"
*  }
*/
func location(c *echo.Context) error {
	loc := model.GetLocation(c.Param("id"))
	if loc.ID == 0 {
		return c.JSON(http.StatusNotFound, nil)
	}
	return c.JSON(http.StatusOK, loc)
}

/**
 * @api {post} /locations Create a new location
 * @apiName NewLocation
 * @apiDescription Save a new location
 * @apiVersion 1.0.0
 * @apiUse Location
 * @apiGroup Locations
 */
func locationInsert(c *echo.Context) error {
	l := model.LocationMarshal(c)
	err := model.AddLocation(l)
	if err != nil {
		var ae apiErrors
		ae.Errors = append(ae.Errors, apiError{Message: err.Error()})
		return c.JSON(http.StatusBadRequest, ae)
	}
	return c.JSON(http.StatusOK, model.GetLocationByDisplay(l.Display))
}

/**
 * @api {delete} /locations/:id Delete a location
 * @apiName DeleteLocation
 * @apiVersion 1.0.0
 * @apiParam {Number} id Id of the location to delete
 * @apiGroup Locations
 */
func locationDelete(c *echo.Context) error {
	if model.DeleteLocation(c.Param("id")) != nil {
		return c.JSON(http.StatusNoContent, nil)
	}
	return c.JSON(http.StatusInternalServerError, nil)
}

/**
 * @api {put} /locations/:id Update a location
 * @apiName UpdateLocation
 * @apiDescription Update a location
 * @apiVersion 1.0.0
 * @apiParam {Number} id Id of the location to update
 * @apiUse Location
 * @apiGroup Locations
 */
func locationUpdate(c *echo.Context) error {
	l := model.LocationMarshal(c)
	l.ID, _ = strconv.Atoi(c.Param("id"))
	err := model.UpdateLocation(l)
	if err != nil {
		var ae apiErrors
		ae.Errors = append(ae.Errors, apiError{Message: err.Error()})
		return c.JSON(http.StatusBadRequest, ae)
	}
	return c.JSON(http.StatusOK, model.GetLocation(c.Param("id")))
}
