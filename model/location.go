package model

type Location struct {
	ID      int     `json:"id"`
	Display string  `json:"display"`
	Matcher string  `json:"matcher"`
	Lat     float32 `json:"lat"`
	Long    float32 `json:"long"`
	Zone    string  `json:"zone"`
	Site    string  `json:"site"`
}

// GetLocations returns a map, the key is the site. Holds an slice of locations
func GetLocations() (map[string][]*Location, error) {
	locs := make(map[string][]*Location)

	rows, err := db.Queryx(`SELECT * FROM locations ORDER BY id`)
	if err != nil {
		return nil, err
	}
	for rows.Next() {
		temp := Location{}
		rows.StructScan(&temp)
		locs[temp.Site] = append(locs[temp.Site], &temp)
	}
	return locs, nil
}
