package main

import (
	"net/http"
	"strconv"

	"wanderinglunch/model"

	"github.com/labstack/echo"
	"github.com/zenazn/goji/web"
)

/**
 * @api {get} /trucks List Trucks
 * @apiName GetTrucks
 * @apiDescription To get an array of all the trucks in the database
 * @apiVersion 1.0.0
 * @apiGroup Trucks
 * @apiParam {Number} [updated_since] hours since last update
 * @apiParam {String="lat","name"} [sort=name] What to sort by
 * @apiParam {String="desc","asc"} [sort_dir=asc] The direction to sort
 * @apiParam {Number} [location_id] Only get trucks that are at this location id
 * @apiExample {GET} Example usage:
 *     http://api.wanderinglunch.com/trucks?updated_since=8&sort=lat&sort_dir=desc
 * @apiSuccessExample {json} Success-Response:
 * [
 *  {
 *   "id": "andysitalianice",
 *   "name": "Andy's Italian Ice",
 *   "twitname": "andysitalianice",
 *   "weburl": null,
 *   "retweeted": false,
 *   "lasttweet": null,
 *   "lastupdate": 1437084911,
 *   "updated": "36 days ago",
 *   "type": "",
 *   "about": null,
 *   "foursquare": null,
 *   "location": "Union Sq",
 *   "loc": null,
 *   "zone": "Manhatten",
 *   "image": "/iRvxK7ohXIwK9Ib6wkVgtR46VKRLsamXuElhEtOlNKc.jpg",
 *   "matcher": null,
 *   "matchmethod": null,
 *   "tweets": null,
 *   "images": null
 *  }
 * ]
 */
func trucks(c *echo.Context) error {
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

	s := c.Query("sort")
	sort := "name"
	if s != "" {
		if s == "name" || s == "lat" {
			sort = s
		} else {
			ae.Errors = append(ae.Errors, apiError{Message: "Invalid sort"})
		}
	}

	d := c.Query("sort_dir")
	dir := "asc"
	if d != "" {
		if d == "asc" || d == "desc" {
			dir = d
		} else {
			ae.Errors = append(ae.Errors, apiError{Message: "Invalid sort direction"})
		}
	}

	l := c.Query("location_id")
	loc := 0
	if l != "" {
		var err error
		loc, err = strconv.Atoi(l)
		if err != nil {
			ae.Errors = append(ae.Errors, apiError{Message: "Location id is not an int"})
		}
	}

	if len(ae.Errors) > 0 {
		c.JSON(http.StatusBadRequest, ae)
		return nil //Not sure why ae doesn't work
	}
	c.JSON(http.StatusOK, model.Trucks(hours, sort, dir, loc))
	return nil
}

/**
 * @api {get} /trucks/:id Get Truck
 * @apiName GetTruck
 * @apiDescription Get all data on one truck
 * @apiVersion 1.0.0
 * @apiGroup Trucks
 * @apiExample {GET} Example usage:
 *     http://api.wanderinglunch.com/truck/carpedonut
 * @apiSuccessExample {json} Success-Response:
 * {
 *  "id": "carpedonut",
 *  "name": "Carpe Donut",
 *  "twitname": "carpedonutnyc",
 *  "weburl": "http://carpedonutnyc.com/",
 *  "retweeted": false,
 *  "lasttweet": null,
 *  "lastupdate": 1437044501,
 *  "updated": "37 days ago",
 *  "type": "Sweets",
 *   "about": "They only server one kind of donut here, the apple cider, but it's a pretty good one. They are fresh and still hot when you get them. They have donut ice cream sandwiches but you should know the entire thing is in the freezer so you will get a frozen donut as well.",
 *   "foursquare": "5169892c498e0522481eea97",
 *   "location": "51st & Park",
 *   "loc": 24,
 *   "zone": "Manhatten",
 *   "image": null,
 *   "matcher": null,
 *   "matchmethod": null,
 *   "tweets": [
 *     {
 *       "contents": "Truck open at 51st street and Park avenue. Come!!!",
 *       "time": "1437044501",
 *       "id": "621635811478532096",
 *       "retweeted": false,
 *       "twitname": ""
 *     },
 *     {
 *       "contents": "Truck open at 23rd street and Park avenue south. Come!!!!",
 *       "time": "1436958801",
 *       "id": "621276358266724352",
 *       "retweeted": false,
 *       "twitname": ""
 *     },
 *   ],
 *   "images": [
 *     {
 *       "id": "5199097e498ea36447e54093",
 *       "suffix": "/40899881_hbjUdavpBfT-sLaBhv3pbZydT1tgs9v-Maw12j9I3Xs.jpg",
 *       "visibility": "public",
 *       "Twitname": "carpedonutnyc",
 *       "menu": false
 *     },
 *     {
 *       "id": "520f87b511d2e753e7955853",
 *       "suffix": "/44_gUd2HlRFt-yMUFcOdI_EUCdz5NK86hKk-3kHwZhHou0.jpg",
 *       "visibility": "public",
 *       "Twitname": "carpedonutnyc",
 *       "menu": false
 *     }
 *   ]
 *  }
 */
func truckById(c web.C, w http.ResponseWriter, r *http.Request) {
	var ae apiErrors
	truck := model.GetTruck(c.URLParams["id"])
	if truck.ID == "" {
		ae.Errors = append(ae.Errors, apiError{Message: "No truck with that id found"})
		renderer.JSON(w, http.StatusNotFound, ae)
		return
	}
	renderer.JSON(w, http.StatusOK, truck)
}

