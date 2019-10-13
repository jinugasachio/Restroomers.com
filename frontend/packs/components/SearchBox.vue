<template>
  <div class="modal" 
    v-show="showSearchBox"
  >
    <div class="search__box">
      <div class="search__box__inner">
        <button @click="search" class="search__box__inner__box">
          <img src="packs/images/search1.png" 
            class="search__box__innner__box__image" 
            
          >
        </button>
        <input 
          type="text"
          class="search__box__innner__input"
          placeholder="Type to Search"
          v-model="inputWords"

        >
      </div>
    </div>
  </div>
</template>


<script>

export default {

          // @keyup.enter="searchTrigger"
          // @keypress="search"

  name: "SeatrchBox",
  data(){
    return{
      inputWords: null,
      canSearch: false
    }
  },

  computed: {
    map(){
      return this.$store.getters.map;
    },
    showSearchBox(){
      return this.$store.getters.showSearchBox
    },
  },

  methods: {
    // searchTrigger() {
    //   if (!this.canSearch) {
    //     return
    //   }
    //   this.canSearch = false
    // },

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
          else{
            vm.$ons.notification.alert({message: 'お探しの場所が見つかりませんでした。', title: ''});
          }
        });
      }
    },

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
  max-width: 310px;
  height: 68px;
  margin: auto;
  background-color: #fff;
  border-radius: 40px;

  .search__box__inner {
    display: flex;
    align-items: center;
    width: 90%;
    max-width: 267px;
    height: 100%;
    min-height: 53px;
    margin: 0 auto;

    .search__box__inner__box {
      position: relative;
      display: inline-block;
      width: 75px;
      min-height: 54px;
      padding: 0;
      color: white;
      cursor: pointer;
      background-color: #ff8b85;
      border-radius: 50%;
      box-shadow: inset 0 2px 0 #ffffff80, 0 2px 2px #00000030;

      &:active {
        background-color: #e67f7a;
        border: none;
        box-shadow: inset 0 1px 0 #ffffff80, 0 2px 2px #00000030;
      }

      &:focus {
        outline: 0;
      }

      .search__box__innner__box__image {
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

    .search__box__innner__input {
      width: 90%;
      padding: 0.9rem;
      border: none;
    }
  }
}
</style>