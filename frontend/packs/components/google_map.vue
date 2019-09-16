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
      markers: [],
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

    // マーカーの生成
    setMarkers: function() {
      const vm = this
      const powderRooms = this.markers
      // let powderRooms = this.markers 上とyyどっちがいいのだろうか。

      // indexいらないかも
      powderRooms.forEach(function(room, index){
        let markerOptions = { 
          map:        vm.map, 
          position: { lat: room.lat, lng: room.lng }, 
          icon:       vm.icon
        };
        new google.maps.Marker(markerOptions);
      });
    },

  },

  mounted: function() {
    this.createMap();  // マップの生成

  // ここにaxiosでのリクエストを呼ぶメソッドを書く？
  // 懸念点としては、rails側ではルートページのコントローラーとアクションが既に
  // 呼ばれている状態なので、2回クエリを発行することにならないかということ。
  // それともjson formatとコントローラーに指定しておけば問題ない？
  // それともapiで呼ぶので、呼ぶコントローラーも変える必要がある？つまり
  // データをとる式は別のコントローラーに書いておくということ。
  // 流れとしては、static(ここではviewのみ) → apiで他のコントローラーを呼びそこに
  // PowderRoom.all(json形式)とか書く感じなのかな？

    
    this.setMarkers(); // マーカーの生成
  }
}

</script>

<style lang="scss" scoped>
#map {
  width: 70%; //最終的には全画面にしたいので100になるかも！
  height: 100%;
}
</style>
