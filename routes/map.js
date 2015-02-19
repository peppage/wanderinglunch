var moment = require('moment');

module.exports = function mapRoutes( app ) {
  var knex = app.get( 'knex' );

  app.get( '/updatedTrucks', function login( req, res ) {
    knex('trucks')
    .select(
      'trucks.id',
      'trucks.name',
      'locations.lat',
      'locations.long',
      'locations.display'
    )
    .rightJoin('locations', 'locations.id', 'trucks.loc')
    .where('lastupdate', '>', moment().subtract(8, 'hours').unix())
    .then(function(trucks) {
      res.send(trucks);
    });
  });

  app.get( '/map', function login( req, res ) {
    res.render( 'map.ect', {
      title: 'Wandering Lunch: NYC Food Truck Finder | Map',
      id: 'map',
    });
  });

};
