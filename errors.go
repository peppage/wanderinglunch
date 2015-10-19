package main

import "fmt"

type apiErrors struct {
	Errors []apiError `json:"errors"`
}

type apiError struct {
	Message string `json:"message"`
}

func (aerr apiError) Error() string {
	return fmt.Sprintf("%s", aerr.Message)
}
