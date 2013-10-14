var express = require('express');
var routes = require('./routes');
var region = require('./routes/region');
var all = require('./routes/alltrucks');
var truck = require('./routes/truck');
var statics = require('./routes/statics');
var http = require('http');
var path = require('path');
var db = require('./model/db');
var moment = require('moment');

var app = express();

var oneDay = 86400000;

// all environments
app.set('port', process.env.PORT || 3000);
app.set('views', __dirname + '/views');
app.set('view engine', 'jade');
app.use(express.favicon(path.join(__dirname, "public/images/favicon.ico")));
app.use(express.logger('dev'));
app.use(express.bodyParser());
app.use(express.methodOverride());
app.use(app.router);
app.use(express.compress());
app.use(express.static(path.join(__dirname, 'public'), {maxAge: oneDay}));
app.enable('trust proxy');

// development only
if ('development' == app.get('env')) {
  app.use(express.errorHandler());
}

app.get('/', routes.index);
app.get('/region/:region', region.show);
app.get('/truck/:twitname', truck.show);
app.get('/alltrucks', all.show);
app.get('/about', statics.about);
app.get('/support', statics.support);

app.locals({
    prettyTime: function(lastUpdate) {
        return moment.unix(lastUpdate).fromNow(true);
        /*var now = (new Date().getTime()) / 1000;
        var timePast = Math.round((now - lastUpdate) / 60);

        if(timePast < 60) {
            timePast = timePast.toString() + " m";
        } else if(timePast > 60 && timePast < 604800) {
            timePast = Math.round(timePast / 60).toString() + " h";
        } else {
            timePast = Math.round(timePast / 60 ).toString() + " w";
        }
        return timePast;*/
        //return timePast % 86400 + "d";
        //return new Date().valueOf();

    }
});

http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});
