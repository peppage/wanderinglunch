//Lifesaver:
// http://scotch.io/tutorials/javascript/easy-node-authentication-setup-and-local
var LocalStrategy = require( 'passport-local' ).Strategy;
var Bcrypt = require('bcrypt-nodejs');

module.exports = function passportConfig( app, passport ) {
  var knex = app.get( 'knex' );

  passport.serializeUser(function ( user, done ) {
    done( null, user.id );
  });

  passport.deserializeUser(function ( id, done ) {
    knex('users').where({ 'id': id })
      .then(function ( model ) {
        if ( model[0] === undefined ) {
          done( true, model[0] );
        } else {
          done( null, model[0] );
        }
      });
  });

  passport.use( 'local-signup', new LocalStrategy ({
    usernameField: 'email',
    passwordField: 'password',
    passReqToCallback: true
  },
  function signup( req, email, password, done ) {
    process.nextTick(function () {
      knex('users').where({ 'email': email })
        .then(function ( model ) {
          if ( model[0] !== undefined ) {
            return done(
              null,
              false,
              req.flash( 'signupMessage', 'That email is already taken' )
            );
          } else {
            knex('users').insert({
              'email': email,
              'password': Bcrypt.hashSync(password, Bcrypt.genSaltSync(8), null)
            })
            .returning('*')
            .then(function ( saveduser ) {
              return done( null, saveduser[0] );
            })
            .catch(function(error) {
              console.log(error);
            });
          }
        });
    });
  }));

  passport.use( 'local-login', new LocalStrategy ({
    usernameField: 'email',
    passwordField: 'password',
    passReqToCallback: true
  },
  function login( req, email, password, done ) {
    knex('users').where({ 'email': email })
      .then(function ( model ) {
        if ( model[0] === undefined ) {
          return done(
            null,
            false,
            req.flash( 'loginMessage', 'No user found.' )
          );
        }

        if ( !Bcrypt.compareSync(password, model[0].password) ) {
          return done(
            null,
            false,
            req.flash( 'loginMessage', 'Wrong password' )
          );
        }

        return done( null, model[0] );
      });
  }));
};
