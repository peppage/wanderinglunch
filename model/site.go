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

func GetSites() ([]string, error) {
	var sites []string
	err := db.Select(&sites, `SELECT site FROM locations GROUP BY site`)
	return sites, err
}
