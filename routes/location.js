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

  app.get( 'admin/locations/add', passHelper.isLoggedIn,
    function locAdd( req, res ) {
      knex('locations')
      .insert({
        'display': req.body.display,
        'matcher': req.body.matcher,
        'region': req.body.region,
        'lat': req.body.lat,
        'long': req.body.long
      })
      .then(res.send(200))
      .catch(function( error ) {
        console.log(err);
        res.send(418);
      });
    }
  );
};
