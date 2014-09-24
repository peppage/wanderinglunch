var express = require( 'express' );
var passHelper = require( '../util/passport-helper' );

module.exports = function locRoutes( app, passport ) {
  var knex = app.get( 'knex' );

  app.get( '/admin/locations/:page?', passHelper.isLoggedIn,
    function locations(req, res) {
      if(req.param('page')) {
        page = req.param('page');
      }
      else {
        page = 0;
      }
      knex('locations')
      .orderBy('id')
      .limit(10)
      .offset(page * 10)
      .then(function( locs ) {
        res.render( 'admin/location.ect', {
          locs: locs,
          page: parseInt(page)
        });
      });
    }
  );

  app.post( '/admin/locations/add',
    [express.urlencoded(), passHelper.isLoggedIn],
    function locationAdd( req, res ) {
      knex('locations')
      .insert({
        'display': req.body.display,
        'matcher': req.body.matcher,
        'region': req.body.region,
        'lat': req.body.lat,
        'long': req.body.long,
        'hood': req.body.hood
      })
      .then(res.send(200))
      .catch(function( error ) {
        console.log(err);
        res.send(418);
      });
    }
  );

  app.get( '/admin/locations/edit/:id', passHelper.isLoggedIn,
    function locationEdit( req, res ) {
      knex('locations')
      .where({ 'id': req.param('id') })
      .then(function( row ) {
        res.render('admin/locationEdit', {
          location: row[0]
        });
      });
    }
  );

  app.post( '/admin/locations/save',
    [express.urlencoded(), passHelper.isLoggedIn],
    function locationSave( req, res ) {
      knex('locations')
      .where({ 'id': req.body.id })
      .update({
        'display': req.body.display,
        'matcher': req.body.matcher,
        'region': req.body.region,
        'lat': req.body.lat,
        'long': req.body.long,
        'hood': req.body.hood
      })
      .then(res.send(200))
      .catch(function( error ) {
        console.log(error);
        res.send(418);
      });
    }
  );
};
