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
      center: {lat: 35.658230, lng: 139.701642},//渋谷駅スタート
      styles: gmapStyle,
      zoom: 16,
      markers: [],
      icon: {
          url: "packs/images/woman.png",
          scaledSize: new google.maps.Size(60, 60)
      }
    }
  },

  methods: {
    createMap: function () {
      // const my_this = this; //thisを別名で退避しておく（あとでつかうので）

      // マップの生成
      const mapArea = document.getElementById("map");
      const mapOptions ={ center: this.center, styles: this.styles, zoom: this.zoom };
      this.map = new google.maps.Map(mapArea, mapOptions);

      //マーカー生成のための変数, 
      // パウダールームの住所の情報(座標)をここに持って来れば良い。
      // つまり{lat: 35.658230, lng: 139.701642};
      // この形の配列を渡してeachで回す？
      const markerOptions = { map: this.map, position: this.center, icon: this.icon };
      new google.maps.Marker(markerOptions);
    },
  },
  mounted: function () {
    this.createMap();
  }
}



</script>


<style lang="scss" scoped>

#map {
  width: 70%;
  height: 100%;
}

</style>
