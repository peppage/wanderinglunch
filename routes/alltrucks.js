var truckData = require('../model/trucks');

exports.show = function(req, res) {
    truckData.allTrucks( function(err, trucks) {
        res.render('alltrucks', {
            title: 'Wandering Lunch: NYC Food Truck Finder | All Trucks',
            id: 'alltrucks',
            trucks : trucks
        });
    });
};