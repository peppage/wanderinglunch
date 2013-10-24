var mongoose = require('mongoose');
var moment = require('moment');

exports.allTrucks = function allTrucks(callback) {
    var Truck = mongoose.model('Truck');
    var query = Truck.find({});
    query.sort('name');
    query.exec(function(err, trucks) {
        if(err) {
            console.log(err);
        } else {
            callback("", trucks);
        }
    });
};

exports.getRegion = function getRegion(region, callback) {
    var Truck = mongoose.model('Truck');
    Truck.find({'region' : region}, function(err, trucks) {
        if(err) {
            console.log(err);
        } else {
            callback("", trucks);
        }
    });
};

exports.getTruck = function getTruck(twitname, callback) {
    var Truck = mongoose.model('Truck');
    Truck.find({'twitname': twitname}, function(err, trucks) {
        if(err) {
            console.log(err);
        } else {
            callback("", trucks);
        }
    });
};

exports.upTrucks = function upTrucks(callback) {
    var Truck = mongoose.model('Truck');
    var query = Truck.find({'region' : 'up', 'lastupdate':{$gt : moment().subtract('hours', 8).unix()}});
    query.sort('street');
    query.exec(function(err, upTrucks) {
        if(err) {
            console.log(err);
        } else {
            callback("", upTrucks);
        }
    });
};

exports.midTrucks = function midTrucks(callback) {
    var Truck = mongoose.model('Truck');
    var query = Truck.find({'region' : 'mid', 'lastupdate':{$gt : moment().subtract('hours', 8).unix()}});
    query.sort('street');
    query.exec(function(err, midTrucks) {
        if(err) {
            console.log(err);
        } else {
            callback("", midTrucks);
        }
    });
};

exports.downTrucks = function downTrucks(callback) {
    var Truck = mongoose.model('Truck');
    var query = Truck.find({'region' : 'none', 'lastupdate':{$gt : moment().subtract('hours', 8).unix()}});
    query.sort('street');
    query.exec(function(err, downTrucks) {
        if(err) {
            console.log(err);
        } else {
            callback("", downTrucks);
        }
    });
};

exports.bkTrucks = function bkTrucks(callback) {
    var Truck = mongoose.model('Truck');
    var query = Truck.find({'region' : 'bkl', 'lastupdate':{$gt : moment().subtract('hours', 8).unix()}});
    query.sort('street');
    query.exec(function(err, bkTrucks) {
        if(err) {
            console.log(err);
        } else {
            callback("", bkTrucks);
        }
    });
};

exports.debug = function debug(callback) {
    var Truck = mongoose.model('Truck');
    var query = Truck.find({'lastupdate': {$lt: moment().subtract('days', 1).unix()}, 'lastTweet' : {$gt : moment().startOf('day').unix() }});
    query.sort('name');
    query.exec(function(err, debug) {
        if(err) {
            console.log(err);
        } else {
            callback("", debug);
        }
    });
};

exports.count = function count(callback) {
    var Truck = mongoose.model('Truck');
    var query = Truck.count();
    query.exec(function(err, q) {
        if(err) {
            console.log(err);
        } else {
            callback("", q);
        }
    });
};