package model

import "fmt"

func Zones(site string) []string {
	var zones []string
	err := db.Select(&zones, `SELECT zone FROM locations WHERE site=$1 GROUP BY zone`, site)
	if err != nil {
		fmt.Println(err)
	}

	return zones
}
