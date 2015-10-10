---
---

stops = {{ site.data.stops | jsonify }}

@initMap = =>
  map = new google.maps.Map document.getElementById("map"),
    center: lat: 55.9411418, lng: -3.2754227
    zoom: 12

  for stop in stops
    new google.maps.Marker
      position: lat: stop.Latitude, lng: stop.Longitude
      map: map
      titile: stop.Name
