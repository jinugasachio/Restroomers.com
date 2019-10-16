<template>
  <button
    class="sign-out"
    v-show="userPage"
    @click="signOut"
  >
    <img src="packs/images/sign_out.png"  class="sign-out__image">
  </button>
</template>

<script>
export default {

  name: "SignOutButton",

  computed: {
    
    activeIndex(){
      return this.$store.getters.activeIndex
    },
    headers(){
      return this.$store.getters.headers
    },
    userPage(){
      if(this.activeIndex == 1 && this.headers !== null){
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

.sign-out {
  position: absolute;
  right: 1rem;
  bottom: 1rem;
  z-index: 10;
  width: 4rem;
  min-height: 4rem;
  padding: 0;
  cursor: pointer;
  background-color: #ff8b85;
  border: none;
  border-radius: 50%;

  &:active {
    background-color: #e67f7a;
  }

  &:focus {
    outline: 0;
  }

  .sign-out__image {
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