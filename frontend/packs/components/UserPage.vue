<template>
  <v-ons-page class="user-page">
    <p>ユーザーページです!!</p>
  </v-ons-page>
</template>


<script>

export default {
  name: "User",
  computed: {
    showSearchBox(){
      return this.$store.getters.showSearchBox
    },
  },

}
</script>

<style  lang="scss" scoped>

.ons-swiper-target.active:not(.swiping) > .page:not([shown]) {
  visibility: visible;
}

</style>
