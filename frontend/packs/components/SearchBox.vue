<template>
  <div class="search__box"
  :show="showSearchBox"
  >
    <input type="text" placeholder="Type to search">
  </div>
</template>


<script>

export default {

  name: "SeatrchBox",

  computed: {
    showSearchBox(){
      return this.$store.getters.showSearchBox
    }
  },

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