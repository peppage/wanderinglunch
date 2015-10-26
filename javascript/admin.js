function AdminFixModel(id) {
  var self = this;
  self.tweets = ko.observableArray();
  self.pageNumber = ko.observable(0);
  self.perPage = 5;
  self.id = id;

  $.ajax({
    dataType: 'json',
    url: API_URL + '/trucks/' + id + '/tweets?with_subs=1',
    xhrFields: {
      withCredentials: true
    }
  }).done(function(data) {
    self.tweets(data);
  });

  self.totalPages = ko.computed(function() {
      var div = Math.floor(self.tweets().length / self.perPage);
      div += self.tweets().length % self.perPage > 0 ? 1 : 0;
      return div - 1;
    });

    self.paginated = ko.computed(function() {
      var first = self.pageNumber() * self.perPage;
      return self.tweets().slice(first, first + self.perPage);
    });

    self.hasPrevious = ko.computed(function() {
      return self.pageNumber() !== 0;
    });

    self.hasNext = ko.computed(function() {
      return self.pageNumber() !== self.totalPages;
    });

    self.next = function() {
      if(self.pageNumber() < self.totalPages()) {
        self.pageNumber(self.pageNumber() + 1);
      }
    };

    self.prev = function() {
      if(self.pageNumber() !== 0) {
        self.pageNumber(self.pageNumber() - 1);
      }
    };

    self.results = ko.computed(function() {
      if(self.tweets().length < self.perPage) {
        self.pageNumber(0);
      }
      var first = self.pageNumber() * self.perPage;
      return self.tweets.slice(first, first + self.perPage);
    });
}

