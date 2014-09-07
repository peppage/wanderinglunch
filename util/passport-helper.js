function isLoggedIn( req, res, next ) {
  if ( req.isAuthenticated()) {
    return next();
  }
  res.redirect( '/login' );
}

function isAdmin( req, res, next ) {
  if ( req.isAuthenticated() && req.user.admin ) {
    return next();
  }
  res.redirect( '/login' );
}

exports.isLoggedIn = isLoggedIn;
exports.isAdmin = isAdmin;
