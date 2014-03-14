$(document).ready(function(){
  if (($("div#map-info").length > 0)){
      navigator.geolocation.getCurrentPosition(onSuccess, onError, {
        enableHighAccuracy: true,
        timeout: 200000,
        maximumAge: 120000
      })

      function onSuccess(position){
        var user_lat = position.coords.latitude;
        var user_lng = position.coords.longitude;
        var point_lat = $('#map-info').data("lat")
        var point_lng = $('#map-info').data("lon")
        if(user_lat < 37.639830 || user_lat > 37.9298240 || user_lng < -123.173825 || user_lng > -122.281780){
          user_lat = point_lat;
          user_lng = point_lng;
        }
        var zoom = 13;
        if ('ontouchstart' in document.documentElement){
          var zoom = 14;
          user_lat = point_lat;
          user_lng = point_lng;
        }
        var map = L.map('map').setView([user_lat,user_lng], zoom);
          L.tileLayer('https://otile4-s.mqcdn.com/tiles/1.0.0/osm/{z}/{x}/{y}.png', {
            attribution: '&copy; <a href="www.openstreetmap.org/copyright">OpenStreetMap</a>'
          }).addTo(map);
     var std_icon = L.icon({
      iconUrl: '/assets/images/marker-icon.png',
      iconSize: [25,41],
      iconAnchor: [12,41]
     })
     console.log("pt lat", point_lat)
     console.log("pt lng", point_lng)
    var marker = L.marker([point_lat, point_lng], {icon: std_icon}).addTo(map);      
   }
   function onError(){
   }
} else {

}
if (($("div#map-index").length > 0)){
        navigator.geolocation.getCurrentPosition(indexonSuccess, indexonError, {
        enableHighAccuracy: true,
        timeout: 200000,
        maximumAge: 120000
      })

      function indexonSuccess(position){
        var user_lat = position.coords.latitude;
        var user_lng = position.coords.longitude;
        if(user_lat < 37.639830 || user_lat > 37.9298240 || user_lng < -123.173825 || user_lng > -122.281780){
          user_lat = point_lat;
          user_lng = point_lng;
        }
        var zoom = 13;
        if ('ontouchstart' in document.documentElement){
          var zoom = 14;
          user_lat = point_lat;
          user_lng = point_lng;
        }
        var map = L.map('map').setView([user_lat,user_lng], zoom);
          L.tileLayer('https://otile4-s.mqcdn.com/tiles/1.0.0/osm/{z}/{x}/{y}.png', {
            attribution: '&copy; <a href="www.openstreetmap.org/copyright">OpenStreetMap</a>'
          }).addTo(map);
     var std_icon = L.icon({
      iconUrl: '/assets/images/marker-icon.png',
      iconSize: [25,41],
      iconAnchor: [12,41]
     })
     var marker_coords = $("#map-index").data("coords")
     console.log(marker_coords)
     for (var i=1; i<marker_coords.length; i++){
      console.log("inside for loop")
    

      console.log(i,marker_coords[i].lat,marker_coords[i].lng)
        var marker = L.marker([marker_coords[i].lat,marker_coords[i].lng], {icon: std_icon}).addTo(map);
        marker.bindPopup("<a href='/listings/"+marker_coords[i].id+"'>"+marker_coords[i].name+"</a>");      
      
      
     }
   }
   function indexonError(){
   }
} else {
}})



