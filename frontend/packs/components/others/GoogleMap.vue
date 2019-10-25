<template>
  <v-ons-page>
    <GetCenter/>
    <div id="map">
    </div>
    <SearchBox/>
  </v-ons-page>
</template>

<script>
import GmapStyle  from "../../modules/gmap_style.json"
import Room       from '../room/Room.vue'
import RoomList   from '../room/RoomList.vue'
import Navigator1 from '../tabs/Navigator1.vue'
import GetCenter  from './GetCenter.vue'
import SearchBox  from './SearchBox.vue'

export default {

  name: "GoogleMap",

  components: {
    Room,
    RoomList,
    SearchBox,
    GetCenter
  },

  data() {
    return {
      map: null,
      center:  new google.maps.LatLng(35.658230, 139.701642),
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

    push(){
      if (this.$store.state.roomList.length > 1){
        this.$store.dispatch('pushPage', RoomList)
      } else {
        this.$store.dispatch('pushPage', Room)
      }
    },

    createMap() {
      const mapArea = document.getElementById("map");
      const mapOptions = { 
        center: this.center, 
        styles: this.styles, 
        zoom:   this.zoom,
        gestureHandling: 'greedy',
      };
      this.map = new google.maps.Map(mapArea, mapOptions);
      this.$store.dispatch('updateMap', this.map)
    },

    fixInfoWindow(){
      const set = google.maps.InfoWindow.prototype.set
      google.maps.InfoWindow.prototype.set = function(key, val) {
          if (key === "map") {
              if (!this.get("noSuppress")) {
                  return;
              }
          }
        set.apply(this, arguments);
      }
    },

  },

  mounted() {
    this.createMap();
    this.fixInfoWindow();
    this.$store.dispatch('getAllRooms')
  },

  watch: {
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
