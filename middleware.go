package main

import (
	"fmt"
	"net/http"

	"github.com/zenazn/goji/web"
)

func Secure(c *web.C, h http.Handler) http.Handler {
	fn := func(w http.ResponseWriter, r *http.Request) {
		s := Sessions.GetSessionObject(c)
		fmt.Println(s)
		if s["user"] == nil {
			http.Redirect(w, r, "/login", 302)
			return
		}
		h.ServeHTTP(w, r)
	}
	return http.HandlerFunc(fn)
}
