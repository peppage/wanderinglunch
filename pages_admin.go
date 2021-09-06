package main

import (
	"strconv"

	"github.com/gofiber/fiber/v2"
	"github.com/rs/zerolog/log"
)

type adminRouter struct {
	db *dbContext
}

type adminItemViewModelstruct struct {
	Tweet     *Tweet
	Locations []*Location
	Text      string
}

func (r adminRouter) index(c *fiber.Ctx) error {
	tweets, err := r.db.GetTweets(25)
	if err != nil {
		log.Err(err).Send()
		return err
	}

	subs, err := r.db.GetSubs()
	if err != nil {
		log.Err(err).Send()
		return err
	}

	locs, err := r.db.GetLocations("")
	if err != nil {
		log.Err(err).Send()
		return err
	}

	items := []*adminItemViewModelstruct{}
	for _, t := range tweets {
		text := makeSubstitutions(subs, t.Text)
		foundLocs := findLocations(locs, text)

		i := &adminItemViewModelstruct{
			Tweet:     t,
			Locations: foundLocs,
			Text:      text,
		}
		items = append(items, i)
	}

	return c.Render("admin/index", fiber.Map{
		"items": items,
	}, "layouts/admin")
}

func (r adminRouter) tweetDone(c *fiber.Ctx) error {
	id := c.Query("id")
	log.Debug().Str("id", id).Msg("Sent to tweet done endpoint")

	if id == "" {
		return fiber.ErrBadRequest
	}

	err := r.db.SetTweetDone(id)

	if err != nil {
		log.Err(err).Str("id", id).Msg("Tweet done endpoint")
		return err
	}

	return nil
}

/****************************************************
*                     Trucks                        *
****************************************************/

func (r adminRouter) trucks(c *fiber.Ctx) error {
	trucks, err := r.db.GetTrucks(true, "")
	if err != nil {
		log.Err(err).Msg("Failed getting trucks")
		return err
	}

	return c.Render("admin/trucks", fiber.Map{
		"trucks": trucks,
	}, "layouts/admin")
}

func (r adminRouter) trucksSearch(c *fiber.Ctx) error {
	search := c.FormValue("search")
	trucks, err := r.db.GetTrucks(true, search)
	if err != nil {
		log.Err(err).Msg("Failed getting trucks")
		return err
	}

	return c.Render("admin/partials/truckList", fiber.Map{
		"trucks": trucks,
	})
}

func (r adminRouter) addTruck(c *fiber.Ctx) error {
	sess, err := store.Get(c)
	if err != nil {
		log.Err(err).Send()
		return err
	}

	return c.Render("admin/truck", fiber.Map{
		"truck": new(Truck),
		"error": getErrorMessage(sess),
	}, "layouts/admin")
}

func (r adminRouter) addTruckSave(c *fiber.Ctx) error {
	vm := new(Truck)

	sess, err := store.Get(c)
	if err != nil {
		log.Err(err).Send()
		return err
	}

	if err := c.BodyParser(vm); err != nil {
		log.Err(err).Send()
		saveErrorMessage(sess, "Invalid Truck")
		return c.Redirect("/admin/trucks/new", fiber.StatusSeeOther)
	}

	err = r.db.InsertTruck(vm)
	if err != nil {
		saveErrorMessage(sess, "Save failed")
		log.Err(err).Send()
		return c.Redirect("/admin/trucks/new", fiber.StatusSeeOther)
	}

	return c.Redirect("/admin/truck/"+vm.ID, fiber.StatusSeeOther)
}

func (r adminRouter) truck(c *fiber.Ctx) error {
	sess, err := store.Get(c)
	if err != nil {
		log.Err(err).Send()
		return err
	}

	id := c.Params("id")
	t, err := r.db.GetTruck(id)

	if err != nil {
		log.Err(err).Str("id", id).Msg("Failed getting truck")
		return err
	}

	return c.Render("admin/truck", fiber.Map{
		"truck": t,
		"error": getErrorMessage(sess),
	}, "layouts/admin")

}

func (r adminRouter) truckSave(c *fiber.Ctx) error {
	vm := new(Truck)

	if err := c.BodyParser(vm); err != nil {
		log.Err(err).Send()
		return err
	}

	sess, err := store.Get(c)
	if err != nil {
		log.Err(err).Send()
		return err
	}

	err = r.db.UpdateTruck(vm)
	if err != nil {
		saveErrorMessage(sess, "Save failed")
		if vm.ID == "" {
			return c.Redirect("/admin", fiber.StatusSeeOther)
		}
	}

	return c.Redirect("/admin/truck/"+vm.ID, fiber.StatusSeeOther)
}

/****************************************************
*                    Locations                      *
****************************************************/

