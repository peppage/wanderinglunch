package main

import (
	"context"
	"errors"
	"time"
	"wanderinglunch/models"

	"golang.org/x/crypto/bcrypt"

	"github.com/volatiletech/sqlboiler/boil"
	"github.com/volatiletech/sqlboiler/queries/qm"
)

type Marker struct {
	Lat  float64 `json:"lat"`
	Long float64 `json:"long"`
	Name string  `json:"name"`
}

func convertHoursAgoToEpochTime(hours int) int64 {
	return time.Now().Add(time.Duration(-1*hours) * (time.Minute * 60)).Unix()
}

func getSpots(site string, hours int) (map[string][]*models.Spot, error) {
	hoursAgo := convertHoursAgoToEpochTime(hours)
	spots, err := models.Spots(
		qm.Load("Location"),
		qm.Load("Truck"),
		qm.Load("Truck.Images", qm.Where("images.menu = ?", true)),
		qm.InnerJoin("locations on location_id = locations.id"),
		qm.InnerJoin("tweets on spots.tweet_id = tweets.id"),
		qm.InnerJoin("trucks on spots.truck_id = trucks.twitname"),
		qm.Where("trucks.site = ?", site),
		qm.Where("tweets.time > ?", hoursAgo),
		qm.OrderBy("lat DESC")).All(context.Background(), db)
	if err != nil {
		return nil, err
	}

	zones := make(map[string][]*models.Spot)
	for _, s := range spots {
		if _, ok := zones[s.R.Location.Zone]; ok {
			zones[s.R.Location.Zone] = append(zones[s.R.Location.Zone], s)
		} else {
			zones[s.R.Location.Zone] = []*models.Spot{s}
		}
	}

	return zones, nil
}

func getTrucks(site string, hours int) ([]*models.Truck, error) {
	return models.Trucks(
		qm.Load("Images", qm.Where("images.menu = ?", true)),
		qm.Where("trucks.site = ?", site),
		qm.OrderBy("name ASC")).All(context.Background(), db)
}

func getTruck(id string) (*models.Truck, error) {
	return models.Trucks(
		qm.Load("Images", qm.OrderBy("images.menu DESC")),
		qm.Load("Tweets", qm.OrderBy("time DESC"), qm.Limit(5)),
		qm.Where("trucks.twitname = ?", id),
	).One(context.Background(), db)
}

func getSite(name string) (*models.Site, error) {
	return models.Sites(
		qm.Where("name = ?", name),
	).One(context.Background(), db)
}

func getMarkers(site string, hours int) ([]Marker, error) {
	hoursAgo := convertHoursAgoToEpochTime(hours)
	spots, err := models.Spots(
		qm.Load("Location"),
		qm.Load("Truck"),
		qm.InnerJoin("locations on location_id = locations.id"),
		qm.InnerJoin("tweets on spots.tweet_id = tweets.id"),
		qm.InnerJoin("trucks on spots.truck_id = trucks.twitname"),
		qm.Where("trucks.site = ?", site),
		qm.Where("tweets.time > ?", hoursAgo),
	).All(context.Background(), db)

	if err != nil {
		return nil, err
	}

	markers := []Marker{}
	for _, s := range spots {
		markers = append(markers, Marker{
			Name: s.R.Truck.Name,
			Lat:  s.R.Location.Lat,
			Long: s.R.Location.Long,
		})
	}

	return markers, nil
}

func getValidUser(username, password string) (*models.User, error) {
	user, err := models.Users(
		qm.Where("email = ?", username),
	).One(context.Background(), db)

	if err != nil {
		return nil, err
	}

	if ok := validatePassword(user.Password, password); ok {
		return user, nil
	}

	return nil, errors.New("Invalid credentials")
}

// validatePassword returns true of the current user's password matches what is sent in
func validatePassword(dbpassword, password string) bool {
	err := bcrypt.CompareHashAndPassword([]byte(dbpassword), []byte(password))
	return err == nil
}

func saveTruck(req *TruckRequest) error {
	t := models.Truck{
		ID:         req.Twitter,
		Name:       req.Name,
		Twitname:   req.Twitter,
		Weburl:     req.URL,
		Type:       req.Type,
		About:      req.About,
		Foursquare: req.Foursquare,
		Site:       req.Site,
		Archive:    req.Archive,
	}

	return t.Insert(context.Background(), db, boil.Infer())
}

func updateTruck(req *TruckRequest) error {
	t, err := models.Trucks(
		qm.Where("twitname = ?", req.Twitter),
	).One(context.Background(), db)
	if err != nil {
		return err
	}

	t.Name = req.Name
	t.Weburl = req.URL
	t.Type = req.Type
	t.About = req.About
	t.Foursquare = req.Foursquare
	t.Site = req.Site
	t.Archive = req.Archive

	_, err = t.Update(context.Background(), db, boil.Infer())
	return err
}

func saveSub(req *SubRequest) (models.Sub, error) {
	s := models.Sub{
		Regex:       req.Regex,
		Replacement: req.Replacement,
	}

	err := s.Insert(context.Background(), db, boil.Infer())
	return s, err
}

func saveLocation(req *LocationRequest) (models.Location, error) {
	l := models.Location{
		Display: req.Display,
		Matcher: req.Matcher,
		Lat:     req.Lat,
		Long:    req.Long,
		Zone:    req.Zone,
		Site:    req.Site,
	}

	err := l.Insert(context.Background(), db, boil.Infer())
	return l, err
}

func getAllTrucksForSite(site string) (models.TruckSlice, error) {
	return models.Trucks(
		qm.Where("site = ?", site),
	).All(context.Background(), db)

}
