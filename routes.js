var moment = require('moment');
var async = require('async');
var statics = require('./routes/statics');

module.exports = function routes( app, passport ) {
  var knex = app.get( 'knex' );
  var validImages = knex('images')
      .select('twitname', 'suffix')
      .where({ menu: true, visibility: 'public'});

  require('./routes/statics')(app);
  require('./routes/admin')(app, passport);

  app.get('/', function index( req, res ) {
    var data = [];
    data.up = [];
    data.mid = [];
    data.none = [];
    data.bkl = [];

    knex
    .select(
      'trucks.id',
      'name',
      'trucks.twitname',
      'tweet',
      'locations.region',
      'locations.display',
      'retweeted',
      'lastupdate',
      'suffix'
    )
    .from(validImages.clone().as('imgtwit'))
    .rightJoin('trucks', 'imgtwit.twitname', 'trucks.twitname')
    .rightJoin('locations', 'locations.id', 'trucks.loc')
    .where('lastupdate', '>', moment().subtract(8, 'hours').unix())
    .orderBy('lat')
    .then(function( trucks ) {
      trucks.forEach(function(truck) {
        try {
          data[truck.region].push(truck);
        }
        catch (err) {
          console.log('Region Error ' + err);
        }
      });
      res.render('index', {
          title: 'Wandering Lunch: NYC Food Truck Finder',
          id: '/',
          upTrucks: data.up,
          midTrucks: data.mid,
          downTrucks: data.none,
          bkTrucks: data.bkl
      });
    });
  });

  app.get('/region/:region', function region( req, res ) {
    knex('trucks').where({ 'region': req.param('region') })
    .then(function( trucks ) {
      res.send(404);
      res.render('region', {
        title: 'test',
        trucks : trucks
      });
    });
  });

  app.get('/truck/:id', function trucks( req, res ) {
    knex('trucks')
    .select(
      'trucks.id',
      'name',
      'tweet',
      'display',
      'twitname',
      'lastupdate',
      'about',
      'weburl',
      'type',
      'foursquare'
    )
    .leftJoin('locations', 'trucks.loc', 'locations.id')
    .where({ 'trucks.id': req.param('id') })
    .then(function( truck ) {
      knex('tweets').where({ twitname: truck[0].twitname })
      .orderBy('time', 'desc').limit(6)
      .then(function( tweets ) {
        knex('images').select('suffix', 'menu')
        .where({ twitname: truck[0].twitname, visibility: 'public' })
        .orderByRaw('menu desc nulls last')
        .then(function( images ) {
          menu = null;
          if(images.length > 0 && images[0].menu) {
            menu = images[0];
            images.splice(0, 1);
          }
          res.render('truck', {
            title: truck[0].name + ' Wandering Lunch',
            truck : truck[0],
            tweets : tweets,
            menu : menu,
            images : images
          });
        });
      });
    });
  });

  app.get('/alltrucks', function allTrucks( req, res ) {
    knex
    .select(
      'trucks.id',
      'name',
      'tweet',
      'trucks.twitname',
      'locations.display',
      'lastupdate',
      'suffix'
    )
    .from(validImages.clone().as('imgtwit'))
    .rightJoin('trucks', 'imgtwit.twitname', 'trucks.twitname')
    .leftJoin('locations', 'locations.id', 'trucks.loc')
    .orderBy('name')
    .then(function( trucks ) {
      res.render('alltrucks', {
        title: 'Wandering Lunch: NYC Food Truck Finder | All Trucks List',
        id: 'alltrucks',
        trucks : trucks
      });
    });
  });

  app.get('/stats', function stats( req, res ) {
    knex('trucks').count()
    .then(function( count ) {
      res.render('stats', {
        title: 'Wandering Lunch: NYC Food Truck Finder | Stats',
        id: 'stats',
        total: count[0].count
      });
    });
  });
};
