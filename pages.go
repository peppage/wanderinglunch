package main

import (
	"encoding/json"
	"strings"

	"github.com/gofiber/fiber/v2"
	"github.com/rs/zerolog/log"
	"golang.org/x/crypto/bcrypt"
)

type router struct {
	db *dbContext
}

func (r router) index(c *fiber.Ctx) error {

	spots, err := r.db.GetSpots()
	if err != nil {
		log.Err(err).Send()
		return err
	}

	return c.Render("index", fiber.Map{
		"pageTitle": "Home",
		"spots":     spots,
	}, "layouts/main")
}

func (r router) allTrucks(c *fiber.Ctx) error {
	trucks, err := r.db.GetTrucksWithImages()
	if err != nil {
		log.Err(err).Send()
		return err
	}

	return c.Render("alltrucks", fiber.Map{
		"pageTitle": "All Trucks",
		"trucks":    trucks,
	}, "layouts/main")
}

func (r router) truck(c *fiber.Ctx) error {
	truck, err := r.db.GetTruck(c.Params("id"))
	if err != nil {
		if strings.Contains(err.Error(), "no rows") {
			return fiber.ErrNotFound
		}
		log.Err(err).Send()
		return err
	}

	return c.Render("truck", fiber.Map{
		"pageTitle": truck.Name,
		"truck":     truck,
	}, "layouts/main")
}

func (r router) truckMap(c *fiber.Ctx) error {
	spots, err := r.db.GetMapMarkers()
	if err != nil {
		log.Err(err).Send()
		return err
	}

	bytes, err := json.Marshal(spots)
	if err != nil {
		log.Err(err).Send()
		return err
	}

	return c.Render("map", fiber.Map{
		"pageTitle": "Map of trucks",
		"spots":     bytes,
		"lat":       40.755575,
		"long":      -73.982404,
	}, "layouts/main")
}

func (r router) login(c *fiber.Ctx) error {
	sess, err := store.Get(c)
	if err != nil {
		log.Err(err).Send()
		return err
	}

	return c.Render("login", fiber.Map{
		"pageTitle": "Login",
		"error":     getErrorMessage(sess),
	}, "layouts/main")
}

type loginViewModel struct {
	Email    string
	Password string
}

func (r router) loginHandler(c *fiber.Ctx) error {
	vm := new(loginViewModel)

	if err := c.BodyParser(vm); err != nil {
		log.Err(err).Send()
		return err
	}

	sess, err := store.Get(c)
	if err != nil {
		log.Err(err).Send()
		return err
	}

	u, err := r.db.GetUser(vm.Email)
	if err != nil {
		if strings.Contains(err.Error(), "no rows") {
			saveErrorMessage(sess, "Failed to login")
			return c.Redirect("/login", fiber.StatusSeeOther)
		}
		log.Err(err).Send()
		return err
	}

	if validatePassword(u.Password, vm.Password) {
		sess.Set(sessUser, u.ID)
		sess.Save()
		return c.Redirect("/admin", fiber.StatusSeeOther)
	}

	saveErrorMessage(sess, "Failed to login")
	return c.Redirect("/login", fiber.StatusSeeOther)
}

// validatePassword returns true of the current user's password matches what is sent in
func validatePassword(dbpassword, password string) bool {
	err := bcrypt.CompareHashAndPassword([]byte(dbpassword), []byte(password))
	return err == nil
}
