package main

import (
	"fmt"
)

type User struct {
	ID       int
	Email    string
	Password string
	Admin    string
}

func getUser(email string) (User, error) {
	var u User
	err := db.QueryRowx(`SELECT * FROM users WHERE email = $1`, email).StructScan(&u)
	if err != nil {
		fmt.Println(err)
	}

	return u, err
}
