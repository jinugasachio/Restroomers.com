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
      if(this.activeTab == 0){
        if (this.pageStack.length == 2 && this.pageStack[1].name == "RoomList"){
          const num = this.$store.getters.roomList[0].ancestry
          const parent = this.$store.getters.allRooms[num - 1]
          return parent.name
        } 
        else {
          return this.$store.getters.room.powder_room.name
        }
      }
      else if(this.activeTab == 1 && this.headers !== null){
        if(this.pageStack.length == 1){
          return  this.currentUser.data.nickname
        }
        else{
          return this.$store.getters.room.powder_room.name
        }
      }
      else if(this.pageStack.length == 1){
        return '新規登録 / ログイン'
      }
      else if(this.formDataLength == 4){
        return '新規登録'
      }
      else if(this.formDataLength == 2){
        return 'ログイン'
      }
    },
    pageStack(){
      return this.$store.getters.pageStack
    },
    activeTab(){
      return this.$store.getters.activeTab
    },
    formDataLength(){
      return this.$store.getters.signFormData.length
    },
    currentUser(){
      return this.$store.getters.currentUser
    },
    headers(){
      return this.$store.getters.headers
    },

  },

  methods: {

    popPage(){
      this.$store.dispatch('popPage')
    },
    
  },

}
</script>

<style lang="scss">
.back-button__icon {
  fill: #ff7070;
}

</style>