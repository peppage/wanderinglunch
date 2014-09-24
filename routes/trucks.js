var express = require( 'express' );
var passHelper = require( '../util/passport-helper' );

module.exports = function truckRoutes( app, passport ) {
  var knex = app.get( 'knex' );

  app.get( '/admin/trucks/:page?', passHelper.isLoggedIn,
    function (req, res) {
      if(req.param('page')) {
        page = parseInt(req.param('page'));
      }
      else {
        page = 0;
      }
      knex('trucks')
      .select(
        'trucks.id',
        'locations.display',
        'trucks.name'
      )
      .leftJoin('locations', 'trucks.loc', 'locations.id')
      .orderBy('trucks.id')
      .limit(10)
      .offset(page * 10)
      .then(function( trucks ) {
        res.render( 'admin/trucks.ect', {
          trucks: trucks,
          page: page
        });
      });
    }
  );

  app.get( '/admin/trucks/edit/:id', passHelper.isLoggedIn,
    function truckEdit( req, res ) {
      knex('trucks')
      .where({ 'id': req.param('id') })
      .then(function( row ) {
        res.render('admin/truckEdit', {
          truck: row[0]
        });
      });
    }
  );

  app.post( '/admin/trucks/save',
    [express.urlencoded(), passHelper.isLoggedIn],
    function truckSave( req, res ) {
      knex('trucks')
      .where({ 'id': req.body.id })
      .update({
        'name': req.body.name,
        'twitname': req.body.twitname,
        'weburl': req.body.weburl,
        'matcher': req.body.matcher,
        'regex': req.body.regex,
        'type': req.body.type,
        'about': req.body.about,
        'foursquare': req.body.foursquare
      })
      .then(res.send(200))
      .catch(function( error ) {
        console.log(error);
        res.send(418);
      });
    }
  );

  app.post( '/admin/trucks/add', [express.urlencoded(), passHelper.isLoggedIn],
    function truckAdd( req, res ) {
      knex('trucks')
      .insert({
        'id': req.body.id,
        'name': req.body.name,
        'twitname': req.body.twitname,
        'weburl': req.body.weburl,
        'matcher': req.body.matcher,
        'regex': req.body.regex,
        'type': req.body.type,
        'about': req.body.about,
        'foursquare': req.body.foursquare
      })
      .then(res.send(200))
      .catch(function( error ) {
        console.log(error);
        res.send(418);
      });
    }
  );

  app.post( '/admin/trucks/delete',
    [express.urlencoded(), passHelper.isLoggedIn],
    function truckDelete( req, res ) {
      knex('trucks')
      .where({ 'id': req.body.id })
      .del()
      .then(res.send(200))
      .catch(function( error ) {
        console.log(error);
        res.send(418);
      });
    }
);
};
