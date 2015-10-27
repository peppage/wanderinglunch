package model

import (
	"fmt"

	"github.com/labstack/echo"
)

/**
 * @apiDefine Sub
 * @apiParam {String} regex The regex to match in the string
 * @apiParam {String} replacement What to replace the regex with
 */
type Sub struct {
	ID          int    `json:"id"`
	Regex       string `json:"regex"`
	Replacement string `json:"replacement"`
}

func GetSubs() []*Sub {
	var subs []*Sub
	err := db.Select(&subs, `SELECT regex, replacement, id FROM subs ORDER BY id`)
	if err != nil {
		fmt.Println(err)
	}
	return subs
}

func GetSub(id string) Sub {
	var s Sub
	err := db.QueryRowx(`SELECT * FROM subs WHERE id=$1`, id).StructScan(&s)
	if err != nil {
		fmt.Println(err)
	}
	return s
}

func GetSubByRegex(regex string) Sub {
	var s Sub
	err := db.QueryRowx(`SELECT * FROM subs WHERE regex=$1`, regex).StructScan(&s)
	if err != nil {
		fmt.Println(err)
	}
	return s
}

func AddSub(s Sub) bool {
	result, err := db.NamedExec(`INSERT INTO subs (regex, replacement) VALUES (:regex, :replacement)`, s)
	if err != nil {
		fmt.Println(err)
	}
	if result != nil {
		return true
	}
	return false
}

func DeleteSub(id string) bool {
	result, err := db.Exec(`DELETE FROM subs WHERE id = $1`, id)
	if err != nil {
		fmt.Println(err)
	}
	if result != nil {
		return true
	}
	return false
}

func UpdateSub(s Sub) bool {
	result, err := db.NamedExec(`UPDATE subs SET (regex, replacement) = (:regex, :replacement) WHERE id=:id`, s)
	if err != nil {
		fmt.Println(err)
	}
	if result != nil {
		return true
	}
	return false
}

func SubMarshal(c *echo.Context) Sub {
	var s Sub
	s.Regex = c.Form("regex")
	s.Replacement = c.Form("replacement")
	return s
}
