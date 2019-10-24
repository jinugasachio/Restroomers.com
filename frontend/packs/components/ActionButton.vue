<template>
  <button
    class="action-button"
    v-show="showButton"
    @click="action"
  >
    <img v-show="mapPage" src="packs/images/post.png" class="action-button__image-post">
    <img :src="imageSrc"  class="action-button__image">
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
    },
    showButton(){
      if(this.activeTab == 1 && this.userPage){
        return true
      }
      if(this.activeTab == 0 && this.mapPage){
        return true
      }
    },
    imageSrc(){
      if(this.userPage){
        return "packs/images/sign_out.png" 
      }
      else if(this.mapPage){
        return "packs/images/woman2.png" 
      }
    },
    postTrriger(){
      return this.$store.getters.postTrriger
    }
  },

  methods:{
    action(){
      if(this.userPage){
        this.signOut();
      }
      else{
        if(this.headers !== null){
          this.showGetCenter();
        }
        else{
          this.$ons.notification.alert({ message: 'ログインしてください。', title: '' });
        }
       
      }
    },
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
                                        debugger;
            vm.$store.dispatch('signOut');
          }
        })
    },
    showGetCenter(){
      const vm = this;
      if(!this.postTrriger){
        this.$ons.notification.confirm({message: '新しいレストルームを投稿しますか?', title: ''})
       .then(function(response){
          if(response == 1){
            vm.$store.dispatch('postTrriger')
          }
        })
      }

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
    width: 1.8rem;
    margin: auto;
    background-color: #ff8b85;

    &:active {
      background-color: #d8726d;
    }
  }

  .action-button__image-post {
    position: absolute;
    top: -20px;
    right: 11px;
    bottom: 0;
    z-index: 2;
    width: 1rem;
    margin: auto;
    background-color: #ff8b85;

    &:active {
      background-color: #d8726d;
    }
  }
}
</style>