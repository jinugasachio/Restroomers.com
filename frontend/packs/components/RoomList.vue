<template>
  <v-ons-page>
    <v-ons-toolbar>
      <div class="left">
        <div>
        <v-ons-back-button></v-ons-back-button>
        </div>
      </div>
      <div class="center">{{ parentName }}</div>
    </v-ons-toolbar>
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
      const parent = this.$store.state.allRooms[num - 1]
      return parent.name
    },
  },

  methods: {

    getRoom(event){
      const roomItem = event.currentTarget
      this.$store.dispatch('getRoom', roomItem.dataset.id)
    },
  },

  updated(){ //Navigatorで取った時に前のstore情報をリセットするという意味
    this.$store.dispatch('resetRoomList')
  },
  destroyed(){
    debugger;
  },

  watch: {

    room(){
      this.$emit('push-page', Room);
    }
  }
}
</script>

<style lang="scss" scoped>
.list-item {
  padding: 13px 0 13px 20px;
}
</style>