func (r adminRouter) locations(c *fiber.Ctx) error {
	locs, err := r.db.GetLocations("")
	if err != nil {
		log.Err(err).Msg("Failed getting locations")
		return err
	}

	return c.Render("admin/locations", fiber.Map{
		"locations": locs,
	}, "layouts/admin")
}

func (r adminRouter) locationSearch(c *fiber.Ctx) error {
	search := c.FormValue("search")
	locs, err := r.db.GetLocations(search)
	if err != nil {
		log.Err(err).Msg("Failed getting locations")
		return err
	}

	return c.Render("admin/partials/locationList", fiber.Map{
		"locations": locs,
	})
}

func (r adminRouter) location(c *fiber.Ctx) error {
	sess, err := store.Get(c)
	if err != nil {
		log.Err(err).Send()
		return err
	}

	idParam := c.Params("id")

	id, err := strconv.Atoi(idParam)
	if err != nil {
		log.Err(err).Send()
		return err
	}

	l, err := r.db.GetLocation(id)

	if err != nil {
		log.Err(err).Int("id", id).Msg("Failed getting location")
		return err
	}

	return c.Render("admin/location", fiber.Map{
		"location": l,
		"error":    getErrorMessage(sess),
	}, "layouts/admin")

}

func (r adminRouter) locationSave(c *fiber.Ctx) error {
	vm := new(Location)

	if err := c.BodyParser(vm); err != nil {
		log.Err(err).Send()
		return err
	}

	sess, err := store.Get(c)
	if err != nil {
		log.Err(err).Send()
		return err
	}

	err = r.db.UpdateLocation(vm)
	if err != nil {
		saveErrorMessage(sess, "Save failed")
		log.Err(err).Send()
		if vm.ID == 0 {
			return c.Redirect("/admin", fiber.StatusSeeOther)
		}
	}

	return c.Redirect("/admin/location/"+strconv.Itoa(vm.ID), fiber.StatusSeeOther)
}

/****************************************************
*                    Subs                           *
****************************************************/

func (r adminRouter) subs(c *fiber.Ctx) error {
	subs, err := r.db.GetSubs()
	if err != nil {
		log.Err(err).Msg("Failed getting subs")
		return err
	}

	return c.Render("admin/subs", fiber.Map{
		"subs": subs,
	}, "layouts/admin")
}

func (r adminRouter) addSub(c *fiber.Ctx) error {
	sess, err := store.Get(c)
	if err != nil {
		log.Err(err).Send()
		return err
	}

	return c.Render("admin/sub", fiber.Map{
		"sub":   new(Sub),
		"error": getErrorMessage(sess),
	}, "layouts/admin")
}

func (r adminRouter) addSubSave(c *fiber.Ctx) error {
	vm := new(Sub)

	sess, err := store.Get(c)
	if err != nil {
		log.Err(err).Send()
		return err
	}

	if err := c.BodyParser(vm); err != nil {
		log.Err(err).Send()
		saveErrorMessage(sess, "Invalid Sub")
		return err
	}

	id, err := r.db.InsertSub(vm)
	if err != nil {
		saveErrorMessage(sess, "Save failed")
		log.Err(err).Send()
		if vm.ID == 0 {
			return c.Redirect("/admin/subs/new", fiber.StatusSeeOther)
		}
	}

	return c.Redirect("/admin/sub/"+strconv.FormatInt(id, 10), fiber.StatusSeeOther)
}

func (r adminRouter) sub(c *fiber.Ctx) error {
	sess, err := store.Get(c)
	if err != nil {
		log.Err(err).Send()
		return err
	}

	idParam := c.Params("id")

	id, err := strconv.Atoi(idParam)
	if err != nil {
		log.Err(err).Send()
		return err
	}

	s, err := r.db.GetSub(id)

	if err != nil {
		log.Err(err).Int("id", id).Msg("Failed getting sub")
		return err
	}

	return c.Render("admin/sub", fiber.Map{
		"sub":   s,
		"error": getErrorMessage(sess),
	}, "layouts/admin")

}

func (r adminRouter) subSave(c *fiber.Ctx) error {
	vm := new(Sub)

	sess, err := store.Get(c)
	if err != nil {
		log.Err(err).Send()
		return err
	}

	if err := c.BodyParser(vm); err != nil {
		log.Err(err).Send()
		saveErrorMessage(sess, "Invalid Sub")
		return err
	}

	err = r.db.UpdateSub(vm)
	if err != nil {
		saveErrorMessage(sess, "Save failed")
		log.Err(err).Send()
		if vm.ID == 0 {
			return c.Redirect("/admin", fiber.StatusSeeOther)
		}
	}

	return c.Redirect("/admin/sub/"+strconv.Itoa(vm.ID), fiber.StatusSeeOther)
}
