package main

import (
	"database/sql"
	"time"

	"github.com/rs/zerolog/log"

	_ "github.com/mattn/go-sqlite3"
)

type dbContext struct {
	db *sql.DB
}

func openDatabase() *dbContext {
	sqliteDatabase, _ := sql.Open("sqlite3", "./"+conf.DbFilename)
	return &dbContext{
		db: sqliteDatabase,
	}
}

func (context *dbContext) GetSpots() (map[string][]*Spot, error) {
	eightHoursAgo := time.Now().Add(time.Duration(-1) * time.Hour * 8).Unix()
	const query = `SELECT id, name, display, zone, time, IFNULL(suffix, "") as suffix, lat, long FROM spots_view
				WHERE time > ?
				AND archive = 0;
				`

	log.Debug().Int64("hourAgo", eightHoursAgo).Msg("Getting spots")
	rows, err := context.db.Query(query, eightHoursAgo)
	if err != nil {
		return nil, err
	}

	defer rows.Close()

	zones := make(map[string][]*Spot)
	for rows.Next() {
		s := &Spot{}

		err = rows.Scan(&s.ID, &s.Name, &s.LocationDisplay, &s.Zone, &s.Time, &s.ImageSuffix, &s.Lat, &s.Long)
		if err != nil {
			return nil, err
		}

		log.Debug().Str("id", s.ID).Send()

		if _, ok := zones[s.Zone]; ok {
			zones[s.Zone] = append(zones[s.Zone], s)
		} else {
			zones[s.Zone] = []*Spot{s}
		}
	}

	return zones, nil
}

func (context *dbContext) InsertSpot(spot *SpotIds) error {
	const query = `INSERT INTO spots
			(truck_id, location_id, tweet_id)
			VALUES
			(?, ?, ?) ON CONFLICT DO NOTHING`

	log.Debug().Str("query", query).Str("truck id", spot.TruckID).Int("location id", spot.LocationID).Str("tweet id", spot.TweetID).Msg("insert spot")

	_, err := context.db.Exec(query, &spot.TruckID, &spot.LocationID, &spot.TweetID)
	return err
}

func (context *dbContext) GetMapMarkers() ([]*Spot, error) {
	eightHoursAgo := time.Now().Add(time.Duration(-1) * time.Hour * 8).Unix()
	const query = `SELECT id, name, display, zone, time, IFNULL(suffix, "") as suffix, lat, long FROM spots_view
				WHERE time > ?
				AND archive = 0;
				`

	log.Debug().Int64("hourAgo", eightHoursAgo).Msg("Getting spots")
	rows, err := context.db.Query(query, eightHoursAgo)
	if err != nil {
		return nil, err
	}

	defer rows.Close()

	spots := []*Spot{}
	for rows.Next() {
		s := &Spot{}

		err = rows.Scan(&s.ID, &s.Name, &s.LocationDisplay, &s.Zone, &s.Time, &s.ImageSuffix, &s.Lat, &s.Long)
		if err != nil {
			return nil, err
		}

		log.Debug().Str("id", s.ID).Send()

		spots = append(spots, s)
	}

	return spots, nil
}

/****************************************************
*                    Trucks                         *
****************************************************/

func (context *dbContext) GetTrucksWithImages() ([]*Truck, error) {
	const query = `SELECT * FROM trucks ORDER BY archive, name`
	rows, err := context.db.Query(query)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	trucks := []*Truck{}
	for rows.Next() {
		t := &Truck{}

		err = rows.Scan(&t.ID, &t.Name, &t.WebURL, &t.LastUpdate, &t.Type, &t.About, &t.Foursquare, &t.Archive)
		if err != nil {
			return nil, err
		}
		trucks = append(trucks, t)
	}

	for _, t := range trucks {
		images, err := context.GetTruckImages(t.ID)
		if err != nil {
			return nil, err
		}

		t.Images = images
	}

	return trucks, nil
}

func (context *dbContext) GetTruckImages(truckID string) ([]*Image, error) {
	const query = `SELECT * FROM images WHERE truck_id = ? ORDER BY menu DESC`

	rows, err := context.db.Query(query, truckID)
	if err != nil {
		return nil, err
	}

	defer rows.Close()

	images := []*Image{}
	for rows.Next() {
		i := &Image{}

		err = rows.Scan(&i.ID, &i.Suffix, &i.Visibility, &i.TruckID, &i.Menu)
		if err != nil {
			return nil, err
		}

		images = append(images, i)
	}

	return images, nil
}

func (context *dbContext) GetTruck(id string) (*Truck, error) {
	const query = `SELECT * FROM trucks WHERE id = ?`

	row := context.db.QueryRow(query, id)

	t := new(Truck)
	err := row.Scan(&t.ID, &t.Name, &t.WebURL, &t.LastUpdate, &t.Type, &t.About, &t.Foursquare, &t.Archive)
	if err != nil {
		return nil, err
	}

	t.Images, err = context.GetTruckImages(id)
	if err != nil {
		return nil, err
	}

	return t, nil
}

func (context *dbContext) InsertTruck(truck *Truck) error {
	const query = `INSERT INTO trucks
			(name, id, web_url, last_update, type, about, foursquare, archive)
			VALUES
			(?, ?, ?, ?, ?, ?, ?, ?)`

	_, err := context.db.Exec(query, &truck.Name, &truck.ID, &truck.WebURL, &truck.LastUpdate,
		&truck.Type, &truck.About, &truck.Foursquare, &truck.Archive)
	return err
}

func (context *dbContext) UpdateTruck(truck *Truck) error {
	const query = `UPDATE trucks SET name = ?, id = ?, web_url = ?, last_update = ?, type = ?,
		about = ?, foursquare = ?, archive = ? where id = ?`

	_, err := context.db.Exec(query, &truck.Name, &truck.ID, &truck.WebURL, &truck.LastUpdate,
		&truck.Type, &truck.About, &truck.Foursquare, &truck.Archive, &truck.ID)
	return err
}

