<template>
  <v-ons-page id="map">
    <!-- <div id="map">
    </div> -->
  </v-ons-page>
</template>

<script>
import gmapStyle from "../modules/gmap_style.json"
export default {

  data: function () {
    return {
      mapName: "map",
      map: null,
      center: { lat: 35.658230, lng: 139.701642 }, //渋谷駅スタート
      styles: gmapStyle,
      zoom: 17,
      icon: {
          url: "packs/images/woman.png",
          scaledSize: new google.maps.Size(80, 80)
      },
    }
  },

  computed: {
    markers(){
      return this.$store.getters.powderRooms
    },
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

    // デフォルトのinfowindowを非表示にする
    fixInfoWindow: function(){
      const set = google.maps.InfoWindow.prototype.set

      google.maps.InfoWindow.prototype.set = function(key, val) {
          if (key === "map") {
              if (! this.get("noSuppress")) {
                  return;
              }
          }
          set.apply(this, arguments);
      }
    }

  },

  mounted: function() {
    this.createMap();
    this.fixInfoWindow();
    this.$store.dispatch('pullPowderRoomData') //算出プロパティmarkersを更新
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
      let   openWindow = null

      powderRooms.forEach(function(room){
        const markerOptions = { 
          map:        vm.map, 
          position: { lat: room.lat, lng: room.lng }, 
          icon:       vm.icon
        };
        const marker = new google.maps.Marker(markerOptions);

        // 名前から個別情報を識別できるのであればカスタムデータ属性をつける必要はない
        // ただ名前の横に可愛いアイコンをつけたいので、そのためにはinfowindowのhtmlを
        // カスタマイズする必要がある。ので一旦下は消さない

        const roomName = `<a href='/room/${room.id}' class='room_name'>
                            ${room.name}
                            <img src='packs/images/lipstick.png' alt='口紅の写真' class='lip_image'>
                          </a>`

        const infowindow = new google.maps.InfoWindow({
          // pixelOffset: new google.maps.Size(0, 0), 位置を調整できるoption
          maxWidth: 600,
          content: roomName,
          noSuppress: true 
        });

        google.maps.event.addListener(marker, 'click', function() {
          if (openWindow) {
            openWindow.close();
          }
          this.map.addListener('click', function(){
            openWindow.close();
          })
          infowindow.open(map, marker);
          openWindow = infowindow;
        });
      });
    }
  }

}
</script>

<style lang="scss" scoped>
#map {
  width: 100%; //最終的には全画面にしたいので100になるかも！
  height: 100%;
}
</style>
