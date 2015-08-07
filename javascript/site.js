window.onscroll=function(){ checkShadow(); };

function checkShadow() {
  'use strict';
  var scroll = window.pageYOffset | document.body.scrollTop;
  var header = document.getElementsByTagName('header')[0];
  if (scroll > 0) {
  	if(!header.classList.contains('nav-shadow')) {
  		header.classList.add('nav-shadow');
  	}
 	}
  else {
  		if(header.classList.contains('nav-shadow')) {
  			header.classList.remove('nav-shadow');		
  		}
  }
}

document.addEventListener('DOMContentLoaded', function() {
  var menuItems = document.querySelectorAll('.dropItem');
  for(var x=0; x < menuItems.length; x++) {
    var hidden = menuItems[x].querySelector('.dropItem-sub');
    menuItems[x].onmouseover = function() {
      hidden.classList.add('is-shown');
    };
    menuItems[x].onmouseout = function() {
      hidden.classList.remove('is-shown');
    };
  }
});

function indexModel() {
  var self = this;
  self.trucks = ko.observableArray([]);
  self.location = ko.observable('manhattan');
  self.visible = ko.observableArray([]);

  $.getJSON('/api/trucks/current', function(data) {
    self.trucks(data);
    self.setVisible();
  });

  self.update = function() {
    $.getJSON('/api/trucks/current', function(data) {
      self.trucks(data);
      self.setVisible();
    });
  };

  self.setVisible = function() {
    self.visible.removeAll();
    for(var x = 0; x < self.trucks().length; x++) {
      if(self.trucks()[x].zone.toLowerCase() === self.location()) {
        self.visible.push(self.trucks()[x]);
      } 
    }
    return true;
  };
  setInterval(self.update, 900000);
}