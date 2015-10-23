window.onscroll=function(){ checkShadow(); };

var API_URL = '/api';

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

function success(message) {
  var s = document.getElementsByClassName('success')[0];
  if (message == null) {
    s.innerText = 'Success!';
  }
  else {
    s.innerText = message;
  }
  s.classList.remove('hide');
  window.setTimeout(function() {
    s.classList.add('hide');
  }, 5000);
}

function error(errors) {
  var e = document.getElementsByClassName('error')[0];
  e.innerText = '';
  for(var x = 0; x < errors.length; x++) {
    e.innerText += errors[x].message;
  }
  e.classList.remove('hide');
  window.setTimeout(function() {
    e.classList.add('hide');
  }, 5000);
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

  $.ajax({
    dataType: 'json',
    url: API_URL + '/messages?amount=1',
    xhrFields: {
      withCredentials: true
    }
  }).done(function(data) {
    if (data.date > (new Date()).getTime() / 1000 - 604800) {
      var div = document.createElement('div');
      div.innerHTML = data.message;
      div.id = 'siteNews';
      div.className = 'mfp-hide white-popup';
      document.body.appendChild(div);
      var news = document.getElementsByClassName('js-siteNews')[0];
      news.classList.remove('hide');
      nav.magnificPopup({
        type:'inline',
        midClick: true // Allow opening popup on middle mouse click. Always set it to true if you don't provide alternative source in href.
      });
    }
  });
});

function indexModel() {
  var self = this;
  self.isLoaded = ko.observable(false);
  self.trucks = ko.observableArray([]);
  self.location = ko.observable();
  self.visible = ko.observableArray([]);

  if(localStorage.getItem('loc')) {
    self.location(localStorage.getItem('loc'));
  } else {
    self.location('Manhattan');
  }

  self.update = function() {
    $.ajax({
      dataType: 'json',
      url: API_URL + '/trucks?updated_since=8&sort=lat&sort_dir=desc',
      xhrFields: {
        withCredentials: true
      }
    }).done(function(data) {
      self.trucks(data);
      self.setVisible();
      self.isLoaded(true);
    });
  };

  self.update();

  self.setVisible = function() {
    localStorage.setItem('loc', self.location());
    self.visible.removeAll();
    for(var x = 0; x < self.trucks().length; x++) {
      if(self.trucks()[x].zone === self.location()) {
        self.visible.push(self.trucks()[x]);
      }
    }
    return true;
  };

  self.showMenu = function(truck) {
    $.magnificPopup.open({
      items: {
        src: 'https://irs0.4sqi.net/img/general/width960' + truck.image
      },
      type: 'image'
    }, 0);
  };

  setInterval(self.update, 900000);
}

function totalPages(arraySize, itemsPerPage) {
  var div = Math.floor(arraySize / itemsPerPage);
  div += arraySize % itemsPerPage > 0 ? 1 : 0;
  return div - 1;
}

ko.bindingHandlers.orderable = {
    getProperty: function(o, s) {
        // copied from http://stackoverflow.com/questions/6491463/accessing-nested-javascript-objects-with-string-key
        s = s.replace(/\[(\w+)\]/g, '.$1'); // convert indexes to properties
        s = s.replace(/^\./, '');           // strip a leading dot
        var a = s.split('.');
        while (a.length) {
            var n = a.shift();
            if (n in o) {
                o = o[n];
            } else {
                return;
            }
        }
        return o;
    },

    compare: function (left, right) {
        if (typeof left === 'string' || typeof right === 'string') {
            return left.localeCompare(right);
        }
        if (left > right)
            return 1;

        return left < right ? -1 : 0;
    },

    sort: function (viewModel, collection, field) {
        //make sure we sort only once and not for every binding set on table header
        if (viewModel[collection].orderField() == field) {
            viewModel[collection].sort(function (left, right) {
                var left_field = ko.bindingHandlers.orderable.getProperty(left, field);
                var right_field = ko.bindingHandlers.orderable.getProperty(right, field);
                var left_val  = (typeof  left_field === 'function') ?  left_field() :  left_field;
                    right_val = (typeof right_field === 'function') ? right_field() : right_field;
                if (viewModel[collection].orderDirection() == "desc") {
                    return ko.bindingHandlers.orderable.compare(right_val, left_val);
                } else {
                    return ko.bindingHandlers.orderable.compare(left_val, right_val);
                }
            });
        }
    },

    init: function (element, valueAccessor, allBindingsAccessor, viewModel, bindingContext) {
        //get provided options
        var collection = valueAccessor().collection;
        var field = valueAccessor().field;

        //add a few observables to ViewModel to track order field and direction
        if (viewModel[collection].orderField == undefined) {
            viewModel[collection].orderField = ko.observable();
        }
        if (viewModel[collection].orderDirection == undefined) {
            viewModel[collection].orderDirection = ko.observable("asc");
        }

        var defaultField = valueAccessor().defaultField;
        var defaultDirection = valueAccessor().defaultDirection || "asc";
        if (defaultField) {
            viewModel[collection].orderField(field);
            viewModel[collection].orderDirection(defaultDirection);
            ko.bindingHandlers.orderable.sort(viewModel, collection, field);
        }

        //set order observables on table header click
        $(element).click(function (e) {
            e.preventDefault();

            //flip sort direction if current sort field is clicked again
            if (viewModel[collection].orderField() == field) {
                if (viewModel[collection].orderDirection() == "asc") {
                    viewModel[collection].orderDirection("desc");
                } else {
                    viewModel[collection].orderDirection("asc");
                }
            }

            viewModel[collection].orderField(field);
        });

        //order records when observables changes, so ordering can be changed programmatically
        viewModel[collection].orderField.subscribe(function () {
            ko.bindingHandlers.orderable.sort(viewModel, collection, field);
        });
        viewModel[collection].orderDirection.subscribe(function () {
            ko.bindingHandlers.orderable.sort(viewModel, collection, field);
        });
    },

    update: function (element, valueAccessor, allBindingsAccessor, viewModel, bindingContext) {
        //get provided options
        var collection = valueAccessor().collection;
        var field = valueAccessor().field;
        var isOrderedByThisField = viewModel[collection].orderField() == field;

        //apply css binding programmatically
        ko.bindingHandlers.css.update(
            element,
            function () {
                return {
                    sorted: isOrderedByThisField,
                    asc: isOrderedByThisField && viewModel[collection].orderDirection() == "asc",
                    desc: isOrderedByThisField && viewModel[collection].orderDirection() == "desc"
                };
            },
            allBindingsAccessor,
            viewModel,
            bindingContext
        );
    }
};
