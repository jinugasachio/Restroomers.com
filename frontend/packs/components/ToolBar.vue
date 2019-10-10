<template>
  <v-ons-toolbar>
    <div class="left">
      <v-ons-back-button
        @click.prevent="popPage"
      >
      </v-ons-back-button>
    </div>
    <div class="center"
      v-show="activeIndex"
    >
      {{ roomName }}
    </div>
  </v-ons-toolbar>
</template>

<script>

export default {

  name: "ToolBar",

  computed: {

    roomName(){
      if (this.pageStack1.length == 2 && this.pageStack1[1].name == "RoomList"){
        const num = this.$store.getters.roomList[0].ancestry
        const parent = this.$store.state.allRooms[num - 1]
        return parent.name
      } 
      else {
        return this.$store.getters.room.powder_room.name
      }
    },
    pageStack1(){
      return this.$store.state.pageStack1
    },
    activeIndex(){
      if(this.$store.state.activeIndex == 0){
        return true
      }
      else{
        return false
      }
    }
  },

  methods: {

    popPage(){
      this.$store.dispatch('popPage')
    }
    
  },
}
</script>

<style lang="scss">
.back-button__icon {
  fill: #ff7070;
}
</style>