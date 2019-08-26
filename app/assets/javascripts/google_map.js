function initMap() {
  //マップ生成のための変数
  var mapPosition = {lat: 35.658230, lng: 139.701642}; //渋谷駅スタート
  var mapArea = document.getElementById('google_map');
  var mapOptions = {
    center: mapPosition,
    zoom: 16,
  };
  //マップを生成するMapクラス
  var map = new google.maps.Map(mapArea, mapOptions);

  //マーカー生成のための変数
  var markerOptions = {
    map: map,
    position: mapPosition,
    icon: "/assets/lip.png",
  };

  //解説1：マーカーを生成するMarkerクラス
  var marker = new google.maps.Marker(markerOptions);
}