/**
 * @api {post} /trucks/:id Add a new Truck
 * @apiName CreateTruck
 * @apiDescription Update values on an already existing truck
 * @apiVersion 1.0.0
 * @apiGroup Trucks
 * @apiUse Truck
 */
func truckInsert(c web.C, w http.ResponseWriter, r *http.Request) {
	err := r.ParseForm()
	if err != nil {
		renderer.JSON(w, http.StatusInternalServerError, nil)
	}
	t := model.TruckMarshal(r.Form)

	truck, err := model.AddTruck(t)
	if err != nil {
		var ae apiErrors
		ae.Errors = append(ae.Errors, apiError{Message: err.Error()})
		renderer.JSON(w, http.StatusBadRequest, ae)
		return
	}
	renderer.JSON(w, http.StatusOK, truck)
}

/**
 * @api {put} /trucks/:id Update a Truck
 * @apiName UpdateTruck
 * @apiUse Truck
 * @apiDescription Save a new truck
 * @apiVersion 1.0.0
 * @apiGroup Trucks
 */
func truckUpdate(c web.C, w http.ResponseWriter, r *http.Request) {
	err := r.ParseForm()
	if err != nil {
		renderer.JSON(w, http.StatusInternalServerError, nil)
		return
	}
	t := model.TruckMarshal(r.Form)

	if model.UpdateTruck(t) {
		renderer.JSON(w, http.StatusOK, model.GetTruck(t.ID))
		return
	}
	renderer.JSON(w, http.StatusInternalServerError, nil)
}

/**
 * @api {delete} /trucks/:id Delete a Truck
 * @apiName DeleteTruck
 * @apiParam {String} id The id of the truck
 * @apiDescription Deletes a truck permanently
 * @apiVersion 1.0.0
 * @apiGroup Trucks
 */
func truckDelete(c web.C, w http.ResponseWriter, r *http.Request) {
	if model.DeleteTruck(c.URLParams["id"]) {
		renderer.JSON(w, http.StatusNoContent, nil)
		return
	}
	renderer.JSON(w, http.StatusInternalServerError, nil)
}

/**
 * @api {get} /trucks/failures Failed To Update
 * @apiGroup Trucks
 * @apiDescription Trucks that have tweeted today but an address was not matched in any of the tweets
 * @apiVersion 1.0.0
 * @apiName GetFailedTrucks
 */
func failures(c web.C, w http.ResponseWriter, r *http.Request) {
	renderer.JSON(w, http.StatusOK, model.GetFailedUpdates())
}

/**
 * @api {get} /trucks/:id/tweets Get truck tweets
 * @apiName GetTrucksTweets
 * @apiDescription Get all the tweets for this truck
 * @apiParam {String} id Truck id
 * @apiParam {Number=0,1} [with_subs=0] Perform substitutions on all tweets
 * @apiParam {Number=0,1} [pretty_time=1] Convert the time from Unix to a readable date
 * @apiParam {Number=0,1} [parsed=0] Parse html strings into links
 * @apiVersion 1.0.0
 * @apiGroup Trucks
 * @apiExample {GET} Example usage:
 *     http://api.wanderinglunch.com/trucks/mtblls/tweets?with_subs=1
 * @apiSuccessExample {json} Success-Response:
 * [
 *  {
 *    "contents": "Well it's Friday Mtbll Lovers Another beauty    The  is stopped & 50th bet 6&7 Aves  Come on by for your    http: &  & t co & O7T3RX1Rk1",
 *    "time": "1437145380",
 *    "id": "622058928709439488",
 *    "retweeted": false,
 *    "twitname": "mtblls"
 *  },
 *  {
 *    "contents": "Good Thursday Y'all  Looks to be a nice one today whew   The Mtbll  is stopped & 50th bet 6&7 come get out    http: &  & t co & 7dxAP2yewr",
 *    "time": "1437057668",
 *    "id": "621691039414386689",
 *    "retweeted": false,
 *    "twitname": "mtblls"
 *  }
 * ]
 */

func truckTweets(c web.C, w http.ResponseWriter, r *http.Request) {
	var ae apiErrors

	ws := r.FormValue("with_subs")
	withSubs := false
	if ws != "" {
		var err error
		withSubs, err = strconv.ParseBool(ws)
		if err != nil {
			ae.Errors = append(ae.Errors, apiError{Message: "with_subs is not valid"})
		}
	}

	pt := r.FormValue("pretty_time")
	prettyTime := true
	if pt != "" {
		var err error
		prettyTime, err = strconv.ParseBool(pt)
		if err != nil {
			ae.Errors = append(ae.Errors, apiError{Message: "pretty_time is not valid"})
		}
	}

	p := r.FormValue("parsed")
	parsed := false
	if p != "" {
		var err error
		parsed, err = strconv.ParseBool(p)
		if err != nil {
			ae.Errors = append(ae.Errors, apiError{Message: "parsed is not valid"})
		}
	}

	truck := model.GetTruck(c.URLParams["id"])
	if truck.ID == "" {
		ae.Errors = append(ae.Errors, apiError{Message: "No truck with that id found"})
		renderer.JSON(w, http.StatusNotFound, ae)
		return
	}

	if len(ae.Errors) > 0 {
		renderer.JSON(w, http.StatusBadRequest, ae)
		return
	}
	renderer.JSON(w, http.StatusOK, model.GetTweets(truck.Twitname, withSubs, prettyTime, parsed))
}
