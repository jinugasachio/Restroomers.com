<template>
  <div id="map">
  </div>
</template>

<script>
import gmapStyle from "../gmap_style.json"
export default {

  data: function () {
    return {
      mapName: "map",
      map: null,
      center: {lat: 35.658230, lng: 139.701642}, //渋谷駅スタート
      styles: gmapStyle,
      zoom: 16,
      markers: null,
      icon: {
          url: "packs/images/woman.png",
          scaledSize: new google.maps.Size(50, 50)
      }
    }
  },

  methods: {

    // マップの生成
    createMap: function() {
      const mapArea = document.getElementById("map");
      const mapOptions = { 
        center: this.center, 
        styles: this.styles, 
        zoom:   this.zoom 
      };
      this.map = new google.maps.Map(mapArea, mapOptions);
    },

    //ルームデータの呼び出し
    pullMarkers: function(){
      const vm = this
      axios.get('/api/powder_rooms')
        .then(function(response){
          vm.markers = response.data
        })
        .catch(function (error) {
          console.log(error);
        })
    },
  },

  mounted: function() {
    this.createMap();
    this.pullMarkers();
  },

  watch: {
    // 下記の処理だと新しい投稿がされるたびに全てのデータを取り出してくる
    // 挙動なので、将来的には投稿されたもののみ取り出して表示するようにしたい
    // その時は全文の引き出しは下記のように最初だけは呼び出して、あとは監視の解除をすれば良いのかも
    // https://se-tomo.com/2018/10/25/vue-js%E3%81%AE%E7%9B%A3%E8%A6%96%E3%83%97%E3%83%AD%E3%83%91%E3%83%86%E3%82%A3%E3%82%A6%E3%82%A9%E3%83%83%E3%83%81%E3%83%A3/
    // マーカーの生成
    markers: function(){
      const vm = this
      const powderRooms = vm.markers

      powderRooms.forEach(function(room){
        const markerOptions = { 
          map:        vm.map, 
          position: { lat: room.lat, lng: room.lng }, 
          icon:       vm.icon
        };
        new google.maps.Marker(markerOptions);
      });
    }
  }
}

</script>

<style lang="scss" scoped>
#map {
  width: 70%; //最終的には全画面にしたいので100になるかも！
  height: 100%;
}
</style>
