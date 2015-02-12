var bodyParser = require('body-parser');
var passHelper = require( '../util/passport-helper' );

module.exports = function subsRoutes( app ) {
  var knex = app.get( 'knex' );
  var urlencodedParser = bodyParser.urlencoded({ extended: true });

  app.get( '/admin/subs/:page?', passHelper.isLoggedIn,
    function subs( req, res ) {
      if(req.params.page) {
        page = req.params.page;
      }
      else {
        page = 0;
      }
      knex('subs')
      .orderBy('replacement')
      .limit(10)
      .offset(page * 10)
      .then(function( subs ) {
        res.render( 'admin/subs.ect', {
          subs: subs,
          page: parseInt(page)
        });
      });
    }
  );

  app.get( '/admin/subs/edit/:id', passHelper.isLoggedIn,
    function subsEdit( req, res ) {
      knex('subs')
      .where({ 'id': req.params.id })
      .then(function( row ) {
        res.render('admin/subsEdit', {
          sub: row[0]
        });
      });
    }
  );

  app.post( '/admin/subs/save',
    [urlencodedParser, passHelper.isLoggedIn],
    function subsSave( req, res ) {
      knex('subs')
      .where({ 'id': req.body.id })
      .update({
        'regex': req.body.regex,
        'replacement': req.body.replacement
      })
      .then(res.status(200).end())
      .catch(function( error ) {
        console.log(error);
        res.status(418).end();
      });
    }
  );

  app.post( '/admin/subs/add', [urlencodedParser, passHelper.isLoggedIn],
    function subsAdd( req, res ) {
      knex('subs').insert({
        regex: req.body.regex,
        replacement: req.body.replacement
      })
      .then(res.status(200).end())
      .catch(function( error ) {
        res.status(418).end();
      });
    }
  );
};
