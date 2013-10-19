var truckData = require('../model/trucks');

exports.show = function(req, res) {
    truckData.debug( function(err, debug) {
        res.render('alltrucks', {
            title: 'Wandering Lunch: NYC Food Truck Finder | debug',
            id: 'debug',
            trucks : debug
        });
    });
};