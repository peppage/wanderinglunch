var truckData = require('../model/trucks');

exports.show = function(req, res) {
    truckData.getTruck(req.params.twitname, function(err, truck) {
        res.render('truck', {
            title: 'test',
            truck : truck
        });
    });
};