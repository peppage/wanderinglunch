var truckData = require('../model/trucks');
var async = require('async');

exports.show = function(req, res) {

    async.parallel({
        total: async.apply(truckData.count),
    },
    function(err, results) {
            res.render('stats', {
            title: 'Wandering Lunch: NYC Food Truck Finder | Stats',
            id: 'stats',
            total: results['total']
        });
    });
};