<template>
  <div class="search__box"
    v-show="showSearchBox"
  >
    <v-ons-search-input
      placeholder="Search something"
      v-model="inputWords"
      @keyup.enter="search"
    >
    </v-ons-search-input>
  </div>
</template>


<script>

export default {

  name: "SeatrchBox",
  data(){
    return{
      inputWords: null
    }
  },

  computed: {
    map(){
      return this.$store.state.map;
    },
    showSearchBox(){
      return this.$store.getters.showSearchBox
    },
  },

  methods: {
    search(){
      if(typeof this.inputWords == 'string'){ //細くバリデーションするならここ、一旦応急処置的にこれ。
        const vm = this;
        const request ={
          query: vm.inputWords,
          fields: ['geometry']
        };
        const service = new google.maps.places.PlacesService(this.map);

        service.findPlaceFromQuery( request, function(results, status) {
          if ( status === google.maps.places.PlacesServiceStatus.OK ) {
            vm.map.panTo( results[0].geometry.location)
            vm.map.setZoom(16)
          }
        })
      }
    }
  }
}
</script>

<style lang="scss" scoped>

.search__box {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  width: 80%;
  height: 50px;
  margin: auto;

  input {
    width: 100%;
    height: 100%;
  }
}

</style>