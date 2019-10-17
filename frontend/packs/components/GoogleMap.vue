<template>
  <v-ons-page>
    <div id="map">
    </div>
    <SearchBox/>
  </v-ons-page>
</template>

<script>
import GmapStyle from "../modules/gmap_style.json"
import Room from './Room.vue'
import RoomList from './RoomList.vue'
import Navigator1 from './Navigator1.vue'
import SearchBox from './SearchBox.vue'

export default {

  name: "GoogleMap",

  components: {
    Room,
    RoomList,
    Navigator1,
    SearchBox
  },

  data() {
    return {
      map: null,
      center: { lat: 35.658230, lng: 139.701642 }, //渋谷駅スタート
      styles: GmapStyle,
      zoom: 16,
      icon: {
        url: "packs/images/woman.png",
        scaledSize: new google.maps.Size(30, 40)
      }
    }
  },

  computed: {
    
    markers(){
      return this.$store.getters.allRooms
    },
  },

  methods: {

    // Navigator用メソッド
    push(){
      if (this.$store.state.roomList.length > 1){
        this.$store.dispatch('pushPage', RoomList)
      } else {
        this.$store.dispatch('pushPage', Room)
      }
    },

    // マップの生成
    createMap() {
      const mapArea = document.getElementById("map");
      const mapOptions = { 
        center: this.center, 
        styles: this.styles, 
        zoom:   this.zoom 
      };
      this.map = new google.maps.Map(mapArea, mapOptions);
      this.$store.dispatch('updateMap', this.map)
    },

    // デフォルトのinfowindowを非表示にする
    fixInfoWindow(){
      const set = google.maps.InfoWindow.prototype.set
      google.maps.InfoWindow.prototype.set = function(key, val) {
          if (key === "map") {
              if (! this.get("noSuppress")) {
                  return;
              }
          }
        set.apply(this, arguments);
      }
    },

  },

  // created: function(){
  //   this.reload(); これだと無限リロードループ
  // },

  mounted() {
    this.createMap();
    this.fixInfoWindow();
    this.$store.dispatch('getAllRooms') //mountesのメソッドが全て実行された後に算出プロパティmarkersを更新
  },

  watch: {
    // 下記の処理だと新しい投稿がされるたびに全てのデータを取り出してくる
    // 挙動なので、将来的には投稿されたもののみ取り出して表示するようにしたい
    // その時は全文の引き出しは下記のように最初だけは呼び出して、あとは監視の解除をすれば良いのかも
    // https://se-tomo.com/2018/10/25/vue-js%E3%81%AE%E7%9B%A3%E8%A6%96%E3%83%97%E3%83%AD%E3%83%91%E3%83%86%E3%82%A3%E3%82%A6%E3%82%A9%E3%83%83%E3%83%81%E3%83%A3/

    // マーカーの生成
    markers(){
      const vm = this
      const allRooms = vm.markers
      let   openWindow = null

      allRooms.forEach(function(room){
        const markerOptions = { 
          map:        vm.map, 
          position: { lat: room.lat, lng: room.lng }, 
          icon:       vm.icon
        };
        const marker = new google.maps.Marker(markerOptions);

        const roomName = `<div id='room_name' data-id=${room.id}>
                            ${room.name}
                            <img src='packs/images/lipstick.png' alt='口紅の写真' class='lip_image'>
                          </div>`
        
        const infoWindow = new google.maps.InfoWindow({
          // pixelOffset: new google.maps.Size(10, 0), //位置を調整できるoption
          // maxWidth: 600,
          content: roomName,
          noSuppress: true 
        });

        google.maps.event.addListener(marker, 'click', function() {

          if (openWindow) {
            vm.$store.dispatch('resetRoomList')
            openWindow.close();
          };

          this.map.addListener('click', function(){
            openWindow.close();
          });
          infoWindow.open(map, marker);
          openWindow = infoWindow;
          google.maps.event.addListener(openWindow, 'domready', function() {
            const roomName = document.getElementById('room_name')
            vm.$store.dispatch('getRoom', roomName.dataset.id)
            roomName.addEventListener('click', vm.push);
          });
        });
      });
    }

  }
}
</script>

<style lang="scss" scoped>
#map {
  width: 100%;
  height: 100%;
}
</style>
