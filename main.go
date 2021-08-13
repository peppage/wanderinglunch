package main

import (
	"fmt"
	"math"
	"strconv"
	"time"

	"github.com/go-co-op/gocron"
	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/recover"
	"github.com/gofiber/fiber/v2/middleware/session"
	"github.com/gofiber/storage/sqlite3"
	"github.com/gofiber/template/jet"
	"github.com/rs/zerolog"
	"github.com/rs/zerolog/log"
)

var conf *config
var db *dbContext
var store *session.Store
var scheduler *gocron.Scheduler

func main() {
	zerolog.TimeFieldFormat = zerolog.TimeFormatUnix
	conf = loadConfig()
	db = openDatabase()
	defer db.db.Close()

	scheduler = gocron.NewScheduler(time.UTC)
	scheduler.Every(15).Minutes().Do(updator)

	if !conf.Debug {
		scheduler.StartAsync()
	}

	storage := sqlite3.New(sqlite3.Config{
		Database:   "./session.sqlite3",
		Table:      "session",
		Reset:      false,
		GCInterval: 10 * time.Second,
	})

	store = session.New(session.Config{
		Storage: storage,
	})

	engine := jet.New("./views", ".jet")

	engine.AddFunc("relativeTime", func(i int64) string {
		return relativeTime(i)
	})

	engine.AddFunc("prettyTime", func(i int64) string {
		return prettyTime(i)
	})

	zerolog.SetGlobalLevel(zerolog.InfoLevel)
	if conf.Debug {
		engine.Reload(true)
		engine.Debug(true)
		zerolog.SetGlobalLevel(zerolog.DebugLevel)
	}

	app := fiber.New(fiber.Config{
		Views:        engine,
		ErrorHandler: errorHandler,
	})

	app.Use(recover.New())

	app.Static("/", "./public")

	app.Get("/nyc", redirectHome)
	app.Get("/dc", redirectHome)
	app.Get("/buffalo", redirectHome)
	app.Get("/nyc/alltrucks", redirectAllTrucks)
	app.Get("/nyc/map", redirectMap)

	r := router{
		db: db,
	}

	app.Get("/", r.index)
	app.Get("/alltrucks", r.allTrucks)
	app.Get("/truck/:id", r.truck)
	app.Get("/map/", r.truckMap)
	app.Get("/login", r.login)
	app.Post("/login", r.loginHandler)

	ar := adminRouter{
		db: db,
	}

	admin := app.Group("/admin")
	admin.Use(loggedInMiddleware)
	admin.Get("/", ar.index)
	admin.Delete("/markdone", ar.tweetDone)
	admin.Get("/trucks", ar.trucks)
	admin.Post("/trucks/search", ar.trucksSearch)
	admin.Get("/truck/:id", ar.truck)
	admin.Post("/truck/:id", ar.truckSave)
	admin.Get("/locations", ar.locations)
	admin.Post("/locations/search", ar.locationSearch)
	admin.Get("/location/:id", ar.location)
	admin.Post("/location/:id", ar.locationSave)
	admin.Get("/subs", ar.subs)
	admin.Get("/sub/:id", ar.sub)
	admin.Post("/sub/:id", ar.subSave)

	app.Listen(":" + conf.Port)
}

// relativeTime converts unix time to a relative time string
func relativeTime(lastUpdate int64) string {
	if lastUpdate == 0 {
		return "never"
	}

	elapsed := time.Since(time.Unix(lastUpdate, 0))

	d := math.Trunc(elapsed.Hours() / 24)
	if d == 1 {
		return "a day ago"
	} else if d > 1 {
		return strconv.FormatFloat(d, 'f', -1, 32) + " days ago"
	}

	h := math.Trunc(elapsed.Hours())
	if h == 1 {
		return "an hour ago"
	} else if h > 1 {
		return strconv.FormatFloat(h, 'f', -1, 32) + " hours ago"
	}

	m := math.Trunc(elapsed.Minutes())
	if m == 1 {
		return "a minute ago"
	} else if m > 1 {
		return strconv.FormatFloat(m, 'f', -1, 32) + " minutes ago"
	}

	return "seconds ago"
}

func prettyTime(epoch int64) string {
	t := time.Unix(epoch, 0)

	return t.Format("Mon Jan _2 15:04:05 2006")
}

func redirectHome(c *fiber.Ctx) error {
	return c.Redirect("/", fiber.StatusPermanentRedirect)
}

func redirectAllTrucks(c *fiber.Ctx) error {
	return c.Redirect("/alltrucks", fiber.StatusPermanentRedirect)
}

func redirectMap(c *fiber.Ctx) error {
	return c.Redirect("/map", fiber.StatusPermanentRedirect)
}

func errorHandler(c *fiber.Ctx, err error) error {
	// Status code defaults to 500
	code := fiber.StatusInternalServerError

	// Retrieve the custom status code if it's an fiber.*Error
	if e, ok := err.(*fiber.Error); ok {
		log.Debug().Msg("It's a fiber error code")
		code = e.Code
	}

	log.Debug().Int("code", code).Msg("Error handler")

	if conf.Debug {
		return c.Status(500).SendString(err.Error())
	}

	err = c.Status(code).Render(fmt.Sprintf("errors/%d", code), fiber.Map{
		"pageTitle": code,
	}, "layouts/main")

	if err != nil {
		return c.Status(500).SendString("Internal Server Error")
	}

	return nil
}

func loggedInMiddleware(c *fiber.Ctx) error {
	log.Debug().Msg("Verify logged in")

	// Skip if debugging
	if conf.Debug {
		return c.Next()
	}

	sess, err := store.Get(c)
	if err != nil {
		log.Err(err).Msg("failed to get session from store")
		return err
	}

	temp := sess.Get(sessUser)
	log.Debug().Interface("Session user", temp).Send()

	user, ok := sess.Get(sessUser).(int)
	if !ok || user == 0 {
		return fiber.ErrForbidden
	}

	return c.Next()
}

func getErrorMessage(sess *session.Session) string {
	errorMsg, ok := sess.Get(sessError).(string)
	if !ok {
		errorMsg = ""
	}
	sess.Delete(sessError)
	sess.Save()

	return errorMsg
}

func saveErrorMessage(sess *session.Session, err string) {
	sess.Set(sessError, err)
	sess.Save()
}
