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
  };

  self.fix = function(tweet) {
    window.location.assign('/admin/location/new/' + tweet.id);
  };
}