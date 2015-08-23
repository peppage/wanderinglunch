function AdminFixModel(id) {
  var self = this;
  self.tweets = ko.observableArray();
  self.pageNumber = ko.observable(0);
  self.perPage = 5;
  self.id = id;

  $.getJSON(API_URL + '/trucks/' + id + '/tweets?with_subs=1', function(data) {
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