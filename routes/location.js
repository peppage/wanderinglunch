var bodyParser = require('body-parser');
var passHelper = require( '../util/passport-helper' );

module.exports = function locRoutes( app, passport ) {
  var knex = app.get( 'knex' );
  var urlencodedParser = bodyParser.urlencoded({ extended: true });

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
    [urlencodedParser, passHelper.isLoggedIn],
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
      .then(res.status(200).end())
      .catch(function( error ) {
        console.log(err);
        res.status(418).end();
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
    [urlencodedParser, passHelper.isLoggedIn],
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
      .then(res.status(200).end())
      .catch(function( error ) {
        console.log(error);
        res.status(418).end();
      });
    }
  );
};
