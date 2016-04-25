package model

type Site struct {
	Name        string
	Title       string
	Description string
	Lat         float32
	Long        float32
}

//GetSite get a site entry from db
func GetSite(name string) (*Site, error) {
	s := Site{}
	err := db.Get(&s, `SELECT name, title, description, lat, long FROM sites WHERE name = $1`, name)
	return &s, err
}

func GetSites() ([]*Site, error) {
	var sites []*Site
	err := db.Select(&sites, `SELECT name, title, description, lat, long FROM sites`)
	return sites, err
}

//AddSite adds a site to the database
func AddSite(s Site) error {
	_, err := db.NamedExec(`INSERT INTO sites (name, title, description, lat, long) VALUES
		(:name, :title, :description, :lat, :long)`, s)
	return err
}

func UpdateSite(s Site) error {
	_, err := db.NamedExec(`UPDATE sites SET title = :title, description = :description, lat = :lat, long = :long
		WHERE name = :name`, s)
	return err
}
