---
---

randomHexColor = (len=3)->
  pattern = '0123456789ABCDEF'.split ''
  str     = '#'
  for i in [1..len]
    str += pattern[Math.round(Math.random() * pattern.length)]
  str

routes = {{ site.data.routes | jsonify }}

markers = {}

@initMap = =>

  map = new google.maps.Map document.getElementById("map"),
    center: lat: 55.91065407289999, lng: -3.1422134714844097
    zoom: 12

  socket = io.connect("https://bustracker.herokuapp.com:443")

  socket.on "bus", (vehicle) ->
    return if vehicle.one
    marker = markers[vehicle.vehicle_id] ?= new google.maps.Marker
      icon: "bus.svg"
      title: vehicle.service_name
      map: map
    marker.setPosition(lat: vehicle.latitude, lng: vehicle.longitude)

  for route in routes
    line = new google.maps.Polyline
      strokeColor: randomHexColor(6),
      path: for point in JSON.parse route.Points
        lat: point.Latitude, lng: point.Longitude
    line.setMap map
