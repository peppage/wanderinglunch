function AdminAds() {
	var self = this;
	self.ads = ko.observableArray([]);
	self.pageNumber = ko.observable(0);
	self.perPage = 10;
	self.query = ko.observable('');

	$.ajax({
		dataType: 'json',
		url: API_URL + '/ads',
		xhrFields: {
			withCredentials: true
		}
	}).done(function(data) {
		self.ads(data);
	});

	self.totalPages = ko.computed(function() {
		var div = Math.floor(self.ads().length / self.perPage);
		div += self.ads().length % self.perPage > 0 ? 1 : 0;
		return div - 1;
	});

	self.paginated = ko.computed(function() {
		var first = self.pageNumber() * self.perPage;
		return self.ads().slice(first, first + self.perPage);
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

	self.delete = function(ad) {
		$.ajax({
			url: API_URL + '/ads/' + ad.id,
			type: 'DELETE',
			xhrFields: {
				withCredentials: true
			}
		}).done(function(data) {
			self.ads.remove(ad);
		}).fail(function(data) {

		});
	};

	self.results = ko.computed(function() {
		var items = ko.utils.arrayFilter(self.ads(), function(item) {
			return item.name.toLowerCase().indexOf(self.query().toLowerCase()) >= 0;
		});
		if (items.length < self.perPage) {
			self.pageNumber(0);
		}
		var first = self.pageNumber() * self.perPage;
		return items.slice(first, first + self.perPage);
	});
}

function AdminAddAd() {
	var self = this;
	self.shapes = ['banner', 'square'];
	self.photoUrl = ko.observable();
	self.ad = {
		name: ko.observable(),
		value: ko.observable(),
		validuntil: ko.observable(),
		shape: ko.observable(),
		site: ko.observable(),
	};

	this.fileUpload = function(data, e) {
        var file    = e.target.files[0];
        var reader  = new FileReader();

        reader.onloadend = function (onloadend_e) {
           //var result = reader.result; // Here is your base 64 encoded file. Do with it what you want.
           var formData = new FormData();
		   formData.append('files', file);
           $.ajax({
			    url: API_URL + '/upload',
			    data: formData,
			    cache: false,
			    contentType: false,
			    processData: false,
			    type: 'POST',
			    success: function(data){
			        self.photoUrl(data.path[0]);
			    }
			});
        };

        if(file) {
            reader.readAsDataURL(file);
        }
    };
	
	self.save = function() {
		$.ajax({
			url: API_URL + '/ads',
			method: 'POST',
			data: ko.toJS(self.ad),
			xhrFields: {
      			withCredentials: true
    		}
		}).done(function(data) {
			window.location.assign('/admin/ads');
		}).fail(function(data) {
			
		});
		return true;
	};
}

function AdminEditAd(id) {
	var self = this;
	self.ad = ko.observable({});
	self.shapes = ['banner', 'square'];

	$.ajax({
		dataType: 'json',
		url: API_URL + '/ads/' + id,
	}).done(function(data) {
		self.ad(data);
	});

	self.save = function() {
		$.ajax({
			dataType: 'json',
			method: 'PUT',
			url: API_URL + '/ads/' + id,
			data: ko.toJS(self.ad),
		}).done(function(data) {
			success();
		}).fail(function(data) {
			var json = data.responseJSON;
			error(json.errors);
		});
		return true;
	};
}