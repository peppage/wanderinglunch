package model

type Site struct {
	Name  string
	Title string
}

//GetSite get a site entry from db
func GetSite(name string) (*Site, error) {
	s := Site{}
	err := db.Select(&s, `SELECT * FROM sites WHERE name = $1`, name)
	return &s, err
}
