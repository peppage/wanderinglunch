exports.about = function(req, res) {
  res.render('about', {
    title: 'Wandering Lunch: NYC Food Truck Finder | About',
    id: 'about'
  });
};

exports.support = function(req, res) {
  res.render('support', {
    title: 'Wandering Lunch: NYC Food Truck Finder | Support',
    id: 'support'
  });
};