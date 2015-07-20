'use strict';

$(window).scroll(function() {
  var scroll = $(window).scrollTop();
  if (scroll > 0) {
      $('header').addClass('nav-shadow');
  }
  else {
      $('header').removeClass('nav-shadow');
  }
});
