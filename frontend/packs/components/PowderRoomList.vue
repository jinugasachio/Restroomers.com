<template>
  <v-ons-page>
    <v-ons-toolbar>
      <div class="left">
        <v-ons-back-button></v-ons-back-button>
      </div>
      <div class="center">{{ parentName }}</div>
    </v-ons-toolbar>
    

    <v-ons-list>
      <v-ons-list-header></v-ons-list-header>
      <v-ons-list-item modifier="chevron longdivider" tappable
      @click="push"
      v-for="room in list" 
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
import PowderRoom from './PowderRoom.vue'

export default {
  
  components: {
    ToolBar,
    PowderRoom
  },

  // data: function(){
  //   return {
  //     list: this.$store.getters.powderRoomsList
  //   }
  // },

  computed: {
    list(){
      return this.$store.getters.powderRoomList
    },
    parentName(){
      const num = this.$store.getters.powderRoomList[0].ancestry
      const parent = this.$store.state.powderRooms[num - 1]
      return parent.name
    },
  },

  methods: {
    push(event) {
      const roomItem = event.currentTarget
      this.$store.dispatch('getPowderRoom', roomItem.dataset.id)
      this.$emit('push-page', PowderRoom);
    }
  },

  updated(){ //Navigatorでも取った時にリセットするという意味
    this.$store.dispatch('resetPowderRoomList')
  }
}
</script>

<style lang="scss" scoped>
.list-item {
  padding: 13px 0 13px 20px;
}
</style>