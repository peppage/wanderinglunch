// Code generated by SQLBoiler (https://github.com/volatiletech/sqlboiler). DO NOT EDIT.
// This file is meant to be re-generated in place and/or deleted at any time.

package models

import (
	"context"
	"database/sql"
	"fmt"
	"reflect"
	"strconv"
	"strings"
	"sync"
	"time"

	"github.com/pkg/errors"
	"github.com/volatiletech/sqlboiler/boil"
	"github.com/volatiletech/sqlboiler/queries"
	"github.com/volatiletech/sqlboiler/queries/qm"
	"github.com/volatiletech/sqlboiler/strmangle"
)

// Tweet is an object representing the database table.
type Tweet struct {
	Text      string `boil:"text" json:"text" toml:"text" yaml:"text"`
	Time      int64  `boil:"time" json:"time" toml:"time" yaml:"time"`
	ID        string `boil:"id" json:"id" toml:"id" yaml:"id"`
	Retweeted bool   `boil:"retweeted" json:"retweeted" toml:"retweeted" yaml:"retweeted"`
	TruckID   string `boil:"truck_id" json:"truck_id" toml:"truck_id" yaml:"truck_id"`
	Done      bool   `boil:"done" json:"done" toml:"done" yaml:"done"`

	R *tweetR `boil:"-" json:"-" toml:"-" yaml:"-"`
	L tweetL  `boil:"-" json:"-" toml:"-" yaml:"-"`
}

var TweetColumns = struct {
	Text      string
	Time      string
	ID        string
	Retweeted string
	TruckID   string
	Done      string
}{
	Text:      "text",
	Time:      "time",
	ID:        "id",
	Retweeted: "retweeted",
	TruckID:   "truck_id",
	Done:      "done",
}

// tweetR is where relationships are stored.
type tweetR struct {
	Truck *Truck
	Spots SpotSlice
}

// NewStruct creates a new relationship struct
func (*tweetR) NewStruct() *tweetR {
	return &tweetR{}
}

// tweetL is where Load methods for each relationship are stored.
type tweetL struct{}

var (
	tweetColumns               = []string{"text", "time", "id", "retweeted", "truck_id", "done"}
	tweetColumnsWithoutDefault = []string{"text", "time", "id", "retweeted", "truck_id"}
	tweetColumnsWithDefault    = []string{"done"}
	tweetPrimaryKeyColumns     = []string{"id"}
)

type (
	// TweetSlice is an alias for a slice of pointers to Tweet.
	// This should generally be used opposed to []Tweet.
	TweetSlice []*Tweet
	// TweetHook is the signature for custom Tweet hook methods
	TweetHook func(context.Context, boil.ContextExecutor, *Tweet) error

	tweetQuery struct {
		*queries.Query
	}
)

// Cache for insert, update and upsert
var (
	tweetType                 = reflect.TypeOf(&Tweet{})
	tweetMapping              = queries.MakeStructMapping(tweetType)
	tweetPrimaryKeyMapping, _ = queries.BindMapping(tweetType, tweetMapping, tweetPrimaryKeyColumns)
	tweetInsertCacheMut       sync.RWMutex
	tweetInsertCache          = make(map[string]insertCache)
	tweetUpdateCacheMut       sync.RWMutex
	tweetUpdateCache          = make(map[string]updateCache)
	tweetUpsertCacheMut       sync.RWMutex
	tweetUpsertCache          = make(map[string]insertCache)
)

var (
	// Force time package dependency for automated UpdatedAt/CreatedAt.
	_ = time.Second
)

var tweetBeforeInsertHooks []TweetHook
var tweetBeforeUpdateHooks []TweetHook
var tweetBeforeDeleteHooks []TweetHook
var tweetBeforeUpsertHooks []TweetHook

var tweetAfterInsertHooks []TweetHook
var tweetAfterSelectHooks []TweetHook
var tweetAfterUpdateHooks []TweetHook
var tweetAfterDeleteHooks []TweetHook
var tweetAfterUpsertHooks []TweetHook

