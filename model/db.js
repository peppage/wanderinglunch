var mongoose = require ('mongoose');

var truckSchema = new mongoose.Schema({
    name: String,
    twitname: String,
    lastupdate: Number,
    location: String,
    weburl: String,
    tweet: String
});

mongoose.model('Truck', truckSchema);

mongoose.connect( 'mongodb://localhost/foodtruck');