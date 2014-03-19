var moment = require('moment');
var pg = require('pg');
var conString = 'postgres://localhost/foodtruck';

exports.allTrucks = function allTrucks(callback) {
  pg.connect(conString, function(err, client, done) {
    if(err) {
      console.log(err);
    }
      //jshint multistr: true
      client.query('SELECT id, name, twitname, weburl, tweet, street, location, retweeted, lastupdate, suffix \
        FROM trucks LEFT JOIN (SELECT twitname as imgtwit, suffix FROM images WHERE menu AND visibility=$1) AS \
        images ON (trucks.twitname = imgtwit) ORDER BY name;', ['public'], function( err, result) {
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

exports.getTruck = function getTruck(id, callback) {
  pg.connect(conString, function(err, client, done) {
    if(err) {
      console.log(err);
    }
    client.query({name: "getTruck",
            text: "SELECT * FROM trucks WHERE id = $1",
            values:[id]}, function(err, result) {
      done();
      if(err) {
        console.log(err);
      }
      callback("", result.rows);
    });
  });
};

exports.getTweets = function getTweets(twitname, callback) {
  pg.connect(conString, function(err, client, done) {
    if(err) {
      console.log(err);
    }
    client.query({name: "getTweets",
            text: "SELECT * FROM tweets WHERE twitname = $1 ORDER BY time DESC LIMIT 6",
            values:[twitname]}, function(err, result) {
      done();
      if(err) {
        console.log(err);
      }
      callback('', result.rows);
    });
  });
};

exports.getImages = function getImages(twitname, callback) {
  pg.connect(conString, function(err, client, done) {
    if(err) {
      console.log(err);
    }
    client.query({name: "getImages",
            text: "SELECT * FROM images WHERE twitname = $1 AND visibility='public' ORDER BY menu DESC NULLS LAST",
            values:[twitname]}, function(err, result) {
      done();
      if(err) {
        console.log(err);
      }
      callback('', result.rows);
    });
  });
};

exports.upTrucks = function upTrucks(callback) {
  pg.connect(conString, function(err, client, done) {
    if(err) {
      console.log(err);
    }
    client.query({name: 'getTimedRegion',
            text: 'SELECT id, name, twitname, weburl, tweet, street, location, retweeted, lastupdate, suffix \
                   FROM trucks LEFT JOIN (SELECT twitname as imgtwit, suffix FROM images WHERE menu AND visibility=$3) AS \
                   images ON (trucks.twitname = imgtwit) WHERE region = $1 AND lastupdate > $2 ORDER BY street;',
            values: ['up', moment().subtract('hours', 8).unix(), 'public']}, function(err, result) {
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
            text: 'SELECT id, name, twitname, weburl, tweet, street, location, retweeted, lastupdate, suffix \
                   FROM trucks LEFT JOIN (SELECT twitname as imgtwit, suffix FROM images WHERE menu AND visibility=$3) AS \
                   images ON (trucks.twitname = imgtwit) WHERE region = $1 AND lastupdate > $2 ORDER BY street;',
            values: ['mid', moment().subtract('hours', 8).unix(), 'public']}, function(err, result) {
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
            text: 'SELECT id, name, twitname, weburl, tweet, street, location, retweeted, lastupdate, suffix \
                   FROM trucks LEFT JOIN (SELECT twitname as imgtwit, suffix FROM images WHERE menu AND visibility=$3) AS \
                   images ON (trucks.twitname = imgtwit) WHERE region = $1 AND lastupdate > $2 ORDER BY street;',
            values: ['none', moment().subtract('hours', 8).unix(), 'public']}, function(err, result) {
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
            text: 'SELECT id, name, twitname, weburl, tweet, street, location, retweeted, lastupdate, suffix \
                   FROM trucks LEFT JOIN (SELECT twitname as imgtwit, suffix FROM images WHERE menu AND visibility=$3) AS \
                   images ON (trucks.twitname = imgtwit) WHERE region = $1 AND lastupdate > $2 ORDER BY street;',
            values: ['bkl', moment().subtract('hours', 8).unix(), 'public']}, function(err, result) {
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
      callback("", result.rowCount);
    });
  });
};

exports.invalidImages = function invalidImages(callback) {
  pg.connect(conString, function(err, client, done) {
    if(err) {
      console.log(err);
    }
    //jshint multistr: true
    client.query('select distinct on (images.id) images.twitname, images.id, trucks.id as \
      truckid from images left join trucks on (images.twitname = trucks.twitname) where \
      visibility != $1;', ['public'], function (err, result) {
      done();
      if(err) {
        console.log(err);
      }
      callback("", result.rows);
    });
  });
};
