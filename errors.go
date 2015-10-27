package main

import "fmt"

type apiErrors struct {
	Errors []apiError `json:"errors"`
}

func (aerr apiErrors) Error() string {
	var s string
	for _, e := range aerr.Errors {
		s += e.Error() + " "
	}
	return s
}

type apiError struct {
	Message string `json:"message"`
}

func (aerr apiError) Error() string {
	return fmt.Sprintf("%s", aerr.Message)
}
