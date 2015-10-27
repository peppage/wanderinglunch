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
		if (self.pageNumber() < self.totalPages()) {
			self.pageNumber(self.pageNumber() + 1);
		}
	};

	self.prev = function() {
		if (self.pageNumber() !== 0) {
			self.pageNumber(self.pageNumber() - 1);
		}
	};

	self.results = ko.computed(function() {
		if (self.tweets().length < self.perPage) {
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
	self.zones = ko.observableArray();

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
			for (var x = 0; x < json.errors.length; x++) {
				e.innerText += json.errors[x].message;
			}
			e.classList.remove('hide');
		});
		return true;
	};

	self.updateZones = function(site) {
		$.ajax({
			dataType: 'json',
			url: API_URL + '/zones?site=' + site,
			method: 'GET',
		}).done(function(data) {
			self.zones(data);
		});
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
		if (self.pageNumber() < self.totalPages()) {
			self.pageNumber(self.pageNumber() + 1);
		}
	};

	self.prev = function() {
		if (self.pageNumber() !== 0) {
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
		if (items.length < self.perPage) {
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
		if (self.pageNumber() < self.totalPages()) {
			self.pageNumber(self.pageNumber() + 1);
		}
	};

	self.prev = function() {
		if (self.pageNumber() !== 0) {
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
		if (items.length < self.perPage) {
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

function AdminTrucks() {
	var self = this;
	self.trucks = ko.observableArray([]);
	self.pageNumber = ko.observable(0);
	self.perPage = 10;
	self.query = ko.observable('');

	$.ajax({
		dataType: 'json',
		url: API_URL + '/trucks',
		xhrFields: {
			withCredentials: true
		}
	}).done(function(data) {
		self.trucks(data);
	});

	self.totalPages = ko.computed(function() {
		var div = Math.floor(self.trucks().length / self.perPage);
		div += self.trucks().length % self.perPage > 0 ? 1 : 0;
		return div - 1;
	});

	self.paginated = ko.computed(function() {
		var first = self.pageNumber() * self.perPage;
		return self.trucks().slice(first, first + self.perPage);
	});

	self.hasPrevious = ko.computed(function() {
		return self.pageNumber() !== 0;
	});

	self.hasNext = ko.computed(function() {
		return self.pageNumber() !== self.totalPages;
	});

	self.next = function() {
		if (self.pageNumber() < self.totalPages()) {
			self.pageNumber(self.pageNumber() + 1);
		}
	};

	self.prev = function() {
		if (self.pageNumber() !== 0) {
			self.pageNumber(self.pageNumber() - 1);
		}
	};

	self.delete = function(truck) {
		$.ajax({
			url: API_URL + '/trucks/' + truck.id,
			type: 'DELETE',
			xhrFields: {
				withCredentials: true
			}
		}).done(function(data) {
			self.trucks.remove(truck);
		}).fail(function(data) {

		});
	};

	self.results = ko.computed(function() {
		var items = ko.utils.arrayFilter(self.trucks(), function(item) {
			return item.name.toLowerCase().indexOf(self.query().toLowerCase()) >= 0;
		});
		if (items.length < self.perPage) {
			self.pageNumber(0);
		}
		var first = self.pageNumber() * self.perPage;
		return items.slice(first, first + self.perPage);
	});
}

function AdminEditTruck(id) {
	var self = this;
	self.truck = ko.observable({});
	self.truckImages = ko.observableArray([]);
	self.images = ko.observableArray([]);
	self.pageNumber = ko.observable(0);
	self.perPage = 10;

	$.ajax({
		dataType: 'json',
		url: API_URL + '/trucks/' + id,
		xhrFields: {
			withCredentials: true
		}
	}).done(function(data) {
		self.truck(data);
		self.truckImages(data.images);
	});

	self.save = function() {
		$.ajax({
			url: API_URL + '/trucks/' + id,
			method: 'PUT',
			data: ko.toJS(self.truck),
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

	self.delete = function(image) {
		$.ajax({
			url: API_URL + '/images/' + image.id,
			type: 'DELETE',
			xhrFields: {
				withCredentials: true
			}
		}).done(function(data) {
			self.truckImages.remove(image);
		}).fail(function(data) {

		});
	};

	self.getImages = function() {
		$.ajax({
			dataType: 'json',
			url: '/admin/foursquare/' + self.truck().foursquare,
			xhrFields: {
				withCredentials: true
			}
		}).done(function(data) {
			self.images(data);
		});
	};

	self.totalPages = ko.computed(function() {
		var div = Math.floor(self.images().length / self.perPage);
		div += self.images().length % self.perPage > 0 ? 1 : 0;
		return div - 1;
	});

	self.paginated = ko.computed(function() {
		var first = self.pageNumber() * self.perPage;
		return self.images().slice(first, first + self.perPage);
	});

	self.hasPrevious = ko.computed(function() {
		return self.pageNumber() !== 0;
	});

	self.hasNext = ko.computed(function() {
		return self.pageNumber() !== self.totalPages;
	});

	self.next = function() {
		if (self.pageNumber() < self.totalPages()) {
			self.pageNumber(self.pageNumber() + 1);
		}
	};

	self.prev = function() {
		if (self.pageNumber() !== 0) {
			self.pageNumber(self.pageNumber() - 1);
		}
	};

	self.page = ko.computed(function() {
		if (self.images().length < self.perPage) {
			self.pageNumber(0);
		}
		var first = self.pageNumber() * self.perPage;
		return self.images.slice(first, first + self.perPage);
	});

	self.addImage = function(image) {
		$.ajax({
			url: API_URL + '/images',
			method: 'POST',
			data: {
				id: image.id,
				suffix: image.suffix,
				twitname: self.truck().twitname
			},
			xhrFields: {
				withCredentials: true
			}
		}).done(function(data) {
			self.truckImages.push(data);
		}).fail(function(data) {

		});
	};

	self.editImage = function(image) {
		window.location.assign('/admin/image/' + image.id);
	};
}

function AdminAddTruck() {
	var self = this;
	self.truck = {
		id: ko.observable(),
		name: ko.observable(),
		twitname: ko.observable(),
		weburl: ko.observable(),
		type: ko.observable(),
		about: ko.observable(),
		foursquare: ko.observable(),
		matcher: ko.observable(),
		matchmethdo: ko.observable(),
		site: ko.observable()
	};

	self.save = function() {
		$.ajax({
			dataType: 'json',
			url: API_URL + '/trucks',
			method: 'POST',
			data: ko.toJS(self.truck),
			xhrFields: {
				withCredentials: true
			}
		}).done(function(data) {
			window.location = '/admin/truck/' + data.id;
		}).fail(function(data) {
			var json = data.responseJSON;
			var e = document.getElementsByClassName('error')[0];
			e.innerText = '';
			for (var x = 0; x < json.errors.length; x++) {
				e.innerText += json.errors[x].message;
			}
			e.classList.remove('hide');
		});
		return true;
	};
}

function InvalidImagesModel() {
	var self = this;
	self.images = ko.observableArray([]);

	$.ajax({
		dataType: 'json',
		url: API_URL + '/images?visibility=private',
		xhrFields: {
			withCredentials: true
		}
	}).done(function(data) {
		self.images(data);
	});

	self.delete = function(image) {
		$.ajax({
			dataType: 'json',
			url: API_URL + '/images/' + image.id,
			method: 'DELETE',
			xhrFields: {
				withCredentials: true
			}
		}).done(function(data) {
			self.images.remove(image);
		}).fail(function(data) {});
	};
}

function AdminEditImage(id) {
	var self = this;
	self.image = ko.observable({});

	$.ajax({
		dataType: 'json',
		url: API_URL + '/images/' + id,
		xhrFields: {
			withCredentials: true
		}
	}).done(function(data) {
		self.image(data);
	});

	self.save = function() {
		$.ajax({
			dataType: 'json',
			method: 'PUT',
			url: API_URL + '/images/' + id,
			data: ko.toJS(self.image),
			xhrFields: {
				withCredentials: true
			}
		}).done(function(data) {

		}).fail(function(data) {

		});
		return true;
	};
}

function AdminMessage() {
	var self = this;
	self.message = ko.observable({});

	$.ajax({
		dataType: 'json',
		url: API_URL + '/messages?amount=1',
		xhrFields: {
			withCredentials: true
		}
	}).done(function(data) {
		self.message(data);
	});

	self.save = function() {
		$.ajax({
			dataType: 'json',
			url: API_URL + '/messages',
			method: 'POST',
			data: ko.toJS(self.message),
			xhrFields: {
				withCredentials: true
			}
		}).done(function(data) {
			self.message(data);
		}).fail(function(data) {

		});
		return true;
	};
}