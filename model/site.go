package model

type Site struct {
	Name  string
	Title string
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
	_, err := db.NamedExec(`INSERT INTO sites (name, title) VALUES (:name, :title)`, s)
	return err
}
