
      navigator.geolocation.getCurrentPosition(onSuccess, onError, {
        enableHighAccuracy: true,
        timeout: 200000,
        maximumAge: 120000
      })

      function onSuccess(position){
        var user_lat = position.coords.latitude;
        var user_lng = position.coords.longitude;
        var point_lat = $('#map').data("lat")
        var point_lng = $('#map').data("lon")
        if(user_lat < 37.639830 || user_lat > 37.9298240 || user_lng < -123.173825 || user_lng > -122.281780){
          console.log("not close to SF")
          user_lat = point_lat;
          user_lng = point_lng;
        }
        var map = L.map('map').setView([user_lat,user_lng], 14);
          L.tileLayer('http://otile4.mqcdn.com/tiles/1.0.0/osm/{z}/{x}/{y}.png', {
            attribution: '&copy; <a href="www.openstreetmap.org/copyright">OpenStreetMap</a>'
          }).addTo(map);
     var std_icon = L.icon({
      iconUrl: '/assets/images/marker-icon.png',
      iconSize: [25,41],
      iconAnchor: [12,41]
     })
    var marker = L.marker([point_lat, point_lng], {icon: std_icon}).addTo(map);      
   }
   function onError(){
   }

