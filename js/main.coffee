---
---

stops = {{ site.data.stops | jsonify }}
routes = {{ site.data.routes | jsonify }}

@initMap = =>
  map = new google.maps.Map document.getElementById("map"),
    center: lat: 55.9411418, lng: -3.2754227
    zoom: 12

  for route in routes
    line = new google.maps.Polyline
      path: for point in JSON.parse route.Points
        lat: point.Latitude, lng: point.Longitude
    line.setMap map

  for stop in stops
    new google.maps.Marker
      position: lat: stop.Latitude, lng: stop.Longitude
      map: map
      titile: stop.Name
