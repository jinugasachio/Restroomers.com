<template>
  <v-ons-page>
    <ToolBar/>
    <v-ons-list>
      <v-ons-list-header></v-ons-list-header>
      <v-ons-list-item modifier="chevron longdivider" tappable
        @click="getRoom"
        v-for="room in roomList" 
        :key=room.id
        :data-id=room.id
      >
      {{ room.name }}
      </v-ons-list-item>
    </v-ons-list>
  </v-ons-page>
</template>

<script>
import ToolBar from './ToolBar.vue'
import Room from './Room.vue'

export default {

  name: "RoomList",
  
  components: {
    ToolBar,
    Room
  },

  computed: {

    room(){
      return this.$store.getters.room
    },
    roomList(){
      return this.$store.getters.roomList
    },
    parentName(){
      const num = this.$store.getters.roomList[0].ancestry
      const parent = this.$store.getters.allRooms[num - 1]
      return parent.name
    },
  },

  methods: {

    getRoom(event){
      const roomItem = event.currentTarget
      this.$store.dispatch('getRoom', roomItem.dataset.id)
    },

    popPage(){
      this.$store.dispatch('popPage')
    }
  },

  updated(){ //Navigatorで取った時に前のstore情報をリセットするという意味
    this.$store.dispatch('resetRoomList')
  },
 
  watch: {

    room(){
      this.$store.dispatch('pushPage', Room)
    }
  }
}
</script>

<style lang="scss" scoped>
.list-item {
  padding: 13px 0 13px 20px;
}
</style>