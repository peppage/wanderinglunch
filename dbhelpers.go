package main

import (
	"context"
	"time"
	"wanderinglunch/models"

	"github.com/volatiletech/sqlboiler/queries/qm"
)

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
		qm.InnerJoin("tweets on tweet_id = tweets.id"),
		qm.InnerJoin("trucks on truck_id = trucks.twitname"),
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
