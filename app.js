var express = require('express');
var routes = require('./routes');
var region = require('./routes/region');
var all = require('./routes/alltrucks');
var truck = require('./routes/truck');
var debug = require('./routes/debug');
var statics = require('./routes/statics');
var stats = require('./routes/stats');
var http = require('http');
var path = require('path');
var moment = require('moment');
var lessMiddleware = require('less-middleware');

var app = express();

var cacheTime = 2592000000; //30 days

// all environments
app.set('port', process.env.PORT || 3001);
app.set('views', __dirname + '/views');
app.set('view engine', 'jade');
app.use(express.compress());
app.use(express.favicon(path.join(__dirname, 'public/images/favicon.ico')));
app.use(express.logger('dev'));
app.use(express.bodyParser());
app.use(express.methodOverride());
app.use(app.router);
app.enable('trust proxy');

// development only
if ('development' == app.get('env')) {
  app.use(express.errorHandler());
}

app.get('/', routes.index);
app.get('/region/:region', region.show);
app.get('/truck/:id', truck.show);
app.get('/alltrucks', all.show);
app.get('/about', statics.about);
app.get('/support', statics.support);
app.get('/debug', debug.show);
app.get('/stats', stats.show);

app.locals({
    prettyTime: function(lastUpdate) {
        return moment.unix(lastUpdate).fromNow();
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


app.configure(function () {
    app.use(lessMiddleware({
        src: __dirname + '/public',
        compress: true,
        force: false,
        once: true,
        optimization: 2
    }));
    

    app.use(express.static(path.join(__dirname, 'public'), {maxAge: cacheTime}));
});
