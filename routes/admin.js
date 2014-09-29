var bodyParser = require('body-parser');
var passHelper = require( '../util/passport-helper' );

module.exports = function adminRoutes( app, passport ) {
  var knex = app.get( 'knex' );
  var urlencodedParser = bodyParser.urlencoded({ extended: true });

  require( './subs' )(app);
  require( './trucks' )(app);
  require( './location' )(app);

  app.get( '/login', function login( req, res ) {
    res.render( 'admin/login.ect', {
      title: 'Log in',
      section: 'login',
      message: req.flash( 'loginMessage' )
    });
  });

  app.post( '/login', urlencodedParser,
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
    res.status(404).end();
    /*
    res.render( 'admin/signup.ect', {
      title: 'Sign up',
      section: 'signup',
      message: req.flash( 'signupMessage' )
    });*/
  });

  app.post( '/signup', urlencodedParser,
    passport.authenticate( 'local-signup', {
      successRedirect: '/admin',
      failureRedirect: '/signup',
      failureFlash: true
    })
  );

  app.get( '/admin', passHelper.isLoggedIn, function admin( req, res ) {
    knex('trucks')
    .select('twitname', 'id')
    .where('lastupdate', '<', moment().subtract(1, 'days').unix())
    .andWhere('lasttweet', '>', moment().startOf('day').unix())
    .then(function( trucks ) {
      res.render('admin/admin', {
        title: 'Wandering Lunch: NYC Food Truck Finder | admin',
        id: 'admin',
        trucks : trucks
      });
    });
  });

  app.get('/admin/images', passHelper.isLoggedIn, function images( req, res) {
    knex.select(
      'images.id',
      'images.twitname',
      'images.suffix',
      'trucks.id as truckid'
    )
    .from('images')
    .innerJoin('trucks', 'images.twitname', 'trucks.twitname')
    .where('images.visibility', '!=', 'public')
    .then(function( images ) {
      res.render('admin/images', {
        title: 'Wandering Lunch: NYC Food Truck Finder | invalid images',
        id: 'images',
        images: images
      });
    });
  });

  app.post( '/admin/images/add', [urlencodedParser, passHelper.isLoggedIn],
    function( req, res ) {
      knex('images')
      .insert({
        'id': req.body.id,
        'visibility': 'public',
        'suffix': req.body.suffix,
        'twitname': req.body.twitname,
        'menu': req.body.menu
      })
      .then(res.status(200).end())
      .catch(function( error ) {
        console.log(error);
        res.status(418).end();
      });
    }
  );

  app.post( '/admin/images/delete', [urlencodedParser, passHelper.isLoggedIn],
    function( req, res ) {
      knex('images')
      .where({ id: req.body.id })
      .del()
      .then(res.status(200).end())
      .catch(function(error) {
        console.log(error);
        res.status(418).end();
      });
    }
  );

  app.get('/admin/fix/:twitname/:page?', passHelper.isLoggedIn,
    function fix( req, res ) {
      if(req.param('page')) {
        page = req.param('page');
      }
      else {
        page = 0;
      }

      knex('tweets')
      .where({ 'twitname': req.param('twitname') })
      .limit(10)
      .offset(page * 10)
      .orderBy('time', 'desc')
      .then(function( tweets ) {
        res.render('admin/fix', {
          title: 'Wandering Lunch: NYC Food Truck Finder | fixing a truck',
          id: 'fix',
          twitname: req.param('twitname'),
          tweets: tweets,
          page: parseInt(page)
        });
      });
    }
  );

  app.post('/admin/tweet/convert',
    [urlencodedParser, passHelper.isLoggedIn],
    function convert( req, res ) {
      knex('tweets').select('contents')
      .where({ id: req.body.id })
      .then(function( tweet ) {
        contents = tweet[0].contents;
        knex('subs')
        .then(function( subs) {
          subs.forEach(function(sub) {
            var re = new RegExp(sub.regex, 'gi');
            contents = contents.replace(re, sub.replacement);
          });
          res.send(200, contents);
        });
      });
    }
  );
};
