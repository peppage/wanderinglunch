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
  self.location = ko.observable('manhatten');
  self.visible = ko.observableArray();

  $.getJSON('/api/trucks/current', function(data) {
    self.trucks(data);
    self.setVisible();
  });

  self.update = function() {
    $.getJSON('/api/trucks/current', function(data) {
      self.trucks(data);
      self.setVisible();
    });
  }

  self.setVisible = function() {
    self.visible.removeAll();
    for(var x = 0; x < self.trucks().length; x++) {
      if(self.trucks()[x].zone.toLowerCase() === self.location()) {
        self.visible.push(self.trucks()[x]);
      } 
    }
    return true;
  }
  setInterval(self.update, 900000);
}