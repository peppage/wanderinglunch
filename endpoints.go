package main

import (
	"net/http"
	"strconv"
	"time"

	"wanderinglunch/model"

	"github.com/labstack/echo"
)

/**
 * @api {get} /markers List Map Markers
 * @apiName GetTrucks
 * @apiDescription Points on a map
 * @apiGroup Markers
 * @apiVersion 1.0.0
 * @apiParam {Number} [updated_since] hours since last update
 * @apiExample {GET} Example usage:
 *     http://api.wanderinglunch.com/markers?updated_since=8
 * @apiSuccessExample {json} Success-Response:
 * [
 *   {
 *    "Id": "valduccis",
 *    "Name": "Valduccis",
 *    "Lat": "40.757830",
 *    "Long": "-73.973477",
 *    "Display": "51st & Park"
 *  },
 *  {
 *    "Id": "wafelKastaar",
 *    "Name": "Wafels & Dinges Kastaar",
 *    "Lat": "40.750853",
 *    "Long": "-73.978594",
 *    "Display": "40th & Park"
 *  },
 *  {
 *    "Id": "gorilla1",
 *    "Name": "Gorilla Cheese 1",
 *    "Lat": "40.756625",
 *    "Long": "-73.980321",
 *    "Display": "46th between 5th & 6th"
 *  }
 * ]
 */
func markers(c *echo.Context) error {
	var ae apiErrors
	h := c.Query("updated_since")
	hours := 500000
	if h != "" {
		var err error
		hours, err = strconv.Atoi(h)
		if err != nil {
			ae.Errors = append(ae.Errors, apiError{Message: "Hours is not an int"})
		}
	}

	if len(ae.Errors) > 0 {
		return c.JSON(http.StatusBadRequest, ae)
	}

	return c.JSON(http.StatusOK, model.Markers(hours))
}

/**
 * @api {get} /zones Get zones
 * @apiName GetZones
 * @apiDescription Get zones for a site
 * @apiVersion 1.0.0
 * @apiParam {String} site The site to get zones for
 * @apiGroup Locations
 * @apiExample {GET} Example usage:
 * 		htt://wanderinglunch.com/api/zones?site=nyc
 * @apiSuccessExample {json} Success-Response:
 * ["Brooklyn","Manhattan","Jersey City"]
 */
func zones(c *echo.Context) error {
	z := model.Zones(c.Query("site"))
	return c.JSON(http.StatusOK, z)
}

/**
 * @api {get} /images List Images
 * @apiName GetImages
 * @apiParam {String=public,private} [visibility=public] The visibility from foursquare
 * @apiDescription To get an array of all the images in the database
 * @apiVersion 1.0.0
 * @apiGroup Images
 * @apiExample {GET} Example usage:
 *     http://api.wanderinglunch.com/images
 * @apiSuccessExample {json} Success-Response:
 * [
 *  {
 *    "id": "4da8977840a3582fb8c49316",
 *    "suffix": "/MCGIPRA0XR15JNG4O2YZJQBCRMK05UVTC4T14TOQWRTNMQFZ.jpg",
 *    "visibility": "public",
 *    "Twitname": "eddiespizzany",
 *    "menu": false
 *  },
 *  {
 *    "id": "4dcbff9440a3324246c6fb7c",
 *    "suffix": "/YVZPSDS5D1O5DR2NK5IFQKOU0ZNOQTQMTHMRWS3ESLQIQAWK.jpg",
 *    "visibility": "public",
 *    "Twitname": "lobstertruckny",
 *    "menu": true
 *  }
 * ]
 */
func images(c *echo.Context) error {
	var ae apiErrors
	v := c.Query("visibility")
	visibility := "public"
	if v != "" {
		if v == "public" || v == "private" {
			visibility = v
		} else {
			ae.Errors = append(ae.Errors, apiError{Message: "visibility is not valid"})
		}
	}

	if len(ae.Errors) > 0 {
		return c.JSON(http.StatusBadRequest, ae)
	}

	return c.JSON(http.StatusOK, model.GetImages(visibility))
}

