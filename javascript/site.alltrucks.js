function AllTrucksModel() {
		var self = this;
		self.isLoaded = ko.observable(false);
		self.trucks = ko.observableArray([]);
		self.query = ko.observable('');

		$.ajax({
			dataType: 'json',
			url: API_URL + '/trucks?updated_since=1440',
			xhrFields: {
			  withCredentials: true
			}
		}).done(function(data) {
			self.trucks(data);
  			self.trucks.orderDirection('asc');
  			self.trucks.orderField('name');
  			self.isLoaded(true);
		});

		self.results = ko.computed(function() {
			var items = ko.utils.arrayFilter(self.trucks(), function(item) {
				return item.name.toLowerCase().indexOf(self.query().toLowerCase()) >= 0;
			});
			return items;
		});

		self.showMenu = function(truck) {
			$.magnificPopup.open({
			  items: {
			    src: 'https://irs0.4sqi.net/img/general/width960' + truck.image
			  },
			  type: 'image'
			}, 0);
		};
	}
