package main

import (
	"context"
	"time"
	"wanderinglunch/models"

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
