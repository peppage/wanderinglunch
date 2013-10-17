var mongoose = require('mongoose');

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
    var query = Truck.find({'region' : 'up', 'lastupdate':{$gt : ((new Date().getTime()) / 1000) - 28800}});
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
    var query = Truck.find({'region' : 'mid', 'lastupdate':{$gt : ((new Date().getTime()) / 1000) - 28800}});
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
    var query = Truck.find({'region' : 'none', 'lastupdate':{$gt : ((new Date().getTime()) / 1000) - 28800}});
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
    var query = Truck.find({'region' : 'bkl', 'lastupdate':{$gt : ((new Date().getTime()) / 1000) - 28800}});
    query.sort('street');
    query.exec(function(err, bkTrucks) {
        if(err) {
            console.log(err);
        } else {
            callback("", bkTrucks);
        }
    });
};