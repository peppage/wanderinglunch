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

function indexModel() {
  var self = this;
  self.trucks = ko.observableArray();
  self.showTables = ko.observable(false);
  self.location = ko.observable('manhatten');
  self.visible = ko.observableArray();

  $.getJSON('/api/trucks/current', function(data) {
    self.trucks(data);
    if(data && data.length > 0) {
        self.showTables(true);
    }
    self.setVisible();
  });

  self.update = function() {
    $.getJSON('/api/trucks/current', function(data) {
      self.trucks(data);
      if(data && data.length > 0) {
          self.showTables(true);
      } else {
        self.showTables(false);
      }
    });
  }

  self.setVisible = function() {
    console.log(self.location());
    self.visible.removeAll();
    for(var x = 0; x < self.trucks().length; x++) {
      if(self.trucks()[x].Hood.String.toLowerCase() === self.location()) {
        self.visible.push(self.trucks()[x]);
      } 
    }
    return true;
  }
  setInterval(self.update, 900000);
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