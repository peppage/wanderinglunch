var map;
var markers = [];
var infoWindow;
var activeMarker;

function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
        center: { lat: lat, lng: long },
        zoom: 12
    });
    infoWindow = new google.maps.InfoWindow({
        content: '',
    });

    setMarkers(map, trucks);
    google.maps.event.addListener(map, 'click', function () {

    });
    google.maps.event.addListener(map, "mouseover", function () {

    });
    google.maps.event.addListener(map, "mouseout", function () {

    });
    google.maps.event.addListener(infoWindow, 'closeclick', function () {
        activeMarker = null;
    });
}

function render(display, title) {
    return '<h3>' + display + '</h3>' + title;
}

function getMarkerAt(latLng) {
    for (var j = 0; j < markers.length; j++) {
        if (latLng.lat() === markers[j].position.lat() && latLng.lng() === markers[j].position.lng()) {
            return markers[j];
        }
    }
}

function setMarkers(map, locations) {
    for (var i = 0; i < locations.length; i++) {
        var loc = locations[i];
        var myLatLng = new google.maps.LatLng(loc.lat, loc.long);

        var existingMarker = getMarkerAt(myLatLng);

        if (existingMarker != null) {
            existingMarker.infoWindowContent += '<a href="/truck/' + loc.id + '" />' + loc.name + '</a><br>';

        } else {
            var marker = new google.maps.Marker({
                position: myLatLng,
                map: map,
                zIndex: 1,
                infoWindowContent: render(loc.display, '<a href="/truck/' + loc.id + '" />' + loc.name + '</a><br>'),
                id: loc.id,
            });

            markers.push(marker);

            google.maps.event.addListener(marker, 'click', function () {
                if (infoWindow.getContent() != '') {
                    infoWindow.setContent('');
                    infoWindow.close();
                    activeMarker = null;
                }

                infoWindow.setContent(this.infoWindowContent);
                infoWindow.open(map, this);
                activeMarker = this;
            });

            google.maps.event.addListener(marker, 'mouseover', function () {
                if (activeMarker == undefined) {
                    infoWindow.setContent(this.infoWindowContent);
                    infoWindow.open(map, this);
                }
            });

            google.maps.event.addListener(marker, 'mouseout', function () {
                if (infoWindow.getContent() === this.infoWindowContent && activeMarker != this) {
                    infoWindow.setContent("");
                    infoWindow.close();
                }
            });
        }
    }
}