function AdminAddLoc(tweetid) {
    var self = this;
    self.tweet = ko.observable();
    self.loc = {
      display: ko.observable(),
      matcher: ko.observable(),
      region: ko.observable(),
      lat: ko.observable(),
      long: ko.observable(),
      hood: ko.observable(),
      zone: ko.observable(),
      site: ko.observable(),
    };

    $.ajax({
        dataType: 'json',
        url: API_URL + '/tweets/' + tweetid + '?with_subs=1',
        xhrFields: {
            withCredentials: true
        }
      }).done(function(data) {
        self.tweet(data.contents);
      });

    self.save = function() {
      $.ajax({
          dataType: 'json',
          url: API_URL + '/locations',
          method: 'POST',
          data: ko.toJS(self.loc),
          xhrFields: {
              withCredentials: true
          }
        }).done(function(data) {
        window.location = '/admin/location/' + data.id;
        }).fail(function(data) {
          var json = data.responseJSON;
        var e = document.getElementsByClassName('error')[0];
        e.innerText = '';
        for(var x = 0; x < json.errors.length; x++) {
          e.innerText += json.errors[x].message;
        }
        e.classList.remove('hide');
        });
      return true;
    };
  }

  function AdminEditSub(id) {
    var self = this;
    self.sub = ko.observable({});

    $.ajax({
        dataType: 'json',
        url: API_URL + '/subs/' + id,
        xhrFields: {
            withCredentials: true
        }
      }).done(function(data) {
        self.sub(data);
      });

    self.save = function() {
      $.ajax({
          url: API_URL + '/subs/' + id,
          method: 'PUT',
          data: ko.toJS(self.sub),
          xhrFields: {
              withCredentials: true
          }
      }).done(function(data) {

      }).fail(function(data) {

      });
      return true;
    };
  }

  function AdminSubs() {
    var self = this;
    self.subs = ko.observableArray([]);
    self.pageNumber = ko.observable(0);
    self.perPage = 10;
    self.query = ko.observable('');

    $.ajax({
        dataType: 'json',
        url: API_URL + '/subs',
        xhrFields: {
            withCredentials: true
        }
      }).done(function(data) {
        self.subs(data);
      });

    self.totalPages = ko.computed(function() {
      return totalPages(self.subs().length, self.perPage);
    });

    self.paginated = ko.computed(function() {
      var first = self.pageNumber() * self.perPage;
      return self.subs().slice(first, first + self.perPage);
    });

    self.hasPrevious = ko.computed(function() {
      return self.pageNumber() !== 0;
    });

    self.hasNext = ko.computed(function() {
      return self.pageNumber() !== self.totalPages;
    });

    self.next = function() {
      if(self.pageNumber() < self.totalPages()) {
        self.pageNumber(self.pageNumber() + 1);
      }
    };

    self.prev = function() {
      if(self.pageNumber() !== 0) {
        self.pageNumber(self.pageNumber() - 1);
      }
    };

    self.delete = function(sub) {
      $.ajax({
          url: API_URL + '/subs/' + sub.id,
          type: 'DELETE',
          xhrFields: {
              withCredentials: true
          }
      }).done(function(data) {
        self.subs.remove(sub);
      }).fail(function(data) {

      });
    };

    self.results = ko.computed(function() {
      var items = ko.utils.arrayFilter(self.subs(), function(item) {
        return item.replacement.toLowerCase().indexOf(self.query().toLowerCase()) >= 0;
      });
      if(items.length < self.perPage) {
        self.pageNumber(0);
      }
      var first = self.pageNumber() * self.perPage;
      return items.slice(first, first + self.perPage);
    });
  }

  function AdminLocs() {
    var self = this;
    self.locs = ko.observableArray([]);
    self.pageNumber = ko.observable(0);
    self.perPage = 10;
    self.query = ko.observable('');

    $.ajax({
        dataType: 'json',
        url: API_URL + '/locations',
        xhrFields: {
            withCredentials: true
        }
      }).done(function(data) {
        self.locs(data);
      });

    self.totalPages = ko.computed(function() {
      var div = Math.floor(self.locs().length / self.perPage);
      div += self.locs().length % self.perPage > 0 ? 1 : 0;
      return div - 1;
    });

    self.paginated = ko.computed(function() {
      var first = self.pageNumber() * self.perPage;
      return self.locs().slice(first, first + self.perPage);
    });

    self.hasPrevious = ko.computed(function() {
      return self.pageNumber() !== 0;
    });

    self.hasNext = ko.computed(function() {
      return self.pageNumber() !== self.totalPages;
    });

    self.next = function() {
      if(self.pageNumber() < self.totalPages()) {
        self.pageNumber(self.pageNumber() + 1);
      }
    };

    self.prev = function() {
      if(self.pageNumber() !== 0) {
        self.pageNumber(self.pageNumber() - 1);
      }
    };

    self.delete = function(loc) {
      $.ajax({
          url: API_URL + '/locations/' + loc.id,
          type: 'DELETE',
          xhrFields: {
              withCredentials: true
          }
      }).done(function(data) {
        self.locs.remove(loc);
      }).fail(function(data) {

      });
    };

    self.results = ko.computed(function() {
      var items = ko.utils.arrayFilter(self.locs(), function(item) {
        return item.display.toLowerCase().indexOf(self.query().toLowerCase()) >= 0;
      });
      if(items.length < self.perPage) {
        self.pageNumber(0);
      }
      var first = self.pageNumber() * self.perPage;
      return items.slice(first, first + self.perPage);
    });
  }

  function AdminEditLoc(id) {
    var self = this;
    self.loc = ko.observable({});

    $.ajax({
        dataType: 'json',
        url: API_URL + '/locations/' + id,
        xhrFields: {
            withCredentials: true
        }
      }).done(function(data) {
        self.loc(data);
      });

    self.save = function() {
      $.ajax({
          dataType: 'json',
          url: API_URL + '/locations/' + id,
          method: 'PUT',
          data: ko.toJS(self.loc),
          xhrFields: {
              withCredentials: true
          }
        }).done(function(data) {
        success();
        }).fail(function(data) {
        var json = data.responseJSON;
        error(json.errors);
        });
      return true;
    };
  }