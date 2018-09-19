package main

import "net/http"

func mustUser(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		user, err := getUser(r)
		if err != nil || user == nil {
			http.Redirect(w, r, "/login", http.StatusSeeOther)
		}

		next.ServeHTTP(w, r)
	})
}
