var moment = require('moment');
var pg = require('pg');
var conString = 'postgres://localhost/foodtruck';

exports.allTrucks = function allTrucks(callback) {
    pg.connect(conString, function(err, client, done) {
        if(err) {
            console.log(err);
        }
        client.query('SELECT * FROM trucks ORDER BY name', function(err, result) {
            done();
            if(err) {
                console.log(err);
            }
            callback("", result.rows);
        });
    });
};

exports.getRegion = function getRegion(region, callback) {
    pg.connect(conString, function(err, client, done) {
        if(err) {
            console.log(err);
        }
        client.query('SELECT * FROM trucks WHERE region = $1', [region], function(err, result) {
            done();
            if(err) {
                console.log(err);
            }
            callback("", result.rows);
        });
    });
};

exports.getTruck = function getTruck(twitname, callback) {
    pg.connect(conString, function(err, client, done) {
        if(err) {
            console.log(err);
        }
        client.query({name: "getTruck",
                      text: "SELECT * FROM trucks WHERE twitname = $1",
                      values:[twitname]}, function(err, result) {
            done();
            if(err) {
                console.log(err);
            }
            callback("", result.rows);
        });
    });
};

exports.upTrucks = function upTrucks(callback) {
    pg.connect(conString, function(err, client, done) {
        if(err) {
            console.log(err);
        }
        client.query({name: 'getTimedRegion',
                      text: 'SELECT * FROM trucks WHERE region = $1 AND lastupdate > $2',
                      values: ['up', moment().subtract('hours', 8).unix()]}, function(err, result) {
            done();
            if(err) {
                console.log(err);
            }
            callback("", result.rows);
        });
    });
};

exports.midTrucks = function midTrucks(callback) {
    pg.connect(conString, function(err, client, done) {
        if(err) {
            console.log(err);
        }
        client.query({name: 'getTimedRegion',
                      text: 'SELECT * FROM trucks WHERE region = $1 AND lastupdate > $2',
                      values: ['mid', moment().subtract('hours', 8).unix()]}, function(err, result) {
            done();
            if(err) {
                console.log(err);
            }
            callback("", result.rows);
        });
    });
};

exports.downTrucks = function downTrucks(callback) {
    pg.connect(conString, function(err, client, done) {
        if(err) {
            console.log(err);
        }
        client.query({name: 'getTimedRegion',
                      text: 'SELECT * FROM trucks WHERE region = $1 AND lastupdate > $2',
                      values: ['none', moment().subtract('hours', 8).unix()]}, function(err, result) {
            done();
            if(err) {
                console.log(err);
            }
            callback("", result.rows);
        });
    });
};

exports.bkTrucks = function bkTrucks(callback) {
    pg.connect(conString, function(err, client, done) {
        if(err) {
            console.log(err);
        }
        client.query({name: 'getTimedRegion',
                      text: 'SELECT * FROM trucks WHERE region = $1 AND lastupdate > $2',
                      values: ['bkl', moment().subtract('hours', 8).unix()]}, function(err, result) {
            done();
            if(err) {
                console.log(err);
            }
            callback("", result.rows);
        });
    });
};

exports.debug = function debug(callback) {
    pg.connect(conString, function(err, client, done) {
        if(err) {
            console.log(err);
        }
        client.query("SELECT * FROM trucks WHERE lastupdate < " +
                    moment().subtract('days', 1).unix() + " AND lasttweet > " + moment().startOf('day').unix() + ";", function(err, result) {
            done();
            if(err) {
                console.log(err);
            }
            callback("", result.rows);
        });
    });
};

exports.count = function count(callback) {
    pg.connect(conString, function(err, client, done) {
        if(err) {
            console.log(err);
        }
        client.query('SELECT * FROM trucks', function(err, result) {
            done();
            if(err) {
                console.log(err);
            }
            console.log(result);
            callback("", result.rowCount);
        });
    });
};