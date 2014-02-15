var truckData = require('../model/trucks');

exports.show = function(req, res) {
    truckData.debug( function(err, debug) {
        truckData.invalidImages( function(err, images) {
            res.render('debug', {
                title: 'Wandering Lunch: NYC Food Truck Finder | debug',
                id: 'debug',
                trucks : debug,
                images: images
            });
        });
    });
};