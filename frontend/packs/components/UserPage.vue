<template>
  <v-ons-page>
    <ToolBar/>
    <v-ons-list>
      <v-ons-list-header>お気に入りリスト</v-ons-list-header>
      <v-ons-list-item modifier="chevron longdivider" tappable
        v-for="room in favoriteRooms"
        @click="getRoom"
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
  name: 'UserPage',
  components:{
    ToolBar,
    Room 
  },
  computed:{

    room(){
      return this.$store.getters.room
    },
    favoriteRooms(){
      return this.$store.getters.favoriteRooms
    }
  },

  methods:{
    getRoom(event){
      const roomItem = event.currentTarget
      this.$store.dispatch('getRoom', roomItem.dataset.id)
    },
  },
  created(){
    this.$store.dispatch('favoriteRooms')
  },

  watch:{
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