
module.exports = function staticRoutes( app ) {
  app.get('/about', function about( req, res ) {
    res.render('about', {
      title: 'Wandering Lunch: NYC Food Truck Finder | About',
      id: 'about'
    });
  });

  app.get('/support', function statistics( req, res ) {
    res.render('support', {
      title: 'Wandering Lunch: NYC Food Truck Finder | Support',
      id: 'support'
    });
  });
};
