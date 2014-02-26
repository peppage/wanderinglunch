var truckData = require('../model/trucks');

exports.show = function(req, res) {
  truckData.getTruck(req.params.id, function(err, truck) {
    truckData.getTweets(truck[0].twitname, function(err, tweets) {
      truckData.getImages(truck[0].twitname, function(err, images) {
        menu = null;
        if(images.length > 0 && images[0].menu) {
          menu = images[0];
          images.splice(0, 1);
        }
        res.render('truck', {
          title: truck[0].name + ' Wandering Lunch',
          truck : truck,
          tweets : tweets,
          menu : menu,
          images : images
        });
      });
    });
  });
};