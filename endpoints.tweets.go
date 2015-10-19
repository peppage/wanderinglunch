package main

import (
	"net/http"
	"strconv"

	"wanderinglunch/model"

	"github.com/zenazn/goji/web"
)

/**
 * @api {get} /tweets/:id Get Tweet
 * @apiName GetTweet
 * @apiParam {Number} id Id of the tweet
 * @apiParam {Number=0,1} [with_subs=0] Use substitutions on tweet
 * @apiParam {Number=0,1} [pretty_time=1] Convert the time from Unix to a readable date
 * @apiParam {Number=0,1} [parsed=0] Parse html strings into links
 * @apiVersion 1.0.0
 * @apiGroup Tweets
 * @apiExample {GET} Example usage:
 *     http://api.wanderinglunch.com/tweets/622058928709439488
 * @apiSuccessExample {json} Success-Response:
 * {
 *  "contents": "Well it's Friday Mtbll Lovers! Another beauty .  The  is stopped at 50th bet 6&7 Aves. Come on by for your... http://t.co/O7T3RX1Rk1",
 *  "time": "1437145380",
 *  "id": "622058928709439488",
 *  "retweeted": false,
 *  "twitname": "mtblls"
 * }
 */
func tweetById(c web.C, w http.ResponseWriter, r *http.Request) {
	var ae apiErrors
	id, err := strconv.Atoi(c.URLParams["id"])
	if err != nil {
		ae.Errors = append(ae.Errors, apiError{Message: "Invalid tweet id"})
	}

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

	if len(ae.Errors) > 0 {
		renderer.JSON(w, http.StatusNotFound, ae)
		return
	}

	tweet := model.GetTweet(id, withSubs, prettyTime, parsed)
	if tweet.ID == "" {
		ae.Errors = append(ae.Errors, apiError{Message: "No tweet with that id found"})
		renderer.JSON(w, http.StatusNotFound, ae)
		return
	}
	renderer.JSON(w, http.StatusOK, tweet)
}
