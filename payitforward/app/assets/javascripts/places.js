// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var addr = "";
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
  var infowindow = new google.maps.InfoWindow();
  for(var i = 0; i < gon.ally_place.length; i++){
      var marker = new google.maps.Marker({
        position: { lat: Number(gon.ally_place[i].latitude), lng: Number(gon.ally_place[i].longitude) },
        title: gon.ally_place[i].name,
        map: map
      });

      var name = gon.ally_place[i].name ? gon.ally_place[i].name : " ";
      var category = gon.ally_place[i].category ? gon.ally_place[i].category : " ";
      var hours_of_operation = gon.ally_place[i].hours_of_operation ? gon.ally_place[i].hours_of_operation : " ";
      var description = gon.ally_place[i].description ? gon.ally_place[i].description : " ";

      var contentString =
      '<h3>' + name + '</h3>'  + '<br>' +
      '<strong>Food Category: </strong>'+ category + '<br>' +
      '<strong>Hours of Operation: </strong>'+ hours_of_operation + '<br>' +
      '<strong>Description: </strong>'+ description + '<br>' +
      '<a href="https://www.weebly.com/app/website/cms/drafts/9PL2yBEW28s5185lE6oKf4QL168/product/pizza-slice/2" target = "_blank">Pay it Forward</a>';

      //getAddress(gon.ally_place[i].latitude, gon.ally_place[i].longitude);
      google.maps.event.addListener(marker, 'click', getInfoCallback(map, contentString));
  }
}

function getAddress (latitude, longitude) {
  geocodeLatLng(latitude, longitude, function (data) {
    returnCallback(data);
  });
}

function geocodeLatLng(latitude, longitude, callback) {
    var geocoder = new google.maps.Geocoder;
    var latlng = {lat: parseFloat(latitude), lng: parseFloat(longitude)};
    geocoder.geocode({'location': latlng}, function(results, status) {
      if (status === 'OK') {
        if (results[0]) {
          callback(results[0].formatted_address);
        } else {
          window.alert('No address found: ' + status);
        }
      } else {
        window.alert('Geocoder failed due to: ' + status);
      }
    });
  }

function getInfoCallback(map, content) {
    var infowindow = new google.maps.InfoWindow({content: content});
    return function() {
            infowindow.setContent(content);
            infowindow.open(map, this);
        };
}

function returnCallback(data) {
  //console.log("ayo");
  addr = data;
  console.log(addr);
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
  infoWindow.setPosition(pos);
  infoWindow.setContent(browserHasGeolocation ?
                        'Error: The Geolocation service failed.' :
                        'Error: Your browser doesn\'t support geolocation.');
  infoWindow.open(map);
}

// add function that iterates through rails db and populates markers on load
