<template>
  <div id="google_map"></div>
</template>

<script>
import gmapStyle from "../gmap_style.json"

export default {

  data: function () {
    return {
      mapName: "google_map", //mapを紐付ける要素のID
      map: null, //GoogleMapのインスタンスを入れる変数
      markers: [], //マーカー群を入れる配列
    }
  },

  methods: {
    // マップ表示メソッド
    initMap: function () {
      // const my_this = this; //thisを別名で退避しておく（あとでつかうので）

      // マップの初期値
      const mapOptions ={
        center: {lat: 35.658230, lng: 139.701642}, //渋谷駅スタート
        styles: gmapStyle,
        zoom: 16,
      };

      // マップを生成
      this.map = new google.maps.Map(document.getElementById(this.mapName), mapOptions);
    },
  },
  mounted: function () {
    this.initMap();
  }
}



</script>

<style lang="scss" scoped>

#google_map {
  width: 80%;
  height: 100%;
}

</style>
