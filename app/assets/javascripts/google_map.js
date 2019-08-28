function initMap() {
  //マップ生成のための変数
  var mapPosition = {lat: 35.658230, lng: 139.701642}; //渋谷駅スタート
  var mapArea = document.getElementById('google_map');
  var mapOptions = {
    center: mapPosition,
    zoom: 16,
    styles: [
      {
        "featureType": "landscape.natural.terrain",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      },
      {
        "featureType": "poi.school",
        "elementType": "labels.icon",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      },
      {
        "featureType": "road.arterial",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      },
      {
        "featureType": "road.highway",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      },
      {
        "featureType": "transit.station.bus",
        "elementType": "labels.icon",
        "stylers": [
          {
            "visibility": "on"
          }
        ]
      }
    ],
  };

  //マップを生成するMapクラス
  var map = new google.maps.Map(mapArea, mapOptions);

  //マーカー生成のための変数
  var markerOptions = {
    map: map,
    position: mapPosition, //パウダールームの住所の情報をここに持って来れば良い。つまり{lat: 35.658230, lng: 139.701642};この形の配列を渡してeachで回す？
    icon: {
      url: "/assets/woman.png",
      scaledSize: new google.maps.Size(50, 50),
    }
  };

  //解説1：マーカーを生成するMarkerクラス
  var marker = new google.maps.Marker(markerOptions);
}
