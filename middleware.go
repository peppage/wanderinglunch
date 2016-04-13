package main

import (
	"net/http"

	"github.com/labstack/echo"
	"github.com/peppage/echo-middleware/session"
)

func secure() echo.MiddlewareFunc {
	return func(next echo.HandlerFunc) echo.HandlerFunc {
		return func(c echo.Context) error {
			session := session.Default(c)
			u := session.Get("user")
			if u == nil {
				return echo.NewHTTPError(http.StatusForbidden, "Permission denied!")
			}
			return next(c)
		}
	}
}
