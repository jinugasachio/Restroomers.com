<template>
  <v-ons-page>
    <ToolBar/>
    <v-ons-list>
      <v-ons-list-header>{{ headerName }}</v-ons-list-header>
      <v-ons-list-item modifier="chevron longdivider" tappable
        @click="pushPage"
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
import ToolBar from '../main/ToolBar.vue'
import Room    from './Room.vue'

export default {

  name: "RoomList",
  
  components: {
    ToolBar,
    Room,
  },

  computed: {

    room:{
      get()       { return this.$store.getters.room },
      set(roomBox){ this.$store.dispatch('getRoom', roomBox.dataset.id) }
    },
    headerName(){
      if(this.activeTab == 1){
        return "お気に入りリスト";
      }
    },
    roomList(){
      if(this.activeTab == 1){
        return this.$store.getters.favoriteRooms;
      }
      else{
        return this.$store.getters.roomList;
      }
    },
    activeTab(){
      return this.$store.getters.activeTab;
    },

  },

  methods:{

    pushPage(event){
      const unwatch = this.$watch('room', function(){
        this.$store.dispatch('pushPage', Room);
        unwatch();
      })
      this.room = event.currentTarget;
    },

    popPage(){
      this.$store.dispatch('popPage');
    }
  },

  created(){
    if(this.activeTab == 1){
      this.$store.dispatch('favoriteRooms');
    }
  },
 
}
</script>

<style lang="scss" scoped>
.list-item {
  padding: 13px 0 13px 20px;
}
</style>