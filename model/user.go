package model

import "golang.org/x/crypto/bcrypt"

type User struct {
	ID       int
	Email    string
	Password string
	Admin    string
}

func GetUser(email string) (*User, error) {
	var u User
	err := db.QueryRowx(`SELECT * FROM users WHERE email = $1`, email).StructScan(&u)
	return &u, err
}

func VerifyPassword(email string, password string) (*User, error) {
	var u User
	err := db.QueryRowx(`SELECT * FROM users WHERE email = $1`, email).StructScan(&u)
	if err != nil {
		return nil, err
	}
	err = bcrypt.CompareHashAndPassword([]byte(u.Password), []byte(password))
	return &u, err
}
