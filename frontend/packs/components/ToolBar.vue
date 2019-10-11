<template>
  <v-ons-toolbar>
    <div class="left">
      <v-ons-back-button
        @click.prevent="popPage"
      >
      </v-ons-back-button>
    </div>
    <div class="center">
      {{ pageName }}
    </div>
  </v-ons-toolbar>
</template>

<script>

export default {

  name: "ToolBar",

  computed: {

    pageName(){
      if(this.activeIndex0){
        if (this.pageStack1.length == 2 && this.pageStack1[1].name == "RoomList"){
          const num = this.$store.getters.roomList[0].ancestry
          const parent = this.$store.getters.allRooms[num - 1]
          return parent.name
        } 
        else {
          return this.$store.getters.room.powder_room.name
        }
      }
      else if(this. activeIndex1){
        if(this.pageStack2.length == 1){
          return '新規登録 / ログイン'
        }
        else if(this.pageStack2[1].name == "SignUp"){
          return '新規登録'
        }
        else if(this.pageStack2[1].name == "SignIn"){
          return 'ログイン'
        }
      }
    },
    pageStack1(){
      return this.$store.getters.pageStack1
    },
    pageStack2(){
      return this.$store.getters.pageStack2
    },
    activeIndex0(){
      if(this.$store.getters.activeIndex == 0){
        return true
      }
      else{
        return false
      }
    },
    activeIndex1(){
      if(this.$store.getters.activeIndex == 1){
        return true
      }
      else{
        return false
      }
    },

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