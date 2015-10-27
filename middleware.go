package main

import (
	"net/http"

	"github.com/labstack/echo"
	"github.com/syntaqx/echo-middleware/session"
)

func secure() echo.MiddlewareFunc {
	return func(next echo.HandlerFunc) echo.HandlerFunc {
		return func(c *echo.Context) error {
			session := session.Default(c)
			u := session.Get("user")
			if u == nil {
				return echo.NewHTTPError(http.StatusForbidden, "Permission denied!")
			}
			return next(c)
		}
	}
}

func secureApi() echo.MiddlewareFunc {
	return func(next echo.HandlerFunc) echo.HandlerFunc {
		return func(c *echo.Context) error {
			m := c.Request().Method
			if m == "POST" || m == "PUT" || m == "DELETE" {
				session := session.Default(c)
				u := session.Get("user")
				if u == nil {
					return echo.NewHTTPError(http.StatusForbidden, "Permission denied!")
				}
			}
			return next(c)
		}
	}
}
