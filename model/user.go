package model

import "golang.org/x/crypto/bcrypt"

type User struct {
	ID       int
	Email    string
	Password string
	Admin    bool
}

// ValidatePassword returns true of the current user's password matches what is sent in
func (u *User) ValidatePassword(password string) bool {
	err := bcrypt.CompareHashAndPassword([]byte(u.Password), []byte(password))
	return err == nil
}