/**
 * @api {get} /images/:id Get Image
 * @apiName GetImage
 * @apiDescription Get a image by id
 * @apiVersion 1.0.0
 * @apiGroup Images
 * @apiParam {String} id The foursquare id of the image
 * @apiExample {GET} Example usage:
 *     http://api.wanderinglunch.com/images/4dfa4a9840a3542ff44549df
 * @apiSuccessExample {json} Success-Response:
 * {
 *   "id": "4dfa4a9840a3542ff44549df",
 *   "suffix": "/VBAJNQCBWDMP2WKDXJ5QHQ0WYF1MKHZSLUAZZJXKDBDLDUWG.jpg",
 *   "visibility": "public",
 *   "twitname": "taimmobile",
 *   "menu": false
 * }
 */
func image(c *echo.Context) error {
	i := model.GetImage(c.Param("id"))
	if i.ID == "" {
		return c.JSON(http.StatusNotFound, nil)
	}
	return c.JSON(http.StatusOK, i)
}

/**
 * @api {post} /images Create a new image
 * @apiName NewImage
 * @apiDescription Save a new image
 * @apiVersion 1.0.0
 * @apiUse Image
 * @apiGroup Images
 */
func imageInsert(c *echo.Context) error {
	var i model.Image
	i.ID = c.Form("id")
	i.Suffix = c.Form("suffix")
	i.Twitname = c.Form("twitname")
	i.Menu, _ = strconv.ParseBool(c.Form("menu"))
	if model.AddImage(i) {
		return c.JSON(http.StatusOK, model.GetImage(i.ID))
	}
	return c.JSON(http.StatusInternalServerError, nil)
}

/**
 * @api {put} /images/:id Update a Image
 * @apiName UpdateImage
 * @apiDescription Update a image
 * @apiVersion 1.0.0
 * @apiParam {Number} id Id of the image to update
 * @apiUse Image
 * @apiGroup Images
 */
func imageUpdate(c *echo.Context) error {
	var i model.Image
	i.ID = c.Param("id")
	i.Visibility = c.Form("visibility")
	i.Suffix = c.Form("suffix")
	i.Twitname = c.Form("twitname")
	i.Menu, _ = strconv.ParseBool(c.Form("menu"))
	if model.UpdateImage(i) {
		return c.JSON(http.StatusOK, model.GetImage(c.Param("id")))
	}
	return c.JSON(http.StatusInternalServerError, nil)
}

/**
 * @api {delete} /images/:id Delete a images
 * @apiName DeleteImage
 * @apiVersion 1.0.0
 * @apiParam {Number} id Id of the image to delete
 * @apiGroup Images
 */
func imageDelete(c *echo.Context) error {
	if model.DeleteImage(c.Param("id")) {
		return c.JSON(http.StatusNoContent, nil)
	}
	return c.JSON(http.StatusInternalServerError, nil)
}

/**
 * @api {post} /messages Create new message
 * @apiName SaveMessage
 * @apiVersion 1.0.0
 * @apiGroup Messages
 * @apiParam {String} message The message to store, HTML is OK
 */
func messageSave(c *echo.Context) error {
	var m model.Message
	m.Message = c.Form("message")
	m.Date = time.Now().Unix()
	if model.AddMessage(m) {
		return c.JSON(http.StatusOK, model.GetMessage(1))
	}
	return c.JSON(http.StatusInternalServerError, nil)
}

/**
 * @api {get} /messages List Messages
 * @apiName GetMessage
 * @apiDescription Website updates to display to the user
 * @apiVersion 1.0.0
 * @apiGroup Messages
 * @apiParam {Number} [amount=1] The amount of messages to return
 * @apiUse Message
 * @apiExample {GET} Example usage:
 *     http://api.wanderinglunch.com/messages?amount=1
 * @apiSuccessExample {json} Success-Response:
 * {
 *   "id": 0,
 *   "message": "New trucks added to site!"
 * }
 */
func message(c *echo.Context) error {
	var ae apiErrors
	a := c.Query("amount")
	amount := 1
	if a != "" {
		var err error
		amount, err = strconv.Atoi(a)
		if err != nil {
			ae.Errors = append(ae.Errors, apiError{Message: "Amount is not an int"})
		}
	}

	if len(ae.Errors) > 0 {
		return c.JSON(http.StatusBadRequest, ae)
	}

	return c.JSON(http.StatusOK, model.GetMessage(amount))
}
