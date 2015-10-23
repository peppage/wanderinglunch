function truckModel(id) {
		var self = this;
		self.truck = ko.observable({});
		self.tweets = ko.observableArray([]);
		self.others = ko.observableArray([]).extend({ rateLimit: 50 });
		update(id);

		function update(truckId) {
			$.ajax({
				dataType: 'json',
				url: API_URL + '/trucks/' + truckId,
				xhrFields: {
				  withCredentials: true
				}
			}).done(function(data) {
				$('#images').trigger('destroy.owl.carousel').removeClass('owl-carousel owl-loaded');
				$('#images').find('.owl-stage-outer').children().unwrap();
				$('#images').empty();
				if(screen.width < 750) {
					data.images = [];
				}
				self.truck(data);
				self.tweets(data.tweets.slice(0, 5));

				var loopable = false;
				if(data.images && data.images.length > 1) {
					loopable = true;
				} else if(!data.images) {
          $('.gallery').addClass('hide');
        }

				$('#images').owlCarousel({
					items: 1,
					loop: loopable,
					nav: true,
					navText: [
						'Prev',
						'Next'
					],
					lazyLoad: true,
					dots: true,
					animateIn: 'fadeIn',
					animateOut: 'fadeOut',
					itemClass: 'owl-item',
				});

				$.ajax({
					dataType: 'json',
					url: API_URL + '/trucks?updated_since=8&location_id=' + data.loc,
					xhrFields: {
					  withCredentials: true
					}
				}).done(function(d) {
					self.others.removeAll();
					for(var y = 0; y < d.length; y++) {
						if(d[y].id !== self.truck().id) {
							self.others.push(d[y]);
						}
					}
				});
			});
		}

		self.switch = function(truck) {
			window.scrollTo(0, 0);
			window.history.pushState(null, 'Wandering Lunch: NYC Food Truck Finder | ' + truck.name, '/truck/' + truck.id);
			update(truck.id);
		};
	}
