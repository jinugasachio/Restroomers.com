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
        @click="getPowderRoom"
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

  computed: {

    powderRoom(){
      return this.$store.getters.powderRoom
    },
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

    getPowderRoom(event){
      const roomItem = event.currentTarget
      this.$store.dispatch('getPowderRoom', roomItem.dataset.id)
    },
  },

  updated(){ //Navigatorで取った時に前のstore情報をリセットするという意味
    this.$store.dispatch('resetPowderRoomList')
  },

  watch: {

    powderRoom(){
      this.$emit('push-page', PowderRoom);
    }
  }
}
</script>

<style lang="scss" scoped>
.list-item {
  padding: 13px 0 13px 20px;
}
</style>