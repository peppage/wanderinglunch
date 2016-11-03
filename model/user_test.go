package model

import (
	"testing"

	"github.com/stretchr/testify/suite"
	"golang.org/x/crypto/bcrypt"
)

type UserTestSuite struct {
	suite.Suite
}

func (suite *UserTestSuite) TestValidatePassword() {
	pwd := "test_password"

	b, _ := bcrypt.GenerateFromPassword([]byte(pwd), 0)

	u := &User{
		Password: string(b),
	}

	suite.True(u.ValidatePassword(pwd))
	suite.False(u.ValidatePassword("not the pass"))

}

func TestUser(t *testing.T) {
	suite.Run(t, new(UserTestSuite))
}