func (context *dbContext) GetTrucks(includeArchive bool, search string) ([]*Truck, error) {
	query := `SELECT * FROM trucks`

	if !includeArchive {
		query += ` WHERE archive = 0`
	}

	if search != "" {
		if !includeArchive {
			query += " AND "
		} else {
			query += " WHERE "
		}

		query += `name LIKE "%` + search + `%"`
	}

	rows, err := context.db.Query(query)
	if err != nil {
		log.Err(err).Str("query", query).Send()
		return nil, err
	}

	defer rows.Close()

	trucks := []*Truck{}

	for rows.Next() {
		t := new(Truck)

		err := rows.Scan(&t.ID, &t.Name, &t.WebURL, &t.LastUpdate, &t.Type, &t.About, &t.Foursquare, &t.Archive)
		if err != nil {
			return nil, err
		}

		trucks = append(trucks, t)
	}

	return trucks, nil
}

/****************************************************
*                    Users                          *
****************************************************/

func (context *dbContext) GetUser(email string) (*User, error) {
	const query = `SELECT * FROM users WHERE email = ?`

	row := context.db.QueryRow(query, email)

	u := new(User)

	err := row.Scan(&u.ID, &u.Email, &u.Password)
	if err != nil {
		return nil, err
	}

	return u, nil
}

/****************************************************
*                    Tweets                         *
****************************************************/

func (context *dbContext) GetTweets(limit int) ([]*Tweet, error) {
	const query = `SELECT * FROM tweets WHERE done = 0 ORDER BY time DESC LIMIT ?`

	rows, err := context.db.Query(query, limit)
	if err != nil {
		return nil, err
	}

	defer rows.Close()

	tweets := []*Tweet{}
	for rows.Next() {
		t := new(Tweet)

		err := rows.Scan(&t.ID, &t.Text, &t.Time, &t.TruckID, &t.Done)
		if err != nil {
			return nil, err
		}

		tweets = append(tweets, t)
	}

	return tweets, nil
}

func (context *dbContext) SetTweetDone(id string) error {
	const query = `UPDATE tweets SET done = 1 WHERE id = ?`

	_, err := context.db.Exec(query, &id)
	return err
}

func (context *dbContext) InsertTweet(tweet *Tweet) error {
	const query = `INSERT INTO tweets
			(id, text, time, truck_id, done)
			VALUES
			(?, ?, ?, ?, ?) ON CONFLICT DO NOTHING`

	_, err := context.db.Exec(query, &tweet.ID, &tweet.Text, &tweet.Time, &tweet.TruckID, &tweet.Done)
	return err
}

/****************************************************
*                    Subs                           *
****************************************************/

func (context *dbContext) GetSubs() ([]*Sub, error) {
	const query = `SELECT * FROM subs`

	rows, err := context.db.Query(query)
	if err != nil {
		return nil, err
	}

	defer rows.Close()

	subs := []*Sub{}
	for rows.Next() {
		s := new(Sub)

		err := rows.Scan(&s.ID, &s.Regex, &s.Replacement)
		if err != nil {
			return nil, err
		}

		subs = append(subs, s)
	}

	return subs, nil
}

func (context *dbContext) GetSub(id int) (*Sub, error) {
	const query = `SELECT * FROM subs WHERE id = ?`

	row := context.db.QueryRow(query, id)

	s := new(Sub)
	err := row.Scan(&s.ID, &s.Regex, &s.Replacement)
	if err != nil {
		return nil, err
	}
	return s, nil
}

func (context *dbContext) UpdateSub(sub *Sub) error {
	const query = `UPDATE subs SET regex = ?, replacement = ? where id = ?`

	_, err := context.db.Exec(query, &sub.Regex, &sub.Replacement, &sub.ID)
	return err
}

func (context *dbContext) InsertSub(sub *Sub) (int64, error) {
	const query = `INSERT INTO subs
			(regex, replacement)
			VALUES
			(?, ?)`

	result, err := context.db.Exec(query, &sub.Regex, &sub.Replacement)
	if err != nil {
		return 0, err
	}

	return result.LastInsertId()
}

/****************************************************
*                    Locations                      *
****************************************************/

func (context *dbContext) GetLocations(search string) ([]*Location, error) {
	query := `SELECT * FROM locations`

	if search != "" {
		query += ` WHERE display LIKE "%` + search + `%"`
	}

	rows, err := context.db.Query(query)
	if err != nil {
		return nil, err
	}

	defer rows.Close()

	locs := []*Location{}
	for rows.Next() {
		l := new(Location)

		err := rows.Scan(&l.ID, &l.Display, &l.Matcher, &l.Lat, &l.Long, &l.Zone)
		if err != nil {
			return nil, err
		}

		locs = append(locs, l)
	}

	return locs, nil
}

func (context *dbContext) GetLocation(id int) (*Location, error) {
	const query = `SELECT * FROM locations WHERE id = ?`

	row := context.db.QueryRow(query, id)

	l := new(Location)
	err := row.Scan(&l.ID, &l.Display, &l.Matcher, &l.Lat, &l.Long, &l.Zone)
	if err != nil {
		return nil, err
	}
	return l, nil
}

func (context *dbContext) UpdateLocation(loc *Location) error {
	const query = `UPDATE locations SET display = ?, matcher = ?, lat = ?, long = ?, zone = ? WHERE id = ?`

	_, err := context.db.Exec(query, &loc.Display, &loc.Matcher, &loc.Lat, &loc.Long, &loc.Zone, &loc.ID)
	return err
}
