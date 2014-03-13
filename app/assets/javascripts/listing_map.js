
      navigator.geolocation.getCurrentPosition(onSuccess, onError, {
        enableHighAccuracy: true,
        timeout: 200000,
        maximumAge: 120000
      })

      function onSuccess(position){
        var user_lat = position.coords.latitude;
        var user_lng = position.coords.longitude;
        var map = L.map('map').setView([user_lat,user_lng], 14);
          L.tileLayer('http://otile4.mqcdn.com/tiles/1.0.0/osm/{z}/{x}/{y}.png', {
            attribution: '&copy; <a href="www.openstreetmap.org/copyright">OpenStreetMap</a>'
          }).addTo(map);
       var point_lat = $('#map').data("lat")
     var point_lng = $('#map').data("lon")
    L.marker([point_lat, point_lng]).addTo(map)      
   }
   function onError(){
   }

