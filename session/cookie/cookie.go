package cookie

import (
	"net/http"

	"wanderinglunch/model"
	"wanderinglunch/session"

	"github.com/shawnps/sessions"
)

type cookieStore struct {
	store sessions.Store
}

const sessionName = "id"

func New(secret string) session.Session {
	store := sessions.NewCookieStore([]byte(secret))
	return &cookieStore{
		store: store,
	}
}

const userKey = "_user"
const siteKey = "_site"

func (store *cookieStore) SetUser(w http.ResponseWriter, r *http.Request, u *model.User) {
	sess, _ := store.store.New(r, sessionName)
	sess.Values[userKey] = u
	sess.Save(r, w)
}

func (store *cookieStore) GetUser(r *http.Request) *model.User {
	sess, _ := store.store.Get(r, sessionName)
	if user, ok := sess.Values[userKey].(*model.User); ok {
		return user
	}
	return nil
}

func (store *cookieStore) SetSite(w http.ResponseWriter, r *http.Request, site string) {
	sess, _ := store.store.Get(r, sessionName)
	sess.Values[siteKey] = site
	sess.Save(r, w)
}

func (store *cookieStore) GetSite(r *http.Request) string {
	sess, _ := store.store.Get(r, sessionName)
	if site, ok := sess.Values[siteKey].(string); ok {
		return site
	}
	return ""
}

func (store *cookieStore) Clear(w http.ResponseWriter, r *http.Request) {
	sess, _ := store.store.Get(r, sessionName)
	sess.Options.MaxAge = -1
	sess.Save(r, w)
}
