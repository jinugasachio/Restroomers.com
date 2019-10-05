<template>
  <v-ons-toolbar>
    <div class="left">
      <v-ons-back-button
        @click.prevent="splicePage"
      >
      </v-ons-back-button>
    </div>
    <div class="center">{{ roomName }}</div>
  </v-ons-toolbar>
</template>

<script>

export default {

  name: "ToolBar",

  computed: {
    //下記後でリファクタリング,ToolBarを完全にコンポーネント化させたい
    // name() {
    //   if (this.$store.getters.room.children) {
    //   // debugger;
    //     const num = this.$store.getters.roomList[0].ancestry
    //     const parent = this.$store.state.rooms[num - 1]
    //     return parent.name
    //   } else {
    //     return this.$store.getters.room.name
    //   }
    // },

    roomName(){
      return this.$store.getters.room.powder_room.name
    },

  },

  methods: {
    splicePage(){
      this.$store.dispatch('splicePage')
    }
  }
}
</script>