var truckData = require('../model/trucks');

exports.show = function(req, res) {
  truckData.getRegion(req.params.region, function(err, trucks) {
    res.render('region', {
      title: 'test',
      trucks : trucks
    });
  });
};