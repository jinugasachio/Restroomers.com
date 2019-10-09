<template>
  <div class="search__box"
    v-show="showSearchBox"
  >
    <div class="search__box__inner">
      <div class="search__box__inner__box">
        <img src="packs/images/search1.png" 
          class="search__box__innner__box__image" 
          @click="search"
        >
      </div>
      <input 
        type="text"
        class="search__box__innner__input"
        placeholder="Type to Search"
        v-model="inputWords"
        @keyup.enter="search"
      >
    </div>
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
            vm.$store.dispatch('showSearchBox')
            vm.inputWords = null
            
          }
        })
      }
    }
  }
}
</script>

<style lang="scss">

.search__box {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  width: 80%;
  height: 7%;
  margin: auto;
  background-color: #fff;
  border-radius: 40px;

  .search__box__inner {
    display: flex;
    align-items: center;
    width: 90%;
    height: 100%;
    margin: 0 auto;

    .search__box__inner__box {
      position: relative;
      display: inline-block;
      width: 3rem;
      height: 80%;
      color: white;
      cursor: pointer;
      background-color: #ff8b85;
      border-radius: 50%;

      .search__box__innner__box__image {
        position: absolute;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        width: 1.6rem;
        margin: auto;
        background-color: #ff8b85;
      }
    }

    .search__box__innner__input {
      width: 90%;
      padding: 0.9rem;
      border: none;
    }
  }
}
</style>