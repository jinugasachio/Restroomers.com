<template>
  <v-ons-tab
    id="search"
    icon="ion-ios-search"
    @click.prevent="activeSearchBox"
  />
</template>


<script>

export default {

  name: "SeatrchTab",

  computed: {
    map(){
      return this.$store.state.map;
    },
    activeIndex(){
      return this.$store.state.activeIndex
    },
    showSearchBox(){
      return this.$store.getters.showSearchBox
    }
  },

  methods: {

    activeSearchBox(){
      this.$emit('backToMap')
      this.$store.dispatch('showSearchBox')
    },

  },

  watch:{
    showSearchBox:{
      handler(){
        if(this.showSearchBox == true){
          this.$emit('addClass','search','search-mode')
        }
        else{
          this.$emit('removeClass','search','search-mode')
        }
      }
    },
    activeIndex:{
      handler(){
        if(this.activeIndex == 1 && this.showSearchBox == true){
          this.$store.dispatch('showSearchBox')
        }
      }
    }
  }
}
</script>

<style lang="scss">

.search-mode {
  .tabbar__button {
    color: #ff5a47;
  }
}

</style>