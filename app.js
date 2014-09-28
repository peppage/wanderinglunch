var express = require('express');
var compression = require('compression');
var favicon = require('serve-favicon');
var morgan = require('morgan');
var cookieParser = require('cookie-parser');
var session = require('express-session');
var serveStatic = require('serve-static');
var http = require('http');
var path = require('path');
var passport = require('passport');
var flash = require('connect-flash');
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
require('./config/passport')(app, passport);

var cacheTime = 2592000000; //30 days

// all environments
app.set('port', 3001);
app.engine('.ect', ectRenderer.render);
app.set('view engine', 'ect');
app.use(compression());
app.use(favicon(path.join(__dirname, 'public/images/favicon.ico')));
app.use(morgan('dev'));
//app.use(express.methodOverride());
app.use(cookieParser());
app.use(session({
  resave: true,
  secret: 'Ought&Fence&34&&',
  key: 'sid',
  cookie: { secure: false },
  saveUninitialized: true
}));
app.use(passport.initialize());
app.use(passport.session());
app.use(flash());
app.use(lessMiddleware({
  src: path.join(__dirname, '/public'),
  compress: true,
  force: false,
  once: true,
  optimization: 2
}));
app.use(serveStatic(path.join(__dirname, 'public'), {maxAge: cacheTime}));
app.enable('trust proxy');

require('./routes.js')(app, passport);

app.listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});
