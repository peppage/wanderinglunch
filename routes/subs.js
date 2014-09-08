var express = require( 'express' );
var passHelper = require( '../util/passport-helper' );

module.exports = function subsRoutes( app ) {
  var knex = app.get( 'knex' );

  app.get( '/admin/subs/:page?', passHelper.isLoggedIn,
    function subs( req, res ) {
      if(req.param('page')) {
        page = req.param('page');
      }
      else {
        page = 0;
      }
      knex('subs')
      .limit(10)
      .offset(page)
      .then(function( subs ) {
        res.render( 'admin/subs.ect', {
          subs: subs,
          page: page
        });
      });
    }
  );

  app.get( '/admin/subs/edit/:id', passHelper.isLoggedIn,
    function subsEdit( req, res ) {
      knex('subs')
      .where({ 'id': req.param('id') })
      .then(function( row ) {
        res.render('admin/subsEdit', {
          sub: row[0]
        });
      });
    }
  );

  app.post( '/admin/subs/save',
    [express.urlencoded(), passHelper.isLoggedIn],
    function subsSave( req, res ) {
      knex('subs')
      .where({ 'id': req.body.id })
      .update({
        'regex': req.body.regex,
        'replacement': req.body.replacement
      })
      .then(res.send(200))
      .catch(function( error ) {
        console.log(error);
        res.send(418);
      });
    }
  );

  app.post( '/admin/subs/add', [express.urlencoded(), passHelper.isLoggedIn],
    function subsAdd( req, res ) {
      knex('subs').insert({
        regex: req.body.regex,
        replacement: req.body.replacement
      })
      .then(res.send(200))
      .catch(function( error ) {
        res.send(418);
      });
    }
  );
};
