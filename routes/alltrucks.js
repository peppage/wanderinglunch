var truckData = require('../model/trucks');

exports.show = function(req, res) {
    truckData.allTrucks( function(err, trucks) {
        res.render('alltrucks', {
            title: 'test',
            id: 'alltrucks',
            trucks : trucks
        });
    });
};