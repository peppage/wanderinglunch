package model

type Site struct {
	Name        string
	Title       string
	Description string
}

//GetSite get a site entry from db
func GetSite(name string) (*Site, error) {
	s := Site{}
	err := db.Get(&s, `SELECT * FROM sites WHERE name = $1`, name)
	return &s, err
}

func GetSites() ([]*Site, error) {
	var sites []*Site
	err := db.Select(&sites, `SELECT * FROM sites`)
	return sites, err
}

//AddSite adds a site to the database
func AddSite(s Site) error {
	_, err := db.NamedExec(`INSERT INTO sites (name, title, description) VALUES (:name, :title, :description)`, s)
	return err
}

func UpdateSite(s Site) error {
	_, err := db.NamedExec(`UPDATE sites SET title = :title, description = :description WHERE name = :name`, s)
	return err
}