// doBeforeInsertHooks executes all "before insert" hooks.
func (o *Tweet) doBeforeInsertHooks(ctx context.Context, exec boil.ContextExecutor) (err error) {
	for _, hook := range tweetBeforeInsertHooks {
		if err := hook(ctx, exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doBeforeUpdateHooks executes all "before Update" hooks.
func (o *Tweet) doBeforeUpdateHooks(ctx context.Context, exec boil.ContextExecutor) (err error) {
	for _, hook := range tweetBeforeUpdateHooks {
		if err := hook(ctx, exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doBeforeDeleteHooks executes all "before Delete" hooks.
func (o *Tweet) doBeforeDeleteHooks(ctx context.Context, exec boil.ContextExecutor) (err error) {
	for _, hook := range tweetBeforeDeleteHooks {
		if err := hook(ctx, exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doBeforeUpsertHooks executes all "before Upsert" hooks.
func (o *Tweet) doBeforeUpsertHooks(ctx context.Context, exec boil.ContextExecutor) (err error) {
	for _, hook := range tweetBeforeUpsertHooks {
		if err := hook(ctx, exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doAfterInsertHooks executes all "after Insert" hooks.
func (o *Tweet) doAfterInsertHooks(ctx context.Context, exec boil.ContextExecutor) (err error) {
	for _, hook := range tweetAfterInsertHooks {
		if err := hook(ctx, exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doAfterSelectHooks executes all "after Select" hooks.
func (o *Tweet) doAfterSelectHooks(ctx context.Context, exec boil.ContextExecutor) (err error) {
	for _, hook := range tweetAfterSelectHooks {
		if err := hook(ctx, exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doAfterUpdateHooks executes all "after Update" hooks.
func (o *Tweet) doAfterUpdateHooks(ctx context.Context, exec boil.ContextExecutor) (err error) {
	for _, hook := range tweetAfterUpdateHooks {
		if err := hook(ctx, exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doAfterDeleteHooks executes all "after Delete" hooks.
func (o *Tweet) doAfterDeleteHooks(ctx context.Context, exec boil.ContextExecutor) (err error) {
	for _, hook := range tweetAfterDeleteHooks {
		if err := hook(ctx, exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doAfterUpsertHooks executes all "after Upsert" hooks.
func (o *Tweet) doAfterUpsertHooks(ctx context.Context, exec boil.ContextExecutor) (err error) {
	for _, hook := range tweetAfterUpsertHooks {
		if err := hook(ctx, exec, o); err != nil {
			return err
		}
	}

	return nil
}

// AddTweetHook registers your hook function for all future operations.
func AddTweetHook(hookPoint boil.HookPoint, tweetHook TweetHook) {
	switch hookPoint {
	case boil.BeforeInsertHook:
		tweetBeforeInsertHooks = append(tweetBeforeInsertHooks, tweetHook)
	case boil.BeforeUpdateHook:
		tweetBeforeUpdateHooks = append(tweetBeforeUpdateHooks, tweetHook)
	case boil.BeforeDeleteHook:
		tweetBeforeDeleteHooks = append(tweetBeforeDeleteHooks, tweetHook)
	case boil.BeforeUpsertHook:
		tweetBeforeUpsertHooks = append(tweetBeforeUpsertHooks, tweetHook)
	case boil.AfterInsertHook:
		tweetAfterInsertHooks = append(tweetAfterInsertHooks, tweetHook)
	case boil.AfterSelectHook:
		tweetAfterSelectHooks = append(tweetAfterSelectHooks, tweetHook)
	case boil.AfterUpdateHook:
		tweetAfterUpdateHooks = append(tweetAfterUpdateHooks, tweetHook)
	case boil.AfterDeleteHook:
		tweetAfterDeleteHooks = append(tweetAfterDeleteHooks, tweetHook)
	case boil.AfterUpsertHook:
		tweetAfterUpsertHooks = append(tweetAfterUpsertHooks, tweetHook)
	}
}

// One returns a single tweet record from the query.
func (q tweetQuery) One(ctx context.Context, exec boil.ContextExecutor) (*Tweet, error) {
	o := &Tweet{}

	queries.SetLimit(q.Query, 1)

	err := q.Bind(ctx, exec, o)
	if err != nil {
		if errors.Cause(err) == sql.ErrNoRows {
			return nil, sql.ErrNoRows
		}
		return nil, errors.Wrap(err, "models: failed to execute a one query for tweets")
	}

	if err := o.doAfterSelectHooks(ctx, exec); err != nil {
		return o, err
	}

	return o, nil
}

// All returns all Tweet records from the query.
func (q tweetQuery) All(ctx context.Context, exec boil.ContextExecutor) (TweetSlice, error) {
	var o []*Tweet

	err := q.Bind(ctx, exec, &o)
	if err != nil {
		return nil, errors.Wrap(err, "models: failed to assign all query results to Tweet slice")
	}

	if len(tweetAfterSelectHooks) != 0 {
		for _, obj := range o {
			if err := obj.doAfterSelectHooks(ctx, exec); err != nil {
				return o, err
			}
		}
	}

	return o, nil
}

// Count returns the count of all Tweet records in the query.
func (q tweetQuery) Count(ctx context.Context, exec boil.ContextExecutor) (int64, error) {
	var count int64

	queries.SetSelect(q.Query, nil)
	queries.SetCount(q.Query)

	err := q.Query.QueryRowContext(ctx, exec).Scan(&count)
	if err != nil {
		return 0, errors.Wrap(err, "models: failed to count tweets rows")
	}

	return count, nil
}

// Exists checks if the row exists in the table.
func (q tweetQuery) Exists(ctx context.Context, exec boil.ContextExecutor) (bool, error) {
	var count int64

	queries.SetCount(q.Query)
	queries.SetLimit(q.Query, 1)

	err := q.Query.QueryRowContext(ctx, exec).Scan(&count)
	if err != nil {
		return false, errors.Wrap(err, "models: failed to check if tweets exists")
	}

	return count > 0, nil
}

// Truck pointed to by the foreign key.
func (o *Tweet) Truck(mods ...qm.QueryMod) truckQuery {
	queryMods := []qm.QueryMod{
		qm.Where("twitname=?", o.TruckID),
	}

	queryMods = append(queryMods, mods...)

	query := Trucks(queryMods...)
	queries.SetFrom(query.Query, "\"trucks\"")

	return query
}

// Spots retrieves all the spot's Spots with an executor.
func (o *Tweet) Spots(mods ...qm.QueryMod) spotQuery {
	var queryMods []qm.QueryMod
	if len(mods) != 0 {
		queryMods = append(queryMods, mods...)
	}

	queryMods = append(queryMods,
		qm.Where("\"spots\".\"tweet_id\"=?", o.ID),
	)

	query := Spots(queryMods...)
	queries.SetFrom(query.Query, "\"spots\"")

	if len(queries.GetSelect(query.Query)) == 0 {
		queries.SetSelect(query.Query, []string{"\"spots\".*"})
	}

	return query
}

// LoadTruck allows an eager lookup of values, cached into the
// loaded structs of the objects. This is for an N-1 relationship.
func (tweetL) LoadTruck(ctx context.Context, e boil.ContextExecutor, singular bool, maybeTweet interface{}, mods queries.Applicator) error {
	var slice []*Tweet
	var object *Tweet

	if singular {
		object = maybeTweet.(*Tweet)
	} else {
		slice = *maybeTweet.(*[]*Tweet)
	}

	args := make([]interface{}, 0, 1)
	if singular {
		if object.R == nil {
			object.R = &tweetR{}
		}
		args = append(args, object.TruckID)
	} else {
	Outer:
		for _, obj := range slice {
			if obj.R == nil {
				obj.R = &tweetR{}
			}

			for _, a := range args {
				if a == obj.TruckID {
					continue Outer
				}
			}

			args = append(args, obj.TruckID)
		}
	}

	query := NewQuery(qm.From(`trucks`), qm.WhereIn(`twitname in ?`, args...))
	if mods != nil {
		mods.Apply(query)
	}

	results, err := query.QueryContext(ctx, e)
	if err != nil {
		return errors.Wrap(err, "failed to eager load Truck")
	}

	var resultSlice []*Truck
	if err = queries.Bind(results, &resultSlice); err != nil {
		return errors.Wrap(err, "failed to bind eager loaded slice Truck")
	}

	if err = results.Close(); err != nil {
		return errors.Wrap(err, "failed to close results of eager load for trucks")
	}
	if err = results.Err(); err != nil {
		return errors.Wrap(err, "error occurred during iteration of eager loaded relations for trucks")
	}

	if len(tweetAfterSelectHooks) != 0 {
		for _, obj := range resultSlice {
			if err := obj.doAfterSelectHooks(ctx, e); err != nil {
				return err
			}
		}
	}

	if len(resultSlice) == 0 {
		return nil
	}

	if singular {
		foreign := resultSlice[0]
		object.R.Truck = foreign
		if foreign.R == nil {
			foreign.R = &truckR{}
		}
		foreign.R.Tweets = append(foreign.R.Tweets, object)
		return nil
	}

	for _, local := range slice {
		for _, foreign := range resultSlice {
			if local.TruckID == foreign.Twitname {
				local.R.Truck = foreign
				if foreign.R == nil {
					foreign.R = &truckR{}
				}
				foreign.R.Tweets = append(foreign.R.Tweets, local)
				break
			}
		}
	}

	return nil
}

// LoadSpots allows an eager lookup of values, cached into the
// loaded structs of the objects. This is for a 1-M or N-M relationship.
func (tweetL) LoadSpots(ctx context.Context, e boil.ContextExecutor, singular bool, maybeTweet interface{}, mods queries.Applicator) error {
	var slice []*Tweet
	var object *Tweet

	if singular {
		object = maybeTweet.(*Tweet)
	} else {
		slice = *maybeTweet.(*[]*Tweet)
	}

	args := make([]interface{}, 0, 1)
	if singular {
		if object.R == nil {
			object.R = &tweetR{}
		}
		args = append(args, object.ID)
	} else {
	Outer:
		for _, obj := range slice {
			if obj.R == nil {
				obj.R = &tweetR{}
			}

			for _, a := range args {
				if a == obj.ID {
					continue Outer
				}
			}

			args = append(args, obj.ID)
		}
	}

	query := NewQuery(qm.From(`spots`), qm.WhereIn(`tweet_id in ?`, args...))
	if mods != nil {
		mods.Apply(query)
	}

	results, err := query.QueryContext(ctx, e)
	if err != nil {
		return errors.Wrap(err, "failed to eager load spots")
	}

	var resultSlice []*Spot
	if err = queries.Bind(results, &resultSlice); err != nil {
		return errors.Wrap(err, "failed to bind eager loaded slice spots")
	}

	if err = results.Close(); err != nil {
		return errors.Wrap(err, "failed to close results in eager load on spots")
	}
	if err = results.Err(); err != nil {
		return errors.Wrap(err, "error occurred during iteration of eager loaded relations for spots")
	}

	if len(spotAfterSelectHooks) != 0 {
		for _, obj := range resultSlice {
			if err := obj.doAfterSelectHooks(ctx, e); err != nil {
				return err
			}
		}
	}
	if singular {
		object.R.Spots = resultSlice
		for _, foreign := range resultSlice {
			if foreign.R == nil {
				foreign.R = &spotR{}
			}
			foreign.R.Tweet = object
		}
		return nil
	}

	for _, foreign := range resultSlice {
		for _, local := range slice {
			if local.ID == foreign.TweetID {
				local.R.Spots = append(local.R.Spots, foreign)
				if foreign.R == nil {
					foreign.R = &spotR{}
				}
				foreign.R.Tweet = local
				break
			}
		}
	}

	return nil
}

// SetTruck of the tweet to the related item.
// Sets o.R.Truck to related.
// Adds o to related.R.Tweets.
func (o *Tweet) SetTruck(ctx context.Context, exec boil.ContextExecutor, insert bool, related *Truck) error {
	var err error
	if insert {
		if err = related.Insert(ctx, exec, boil.Infer()); err != nil {
			return errors.Wrap(err, "failed to insert into foreign table")
		}
	}

	updateQuery := fmt.Sprintf(
		"UPDATE \"tweets\" SET %s WHERE %s",
		strmangle.SetParamNames("\"", "\"", 1, []string{"truck_id"}),
		strmangle.WhereClause("\"", "\"", 2, tweetPrimaryKeyColumns),
	)
	values := []interface{}{related.Twitname, o.ID}

	if boil.DebugMode {
		fmt.Fprintln(boil.DebugWriter, updateQuery)
		fmt.Fprintln(boil.DebugWriter, values)
	}

	if _, err = exec.ExecContext(ctx, updateQuery, values...); err != nil {
		return errors.Wrap(err, "failed to update local table")
	}

	o.TruckID = related.Twitname
	if o.R == nil {
		o.R = &tweetR{
			Truck: related,
		}
	} else {
		o.R.Truck = related
	}

	if related.R == nil {
		related.R = &truckR{
			Tweets: TweetSlice{o},
		}
	} else {
		related.R.Tweets = append(related.R.Tweets, o)
	}

	return nil
}

// AddSpots adds the given related objects to the existing relationships
// of the tweet, optionally inserting them as new records.
// Appends related to o.R.Spots.
// Sets related.R.Tweet appropriately.
func (o *Tweet) AddSpots(ctx context.Context, exec boil.ContextExecutor, insert bool, related ...*Spot) error {
	var err error
	for _, rel := range related {
		if insert {
			rel.TweetID = o.ID
			if err = rel.Insert(ctx, exec, boil.Infer()); err != nil {
				return errors.Wrap(err, "failed to insert into foreign table")
			}
		} else {
			updateQuery := fmt.Sprintf(
				"UPDATE \"spots\" SET %s WHERE %s",
				strmangle.SetParamNames("\"", "\"", 1, []string{"tweet_id"}),
				strmangle.WhereClause("\"", "\"", 2, spotPrimaryKeyColumns),
			)
			values := []interface{}{o.ID, rel.LocationID, rel.TweetID}

			if boil.DebugMode {
				fmt.Fprintln(boil.DebugWriter, updateQuery)
				fmt.Fprintln(boil.DebugWriter, values)
			}

			if _, err = exec.ExecContext(ctx, updateQuery, values...); err != nil {
				return errors.Wrap(err, "failed to update foreign table")
			}

			rel.TweetID = o.ID
		}
	}

	if o.R == nil {
		o.R = &tweetR{
			Spots: related,
		}
	} else {
		o.R.Spots = append(o.R.Spots, related...)
	}

	for _, rel := range related {
		if rel.R == nil {
			rel.R = &spotR{
				Tweet: o,
			}
		} else {
			rel.R.Tweet = o
		}
	}
	return nil
}

// Tweets retrieves all the records using an executor.
func Tweets(mods ...qm.QueryMod) tweetQuery {
	mods = append(mods, qm.From("\"tweets\""))
	return tweetQuery{NewQuery(mods...)}
}

// FindTweet retrieves a single record by ID with an executor.
// If selectCols is empty Find will return all columns.
func FindTweet(ctx context.Context, exec boil.ContextExecutor, iD string, selectCols ...string) (*Tweet, error) {
	tweetObj := &Tweet{}

	sel := "*"
	if len(selectCols) > 0 {
		sel = strings.Join(strmangle.IdentQuoteSlice(dialect.LQ, dialect.RQ, selectCols), ",")
	}
	query := fmt.Sprintf(
		"select %s from \"tweets\" where \"id\"=$1", sel,
	)

	q := queries.Raw(query, iD)

	err := q.Bind(ctx, exec, tweetObj)
	if err != nil {
		if errors.Cause(err) == sql.ErrNoRows {
			return nil, sql.ErrNoRows
		}
		return nil, errors.Wrap(err, "models: unable to select from tweets")
	}

	return tweetObj, nil
}

// Insert a single record using an executor.
// See boil.Columns.InsertColumnSet documentation to understand column list inference for inserts.
func (o *Tweet) Insert(ctx context.Context, exec boil.ContextExecutor, columns boil.Columns) error {
	if o == nil {
		return errors.New("models: no tweets provided for insertion")
	}

	var err error

	if err := o.doBeforeInsertHooks(ctx, exec); err != nil {
		return err
	}

	nzDefaults := queries.NonZeroDefaultSet(tweetColumnsWithDefault, o)

	key := makeCacheKey(columns, nzDefaults)
	tweetInsertCacheMut.RLock()
	cache, cached := tweetInsertCache[key]
	tweetInsertCacheMut.RUnlock()

	if !cached {
		wl, returnColumns := columns.InsertColumnSet(
			tweetColumns,
			tweetColumnsWithDefault,
			tweetColumnsWithoutDefault,
			nzDefaults,
		)

		cache.valueMapping, err = queries.BindMapping(tweetType, tweetMapping, wl)
		if err != nil {
			return err
		}
		cache.retMapping, err = queries.BindMapping(tweetType, tweetMapping, returnColumns)
		if err != nil {
			return err
		}
		if len(wl) != 0 {
			cache.query = fmt.Sprintf("INSERT INTO \"tweets\" (\"%s\") %%sVALUES (%s)%%s", strings.Join(wl, "\",\""), strmangle.Placeholders(dialect.UseIndexPlaceholders, len(wl), 1, 1))
		} else {
			cache.query = "INSERT INTO \"tweets\" %sDEFAULT VALUES%s"
		}

		var queryOutput, queryReturning string

		if len(cache.retMapping) != 0 {
			queryReturning = fmt.Sprintf(" RETURNING \"%s\"", strings.Join(returnColumns, "\",\""))
		}

		cache.query = fmt.Sprintf(cache.query, queryOutput, queryReturning)
	}

	value := reflect.Indirect(reflect.ValueOf(o))
	vals := queries.ValuesFromMapping(value, cache.valueMapping)

	if boil.DebugMode {
		fmt.Fprintln(boil.DebugWriter, cache.query)
		fmt.Fprintln(boil.DebugWriter, vals)
	}

	if len(cache.retMapping) != 0 {
		err = exec.QueryRowContext(ctx, cache.query, vals...).Scan(queries.PtrsFromMapping(value, cache.retMapping)...)
	} else {
		_, err = exec.ExecContext(ctx, cache.query, vals...)
	}

	if err != nil {
		return errors.Wrap(err, "models: unable to insert into tweets")
	}

	if !cached {
		tweetInsertCacheMut.Lock()
		tweetInsertCache[key] = cache
		tweetInsertCacheMut.Unlock()
	}

	return o.doAfterInsertHooks(ctx, exec)
}

// Update uses an executor to update the Tweet.
// See boil.Columns.UpdateColumnSet documentation to understand column list inference for updates.
// Update does not automatically update the record in case of default values. Use .Reload() to refresh the records.
func (o *Tweet) Update(ctx context.Context, exec boil.ContextExecutor, columns boil.Columns) (int64, error) {
	var err error
	if err = o.doBeforeUpdateHooks(ctx, exec); err != nil {
		return 0, err
	}
	key := makeCacheKey(columns, nil)
	tweetUpdateCacheMut.RLock()
	cache, cached := tweetUpdateCache[key]
	tweetUpdateCacheMut.RUnlock()

	if !cached {
		wl := columns.UpdateColumnSet(
			tweetColumns,
			tweetPrimaryKeyColumns,
		)

		if !columns.IsWhitelist() {
			wl = strmangle.SetComplement(wl, []string{"created_at"})
		}
		if len(wl) == 0 {
			return 0, errors.New("models: unable to update tweets, could not build whitelist")
		}

		cache.query = fmt.Sprintf("UPDATE \"tweets\" SET %s WHERE %s",
			strmangle.SetParamNames("\"", "\"", 1, wl),
			strmangle.WhereClause("\"", "\"", len(wl)+1, tweetPrimaryKeyColumns),
		)
		cache.valueMapping, err = queries.BindMapping(tweetType, tweetMapping, append(wl, tweetPrimaryKeyColumns...))
		if err != nil {
			return 0, err
		}
	}

	values := queries.ValuesFromMapping(reflect.Indirect(reflect.ValueOf(o)), cache.valueMapping)

	if boil.DebugMode {
		fmt.Fprintln(boil.DebugWriter, cache.query)
		fmt.Fprintln(boil.DebugWriter, values)
	}

	var result sql.Result
	result, err = exec.ExecContext(ctx, cache.query, values...)
	if err != nil {
		return 0, errors.Wrap(err, "models: unable to update tweets row")
	}

	rowsAff, err := result.RowsAffected()
	if err != nil {
		return 0, errors.Wrap(err, "models: failed to get rows affected by update for tweets")
	}

	if !cached {
		tweetUpdateCacheMut.Lock()
		tweetUpdateCache[key] = cache
		tweetUpdateCacheMut.Unlock()
	}

	return rowsAff, o.doAfterUpdateHooks(ctx, exec)
}

// UpdateAll updates all rows with the specified column values.
func (q tweetQuery) UpdateAll(ctx context.Context, exec boil.ContextExecutor, cols M) (int64, error) {
	queries.SetUpdate(q.Query, cols)

	result, err := q.Query.ExecContext(ctx, exec)
	if err != nil {
		return 0, errors.Wrap(err, "models: unable to update all for tweets")
	}

	rowsAff, err := result.RowsAffected()
	if err != nil {
		return 0, errors.Wrap(err, "models: unable to retrieve rows affected for tweets")
	}

	return rowsAff, nil
}

// UpdateAll updates all rows with the specified column values, using an executor.
func (o TweetSlice) UpdateAll(ctx context.Context, exec boil.ContextExecutor, cols M) (int64, error) {
	ln := int64(len(o))
	if ln == 0 {
		return 0, nil
	}

	if len(cols) == 0 {
		return 0, errors.New("models: update all requires at least one column argument")
	}

	colNames := make([]string, len(cols))
	args := make([]interface{}, len(cols))

	i := 0
	for name, value := range cols {
		colNames[i] = name
		args[i] = value
		i++
	}

	// Append all of the primary key values for each column
	for _, obj := range o {
		pkeyArgs := queries.ValuesFromMapping(reflect.Indirect(reflect.ValueOf(obj)), tweetPrimaryKeyMapping)
		args = append(args, pkeyArgs...)
	}

	sql := fmt.Sprintf("UPDATE \"tweets\" SET %s WHERE %s",
		strmangle.SetParamNames("\"", "\"", 1, colNames),
		strmangle.WhereClauseRepeated(string(dialect.LQ), string(dialect.RQ), len(colNames)+1, tweetPrimaryKeyColumns, len(o)))

	if boil.DebugMode {
		fmt.Fprintln(boil.DebugWriter, sql)
		fmt.Fprintln(boil.DebugWriter, args...)
	}

	result, err := exec.ExecContext(ctx, sql, args...)
	if err != nil {
		return 0, errors.Wrap(err, "models: unable to update all in tweet slice")
	}

	rowsAff, err := result.RowsAffected()
	if err != nil {
		return 0, errors.Wrap(err, "models: unable to retrieve rows affected all in update all tweet")
	}
	return rowsAff, nil
}

// Upsert attempts an insert using an executor, and does an update or ignore on conflict.
// See boil.Columns documentation for how to properly use updateColumns and insertColumns.
func (o *Tweet) Upsert(ctx context.Context, exec boil.ContextExecutor, updateOnConflict bool, conflictColumns []string, updateColumns, insertColumns boil.Columns) error {
	if o == nil {
		return errors.New("models: no tweets provided for upsert")
	}

	if err := o.doBeforeUpsertHooks(ctx, exec); err != nil {
		return err
	}

	nzDefaults := queries.NonZeroDefaultSet(tweetColumnsWithDefault, o)

	// Build cache key in-line uglily - mysql vs psql problems
	buf := strmangle.GetBuffer()
	if updateOnConflict {
		buf.WriteByte('t')
	} else {
		buf.WriteByte('f')
	}
	buf.WriteByte('.')
	for _, c := range conflictColumns {
		buf.WriteString(c)
	}
	buf.WriteByte('.')
	buf.WriteString(strconv.Itoa(updateColumns.Kind))
	for _, c := range updateColumns.Cols {
		buf.WriteString(c)
	}
	buf.WriteByte('.')
	buf.WriteString(strconv.Itoa(insertColumns.Kind))
	for _, c := range insertColumns.Cols {
		buf.WriteString(c)
	}
	buf.WriteByte('.')
	for _, c := range nzDefaults {
		buf.WriteString(c)
	}
	key := buf.String()
	strmangle.PutBuffer(buf)

	tweetUpsertCacheMut.RLock()
	cache, cached := tweetUpsertCache[key]
	tweetUpsertCacheMut.RUnlock()

	var err error

	if !cached {
		insert, ret := insertColumns.InsertColumnSet(
			tweetColumns,
			tweetColumnsWithDefault,
			tweetColumnsWithoutDefault,
			nzDefaults,
		)
		update := updateColumns.UpdateColumnSet(
			tweetColumns,
			tweetPrimaryKeyColumns,
		)

		if len(update) == 0 {
			return errors.New("models: unable to upsert tweets, could not build update column list")
		}

		conflict := conflictColumns
		if len(conflict) == 0 {
			conflict = make([]string, len(tweetPrimaryKeyColumns))
			copy(conflict, tweetPrimaryKeyColumns)
		}
		cache.query = buildUpsertQueryPostgres(dialect, "\"tweets\"", updateOnConflict, ret, update, conflict, insert)

		cache.valueMapping, err = queries.BindMapping(tweetType, tweetMapping, insert)
		if err != nil {
			return err
		}
		if len(ret) != 0 {
			cache.retMapping, err = queries.BindMapping(tweetType, tweetMapping, ret)
			if err != nil {
				return err
			}
		}
	}

	value := reflect.Indirect(reflect.ValueOf(o))
	vals := queries.ValuesFromMapping(value, cache.valueMapping)
	var returns []interface{}
	if len(cache.retMapping) != 0 {
		returns = queries.PtrsFromMapping(value, cache.retMapping)
	}

	if boil.DebugMode {
		fmt.Fprintln(boil.DebugWriter, cache.query)
		fmt.Fprintln(boil.DebugWriter, vals)
	}

	if len(cache.retMapping) != 0 {
		err = exec.QueryRowContext(ctx, cache.query, vals...).Scan(returns...)
		if err == sql.ErrNoRows {
			err = nil // Postgres doesn't return anything when there's no update
		}
	} else {
		_, err = exec.ExecContext(ctx, cache.query, vals...)
	}
	if err != nil {
		return errors.Wrap(err, "models: unable to upsert tweets")
	}

	if !cached {
		tweetUpsertCacheMut.Lock()
		tweetUpsertCache[key] = cache
		tweetUpsertCacheMut.Unlock()
	}

	return o.doAfterUpsertHooks(ctx, exec)
}

// Delete deletes a single Tweet record with an executor.
// Delete will match against the primary key column to find the record to delete.
func (o *Tweet) Delete(ctx context.Context, exec boil.ContextExecutor) (int64, error) {
	if o == nil {
		return 0, errors.New("models: no Tweet provided for delete")
	}

	if err := o.doBeforeDeleteHooks(ctx, exec); err != nil {
		return 0, err
	}

	args := queries.ValuesFromMapping(reflect.Indirect(reflect.ValueOf(o)), tweetPrimaryKeyMapping)
	sql := "DELETE FROM \"tweets\" WHERE \"id\"=$1"

	if boil.DebugMode {
		fmt.Fprintln(boil.DebugWriter, sql)
		fmt.Fprintln(boil.DebugWriter, args...)
	}

	result, err := exec.ExecContext(ctx, sql, args...)
	if err != nil {
		return 0, errors.Wrap(err, "models: unable to delete from tweets")
	}

	rowsAff, err := result.RowsAffected()
	if err != nil {
		return 0, errors.Wrap(err, "models: failed to get rows affected by delete for tweets")
	}

	if err := o.doAfterDeleteHooks(ctx, exec); err != nil {
		return 0, err
	}

	return rowsAff, nil
}

// DeleteAll deletes all matching rows.
func (q tweetQuery) DeleteAll(ctx context.Context, exec boil.ContextExecutor) (int64, error) {
	if q.Query == nil {
		return 0, errors.New("models: no tweetQuery provided for delete all")
	}

	queries.SetDelete(q.Query)

	result, err := q.Query.ExecContext(ctx, exec)
	if err != nil {
		return 0, errors.Wrap(err, "models: unable to delete all from tweets")
	}

	rowsAff, err := result.RowsAffected()
	if err != nil {
		return 0, errors.Wrap(err, "models: failed to get rows affected by deleteall for tweets")
	}

	return rowsAff, nil
}

// DeleteAll deletes all rows in the slice, using an executor.
func (o TweetSlice) DeleteAll(ctx context.Context, exec boil.ContextExecutor) (int64, error) {
	if o == nil {
		return 0, errors.New("models: no Tweet slice provided for delete all")
	}

	if len(o) == 0 {
		return 0, nil
	}

	if len(tweetBeforeDeleteHooks) != 0 {
		for _, obj := range o {
			if err := obj.doBeforeDeleteHooks(ctx, exec); err != nil {
				return 0, err
			}
		}
	}

	var args []interface{}
	for _, obj := range o {
		pkeyArgs := queries.ValuesFromMapping(reflect.Indirect(reflect.ValueOf(obj)), tweetPrimaryKeyMapping)
		args = append(args, pkeyArgs...)
	}

	sql := "DELETE FROM \"tweets\" WHERE " +
		strmangle.WhereClauseRepeated(string(dialect.LQ), string(dialect.RQ), 1, tweetPrimaryKeyColumns, len(o))

	if boil.DebugMode {
		fmt.Fprintln(boil.DebugWriter, sql)
		fmt.Fprintln(boil.DebugWriter, args)
	}

	result, err := exec.ExecContext(ctx, sql, args...)
	if err != nil {
		return 0, errors.Wrap(err, "models: unable to delete all from tweet slice")
	}

	rowsAff, err := result.RowsAffected()
	if err != nil {
		return 0, errors.Wrap(err, "models: failed to get rows affected by deleteall for tweets")
	}

	if len(tweetAfterDeleteHooks) != 0 {
		for _, obj := range o {
			if err := obj.doAfterDeleteHooks(ctx, exec); err != nil {
				return 0, err
			}
		}
	}

	return rowsAff, nil
}

// Reload refetches the object from the database
// using the primary keys with an executor.
func (o *Tweet) Reload(ctx context.Context, exec boil.ContextExecutor) error {
	ret, err := FindTweet(ctx, exec, o.ID)
	if err != nil {
		return err
	}

	*o = *ret
	return nil
}

// ReloadAll refetches every row with matching primary key column values
// and overwrites the original object slice with the newly updated slice.
func (o *TweetSlice) ReloadAll(ctx context.Context, exec boil.ContextExecutor) error {
	if o == nil || len(*o) == 0 {
		return nil
	}

	slice := TweetSlice{}
	var args []interface{}
	for _, obj := range *o {
		pkeyArgs := queries.ValuesFromMapping(reflect.Indirect(reflect.ValueOf(obj)), tweetPrimaryKeyMapping)
		args = append(args, pkeyArgs...)
	}

	sql := "SELECT \"tweets\".* FROM \"tweets\" WHERE " +
		strmangle.WhereClauseRepeated(string(dialect.LQ), string(dialect.RQ), 1, tweetPrimaryKeyColumns, len(*o))

	q := queries.Raw(sql, args...)

	err := q.Bind(ctx, exec, &slice)
	if err != nil {
		return errors.Wrap(err, "models: unable to reload all in TweetSlice")
	}

	*o = slice

	return nil
}

// TweetExists checks if the Tweet row exists.
func TweetExists(ctx context.Context, exec boil.ContextExecutor, iD string) (bool, error) {
	var exists bool
	sql := "select exists(select 1 from \"tweets\" where \"id\"=$1 limit 1)"

	if boil.DebugMode {
		fmt.Fprintln(boil.DebugWriter, sql)
		fmt.Fprintln(boil.DebugWriter, iD)
	}

	row := exec.QueryRowContext(ctx, sql, iD)

	err := row.Scan(&exists)
	if err != nil {
		return false, errors.Wrap(err, "models: unable to check if tweets exists")
	}

	return exists, nil
}
