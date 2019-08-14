// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
function initMap(lat, lng) {
    var myCoords = new google.maps.LatLng(lat, lng);
    var mapOptions = {
    center: myCoords,
    zoom: 14
    };
    var map = new google.maps.Map(document.getElementById('map'), mapOptions);

    var infoWindow = new google.maps.InfoWindow;

// Try HTML5 geolocation.
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };

      infoWindow.setPosition(pos);
      infoWindow.setContent('👋  You are here!');
      var marker = new google.maps.Marker({position: pos, map: map});
      infoWindow.open(map, marker);
      map.setCenter(pos);
    }, function() {
      handleLocationError(true, infoWindow, map.getCenter());
    });
  } else {
    // Browser doesn't support Geolocation
    handleLocationError(false, infoWindow, map.getCenter());
  }

  // adds markers for submitted locations
  for(var i = 0; i < gon.ally_place.length; i++){
      var marker = new google.maps.Marker({
        position: { lat: Number(gon.ally_place[i].latitude), lng: Number(gon.ally_place[i].longitude) },
        title: gon.ally_place[i].name,
        map: map
      });

      marker.addListener('click', function () {
          var infoWindow = new google.maps.InfoWindow;
          infoWindow.open(map, marker);
      });
    }
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
  infoWindow.setPosition(pos);
  infoWindow.setContent(browserHasGeolocation ?
                        'Error: The Geolocation service failed.' :
                        'Error: Your browser doesn\'t support geolocation.');
  infoWindow.open(map);
}

// add function that iterates through rails db and populates markers on load
