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
      center: {lat: 35.658230, lng: 139.701642},
      styles: gmapStyle,
      zoom: 16,
      markers: [],
    }
  },

  methods: {
    createMap: function () {
      // const my_this = this; //thisを別名で退避しておく（あとでつかうので）

      // マップの生成
      const mapArea = document.getElementById("map");
      const mapOptions ={center: this.center, styles: this.styles, zoom: this.zoom};
      this.map = new google.maps.Map(mapArea, mapOptions);


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
