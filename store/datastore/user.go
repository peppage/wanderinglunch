package datastore

import "wanderinglunch/model"

func (db *datastore) GetUser(email string) (*model.User, error) {
	var u = new(model.User)
	err := db.Get(u, getUserQuery, email)
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
