<template>
  <button
    class="action-button"
    v-show="atUserPage"
    @click="signOut"
  >
    <img src="packs/images/sign_out.png"  class="action-button__image">
  </button>
</template>

<script>
export default {

  name: "ActionButton",

  computed: {
    
    activeTab(){
      return this.$store.getters.activeTab
    },
    headers(){
      return this.$store.getters.headers
    },
    pageStack(){
      return this.$store.getters.pageStack
    },
    atUserPage(){
      if(this.activeTab == 1 && this.userPage){
        return true
      }
      if(this.activeTab == 0 && this.mapPage){
        return true
      }
    },
    userPage(){
      const page = this.pageStack[this.pageStack.length - 1]
      if(page.name == "RoomList"){
        return true
      }
    },
    mapPage(){
      const page = this.pageStack[this.pageStack.length - 1]
      if(page.name == "GoogleMap"){
        return true
      }
    }
  },

  methods:{
    signOut(){
      const vm = this;
      vm.$ons.notification.confirm({message: 'ログアウトしてもよろしいですか?', title: ''})
        .then(function(response){
          if(response == 1){
            const unwatch = vm.$watch('headers', function(){
                                vm.$ons.notification.alert({message: 'ログアウトしました。', title: ''})
                                vm.$store.dispatch('resetPageStack');
                                unwatch();
                              }
                            );
            vm.$store.dispatch('signOut');
          }
        })
    }
  }
  
}
</script>

<style lang="scss" scoped>

.action-button {
  position: absolute;
  right: 1rem;
  bottom: 4rem;
  z-index: 10;
  width: 4rem;
  min-height: 4rem;
  padding: 0;
  cursor: pointer;
  background-color: #ff8b85;
  border: none;
  border-radius: 50%;

  &:active {
    background-color: #d8726d;
  }

  &:focus {
    outline: 0;
  }

  .action-button__image {
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    width: 1.5rem;
    margin: auto;
    background-color: #ff8b85;

    &:active {
      background-color: #e67f7a;
    }
  }
}
</style>