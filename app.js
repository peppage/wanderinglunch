var express = require('express');
var http = require('http');
var path = require('path');
var ect = require('ect');
var ectRenderer = ect({
  watch: true,
  gzip: true,
  root: __dirname + '/views'
});
var lessMiddleware = require('less-middleware');
var configDB = require('./config/database.js');
var knex = require('knex')(configDB);

var app = express();

app.set('knex', knex);

var cacheTime = 2592000000; //30 days

// all environments
app.set('port', process.env.PORT || 3001);
app.set('views', __dirname + '/views');
app.engine('.ect', ectRenderer.render);
app.set('view engine', 'ect');
app.use(express.compress());
app.use(express.favicon(path.join(__dirname, 'public/images/favicon.ico')));
app.use(express.logger('dev'));
app.use(express.methodOverride());
app.use(app.router);
app.enable('trust proxy');

// development only
if ('development' == app.get('env')) {
  app.use(express.errorHandler());
}

require('./routes.js')(app);

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
