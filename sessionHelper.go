package main

import (
	"fmt"
	"wanderinglunch/models"

	"net/http"
)

const sessionName = "wandering-session"
const userValueName = "user"

func storeUser(w http.ResponseWriter, r *http.Request, user *models.User) {
	session, err := store.Get(r, sessionName)
	if err != nil {
		panic(err)
	}
	session.Values[userValueName] = user
	session.Save(r, w)
	fmt.Println("user saved")
}

func getUser(r *http.Request) (*models.User, error) {
	session, err := store.Get(r, sessionName)
	if err != nil {
		return nil, err
	}
	val := session.Values[userValueName]
	user, ok := val.(*models.User)
	if !ok {
		return nil, nil
	}

	return user, nil
}
