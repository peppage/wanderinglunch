package datastore

import (
	"wanderinglunch/model"

	"golang.org/x/crypto/bcrypt"
)

func (db *datastore) GetUser(email string) (*model.User, error) {
	var u = new(model.User)
	err := db.Get(u, getUserQuery, email)
	return u, err
}

// This should move to the user object
func (db *datastore) VerifyPassword(email string, password string) (*model.User, error) {
	var u = new(model.User)
	u, err := db.GetUser(email)
	if err != nil {
		return nil, err
	}
	err = bcrypt.CompareHashAndPassword([]byte(u.Password), []byte(password))
	return u, err
}

const getUserQuery = `
SELECT id,
       email,
       password,
       admin
FROM   users
WHERE  email = $1
`
