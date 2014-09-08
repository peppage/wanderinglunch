var express = require( 'express' );
var passHelper = require( '../util/passport-helper' );

module.exports = function adminRoutes( app, passport ) {
  var knex = app.get( 'knex' );

  require( './subs' )(app);
  require( './trucks' )(app);

  app.get( '/login', function login( req, res ) {
    res.render( 'admin/login.ect', {
      title: 'Log in',
      section: 'login',
      message: req.flash( 'loginMessage' )
    });
  });

  app.post( '/login', express.urlencoded(),
    passport.authenticate( 'local-login', {
      successRedirect: '/admin',
      failureRedirect: '/login',
      failureFlash: true
    })
  );

  app.get( '/logout', function logout( req, res ) {
    req.logout();
    res.redirect( '/' );
  });

  app.get( '/signup', function signup( req, res ) {
    res.render( 'admin/signup.ect', {
      title: 'Sign up',
      section: 'signup',
      message: req.flash( 'signupMessage' )
    });
  });

  app.post( '/signup', express.urlencoded(),
    passport.authenticate( 'local-signup', {
      successRedirect: '/admin',
      failureRedirect: '/signup',
      failureFlash: true
    })
  );

  app.get( '/admin', passHelper.isLoggedIn, function admin( req, res ) {
    res.render( 'admin/admin.ect', {

    });
  });

  app.get('/admin/debug', passHelper.isLoggedIn, function debug( req, res ) {
    knex('trucks')
    .where('lastupdate', '<', moment().subtract(1, 'days').unix())
    .andWhere('lasttweet', '>', moment().startOf('day').unix())
    .then(function( trucks ) {
      knex.select('images.id', 'images.twitname', 'trucks.id as truckid')
      .from('images')
      .innerJoin('trucks', 'images.twitname', 'trucks.twitname')
      .where('images.visibility', '!=', 'public')
      .then(function( images ) {
        res.render('admin/debug', {
          title: 'Wandering Lunch: NYC Food Truck Finder | debug',
          id: 'debug',
          trucks : trucks,
          images: images
        });
      });
    });
  });
};
