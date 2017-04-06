document.addEventListener("DOMContentLoaded", function() {
    var s = document.querySelector('.js-siteSwitch'); 
    if(s != null) {
        s.addEventListener('change', function(e) {
            var r = new XMLHttpRequest();
            r.open('GET', '/admin/setSite?site=' + s.value);
            r.onreadystatechange = function respHandler(data) {
                if (r.readyState != 4 || r.status != 200) return;
                location.reload();
            };
            r.send(null);
        });
    }

	var imgButton = document.querySelector('.js-getImages');
	if(imgButton != null) {
		imgButton.addEventListener('click', function(e) {
			var r = new XMLHttpRequest();
			r.open('GET', '/admin/foursquare?id='+e.srcElement.getAttribute('data-id'));
			r.onreadystatechange = function respHandler(data) {
				if(r.readyState != 4 || r.status != 200) return;
				console.log(r.responseText);
				var div = document.querySelector('.js-imageHolder');
				var images = JSON.parse(r.responseText);
				for(var x = 0; x < images.length; x++) {
					var img = images[x];
					var newImg = document.createElement('img');
					newImg.setAttribute('data-id', img.id);
					newImg.setAttribute('data-suffix', img.suffix);
					newImg.setAttribute('data-twitname', e.srcElement.getAttribute('data-twitname'));
					newImg.src = img.prefix + 'width100' + img.suffix;
					newImg.classList.add('js-addImage', 'foursquareImage');
					div.appendChild(newImg);
					newImg.addEventListener('click', function(e){
						console.log(e);
						var r = new XMLHttpRequest();
						r.open('POST', '/admin/image/add');
						r.onreadystatechange = function respHandler(data) {
							if(r.readyState != 4 || r.status != 200) return;
							console.log('ok');
						}
						var formData = new FormData();
						formData.append('id', e.srcElement.getAttribute('data-id'));
						formData.append('suffix', e.srcElement.getAttribute('data-suffix'));
						formData.append('twitname', e.srcElement.getAttribute('data-twitname')); 
						r.send(formData);
					});
				}
			}
			r.send(null);
		});
	}

	var queueDoneButtons = document.querySelectorAll('.js-queueDone');
	if(queueDoneButtons != null) {
		for(var x = 0; x < queueDoneButtons.length; x++) {
			queueDoneButtons[x].addEventListener('click', function markTweetDone(e) {
				e.preventDefault()
				var tweetId = e.srcElement.getAttribute('data-id');
				var r = new XMLHttpRequest();
				r.open('GET', '/admin/queue/done?id='+tweetId);
				r.onreadystatechange = function respHandler(data) {
					if(r.readyState != 4 || r.status != 200) return;
					var tableRows = document.querySelectorAll('tr');
					for(var y = 0; y < tableRows.length; y++) {
						if(tableRows[y].getAttribute('data-id') == tweetId) {
							tableRows[y].classList.add('hidden');
						}
					}
				}
				r.send(null);
			});
		}
	}
});

//http://codepen.io/chriscoyier/pen/tIuBL
(function(document) {
	'use strict';

	var LightTableFilter = (function(Arr) {

		var _input;

		function _onInputEvent(e) {
			_input = e.target;
			var tables = document.getElementsByClassName(_input.getAttribute('data-table'));
			Arr.forEach.call(tables, function(table) {
				Arr.forEach.call(table.tBodies, function(tbody) {
					Arr.forEach.call(tbody.rows, _filter);
				});
			});
		}

		function _filter(row) {
			var text = row.textContent.toLowerCase(), val = _input.value.toLowerCase();
			row.style.display = text.indexOf(val) === -1 ? 'none' : 'table-row';
		}

		return {
			init: function() {
				var inputs = document.getElementsByClassName('js-light-table-filter');
				Arr.forEach.call(inputs, function(input) {
					input.oninput = _onInputEvent;
				});
			}
		};
	})(Array.prototype);

	document.addEventListener('readystatechange', function() {
		if (document.readyState === 'complete') {
			LightTableFilter.init();
		}
	});

})(document);