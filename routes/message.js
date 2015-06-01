var bodyParser = require('body-parser');
var passHelper = require( '../util/passport-helper' );

module.exports = function truckRoutes( app ) {
  var knex = app.get( 'knex' );
  var urlencodedParser = bodyParser.urlencoded({ extended: true });

  app.get( '/admin/message', passHelper.isLoggedIn, function message( req, res) {
    res.render( 'admin/message.ect', {
    });
  });

  app.post( '/admin/message/save',
    [urlencodedParser, passHelper.isLoggedIn],
    function messageSave( req, res ) {
      knex('messages')
      .insert({
        'message': req.body.message,
        'date': Math.floor((new Date).getTime()/1000),
      })
      .then(res.status(200).end())
      .catch(function( error ) {
        console.log(err);
        res.status(418).end();
      });
    }
  );
}
