package datastore

import "wanderinglunch/model"

func (db *datastore) GetSubs() ([]*model.Sub, error) {
	var subs []*model.Sub
	err := db.Select(&subs, getSubsQuery)
	return subs, err
}

func (db *datastore) AddSub(s *model.Sub) error {
	_, err := db.NamedExec(addSubQuery, s)
	return err
}

func (db *datastore) GetSub(id string) (*model.Sub, error) {
	var s = new(model.Sub)
	err := db.Get(s, getSubQuery, id)
	return s, err
}

//UpdateSub updates a sub by id in the database
func (db *datastore) UpdateSub(s *model.Sub) error {
	_, err := db.NamedExec(updateSubQuery, s)
	return err
}

const getSubsQuery = `
SELECT regex,
       replacement,
       id
FROM   subs
ORDER  BY id
`

const addSubQuery = `
INSERT INTO subs
            (regex,
             replacement)
VALUES      (:regex,
             :replacement) 
`

const getSubQuery = `
SELECT regex,
       replacement,
       id
FROM   subs
WHERE  id = $1 
`

const updateSubQuery = `
UPDATE subs
SET    ( regex, replacement ) = ( :regex, :replacement )
WHERE  id = :id 
`
