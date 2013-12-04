var truckData = require('../model/trucks');

exports.show = function(req, res) {
    truckData.getTruck(req.params.id, function(err, truck) {
        truckData.getTweets(truck[0].twitname, function(err, tweets) {
            truckData.getImages(truck[0].twitname, function(err, images) {
                res.render('truck', {
                    title: truck[0].name + ' Wandering Lunch',
                    truck : truck,
                    tweets : tweets,
                    images : images
                });
            });
        });
    });
};