var truckData = require('../model/trucks');
var async = require('async');

exports.index = function(req, res){
    
    async.parallel({
        upTrucks: async.apply(truckData.upTrucks),
        midTrucks: async.apply(truckData.midTrucks),
        downTrucks: async.apply(truckData.downTrucks),
        bkTrucks: async.apply(truckData.bkTrucks)
    },
    function(err, results) {
        res.render('index', {
            title: 'Wandering Lunch: NYC Food Truck Finder',
            id: '/',
            upTrucks: results['upTrucks'],
            midTrucks: results['midTrucks'],
            downTrucks: results['downTrucks'],
            bkTrucks: results['bkTrucks']
        });
    });
};