function initMap() {
  var mapPosition = { lat: 35.170662, lng: 136.92343 };
  var mapArea = document.getElementById("maps");
  var mapOptions = {
    center: mapPosition,
    zoom: 16,
  };
  var map = new google.maps.Map(mapArea, mapOptions);

  // ↓↓↓ 当記事ではここから解説 ↓↓↓
  var markerOptions = {
    map: map,
    position: mapPosition,
  };
  var marker = new google.maps.Marker(markerOptions);
  // ↑↑↑ 当記事ではここまで解説 ↑↑↑
}
