package main

import "fmt"

type Message struct {
	Id      int
	Message string
}

func addMessage(m Message) bool {
	result, err := db.Exec(`INSERT INTO messages (message) VALUES ($1)`, m.Message)
	if err != nil {
		fmt.Println(err)
	}
	if result != nil {
		return true
	}
	return false
}

func getMessage() Message {
	var message Message
	err := db.QueryRowx(`SELECT message FROM messages ORDER BY id DESC LIMIT 1`).StructScan(&message)
	if err != nil {
		fmt.Println(err)
	}
	return message
}
