<template>
  <v-ons-tab
    id="search"
    icon="ion-ios-search"
    @click.prevent="searchRoom"
  />
</template>


<script>

export default {

  name: "SeatrchTab",

  computed: {
    map(){
      return this.$store.state.map;
    },
    showSearchBox(){
      return this.$store.getters.showSearchBox
    }
  },

  methods: {

    searchRoom(){
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