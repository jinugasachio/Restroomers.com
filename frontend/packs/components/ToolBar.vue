<template>
  <v-ons-toolbar>
    <div class="left">
      <v-ons-back-button></v-ons-back-button>
    </div>
    <div class="center">{{ room.name }}</div>
  </v-ons-toolbar>
</template>

<script>

export default {
  computed: {
    //下記後でリファクタリング,ToolBarを完全にコンポーネント化させたい
    // name() {
    //   if (this.$store.getters.powderRoom.children) {
    //   // debugger;
    //     const num = this.$store.getters.powderRoomList[0].ancestry
    //     const parent = this.$store.state.powderRooms[num - 1]
    //     return parent.name
    //   } else {
    //     return this.$store.getters.powderRoom.name
    //   }
    // },

    room(){
      return this.$store.getters.powderRoom
    },

  },
}
</script>