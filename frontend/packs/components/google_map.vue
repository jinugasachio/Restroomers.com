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
      let powderRooms = this.markers

      powderRooms.forEach(function(room, index){
        let markerOptions = { 
          map:      vm.map, 
          position: {lat: room.lat, lng: room.lng}, 
          icon:     vm.icon
        };
        new google.maps.Marker(markerOptions);
      });
    },

  },

  mounted: function() {
    this.createMap();  // マップの生成
    this.setMarkers(); // マーカーの生成
  }
}

</script>

<style lang="scss" scoped>
#map {
  width: 70%;
  height: 100%;
}
</style>
