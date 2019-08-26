function initMap() {
  //解説2：変数
  var mapPosition = {lat: 35.658230, lng: 139.701642}; //渋谷駅スタート
  var mapArea = document.getElementById('google_map');
  var mapOptions = {
    center: mapPosition,
    zoom: 16,
  };
  //解説1：マップを生成するMapクラス
  var map = new google.maps.Map(mapArea, mapOptions);
}
