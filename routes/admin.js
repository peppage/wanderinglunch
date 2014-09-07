var express = require( 'express' );

module.exports = function adminRoutes( app, passport ) {
  var knex = app.get( 'knex' );

  app.get( '/login', function login( req, res ) {
    res.render( 'admin/login.ect', {
      title: 'Log in',
      section: 'login',
      message: req.flash( 'loginMessage' )
    });
  });

  app.post( '/login', express.urlencoded(),
    passport.authenticate( 'local-login', {
      successRedirect: '/profile',
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
      successRedirect: '/profile',
      failureRedirect: '/signup',
      failureFlash: true
    })
  );

};
