package main

import (
	"fmt"

	"golang.org/x/crypto/bcrypt"
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

func verifyPassword(email string, password string) (User, error) {
	var u User
	err := db.QueryRowx(`SELECT * FROM users WHERE email = $1`, email).StructScan(&u)
	if err != nil {
		fmt.Println(err)
	}
	err = bcrypt.CompareHashAndPassword([]byte(u.Password), []byte(password))
	if err != nil {
		fmt.Println(err)
	}
	return u, err
}
