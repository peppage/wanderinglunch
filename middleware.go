package main

import (
	"net/http"

	"github.com/zenazn/goji/web"
)

func Secure(c *web.C, h http.Handler) http.Handler {
	fn := func(w http.ResponseWriter, r *http.Request) {
		s := Sessions.GetSessionObject(c)
		if s["user"] == nil {
			http.Redirect(w, r, "/login", 302)
			return
		}
		h.ServeHTTP(w, r)
	}
	return http.HandlerFunc(fn)
}

/**
 * I hate this but secure only some API end points based
 * on the type of request it is.
 */
func SecurePost(c *web.C, h http.Handler) http.Handler {
	fn := func(w http.ResponseWriter, r *http.Request) {
		if r.Method == "POST" || r.Method == "DELETE" || r.Method == "PUT" {
			s := Sessions.GetSessionObject(c)
			if s["user"] == nil {
				w.WriteHeader(http.StatusUnauthorized)
				return
			}
		}
		h.ServeHTTP(w, r)
	}
	return http.HandlerFunc(fn)
}
