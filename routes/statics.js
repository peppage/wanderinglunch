
module.exports = function staticRoutes( app ) {
  app.route('/about')
    .get(function about( req, res ) {
      res.render('about', {
        title: 'Wandering Lunch: NYC Food Truck Finder | About',
        id: 'about'
      });
    });

  app.route('/support')
    .get(function statistics( req, res ) {
      res.render('support', {
        title: 'Wandering Lunch: NYC Food Truck Finder | Support',
        id: 'support'
      });
    });
};
