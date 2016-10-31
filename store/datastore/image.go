package datastore

import "wanderinglunch/model"

func (db *datastore) GetImages(twitname string) ([]*model.Image, error) {
	images := []*model.Image{}
	err := db.Select(&images, getImagesQuery, twitname)
	return images, err
}

func (db *datastore) UpdateImage(i *model.Image) error {
	_, err := db.NamedExec(updateImageQuery, i)
	return err
}

func (db *datastore) AddImage(i *model.Image) error {
	_, err := db.Exec(addImageQuery,
		i.ID, i.Suffix, i.Twitname, i.Menu)
	return err
}

func (db *datastore) GetImage(id string) (*model.Image, error) {
	var i = new(model.Image)
	err := db.Get(i, getImageQuery, id)
	return i, err
}

const getImagesQuery = `
SELECT id,
       suffix,
       visibility,
       twitname,
       menu
FROM   images
WHERE  twitname = $1
ORDER  BY menu DESC,
          id
`

const updateImageQuery = `
UPDATE images
SET    ( suffix, visibility, twitname, menu ) = (
              :suffix, :visibility, :twitname, :menu )
WHERE  id = :id 
`

const addImageQuery = `
INSERT INTO images
            (id,
             suffix,
             twitname,
             menu)
VALUES      ($1,
             $2,
             $3,
             $4) 
`

const getImageQuery = `
SELECT id,
       suffix,
       visibility,
       twitname,
       menu
FROM   images
WHERE  id = $1 
`
