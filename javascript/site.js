window.onscroll=function(){ checkShadow(); };

function checkShadow() {
  'use strict';
  var scroll = window.pageYOffset | document.body.scrollTop;
  var header = document.getElementsByTagName('header')[0];
  if (scroll > 0) {
  	if(!header.classList.contains('nav-shaodw')) {
  		header.classList.add('nav-shadow');
  	}
 	}
  else {
  		if(header.classList.contains('nav-shadow')) {
  			header.classList.remove('nav-shadow');		
  		}
  }
}

function AdminFixModel(twitname) {
  var self = this;
  self.tweets = ko.observableArray();
  self.page = 0;
  self.twitname = twitname;

  $.getJSON('/api/trucks/' + twitname + '/converted/' + self.page, function(data) {
    self.tweets(data);
  });

  self.nextPage = function() {
    self.page = self.page + 1;
    $.getJSON('/api/trucks/' + twitname + '/converted/' + self.page, function(data) {
      self.tweets(data);
    });
  }

  self.fix = function(tweet) {
    window.location.assign('/admin/location/new/' + tweet.Id)
  }
}