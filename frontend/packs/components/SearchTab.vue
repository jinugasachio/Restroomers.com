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
          const button = document.getElementById('search');
          button.classList.add('active__search')}
      }
    }
  }
}
</script>

<style lang="scss">
.active__search {
  .tabbar__button {
    color: #ff5a47;
  }
}

</style>