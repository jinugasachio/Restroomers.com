<template>
    <v-ons-modal :visible="showSearchBox">
      <SearchBox/>
    </v-ons-modal>
</template>

<script>
import SearchBox from './SearchBox.vue'

export default {
  name: 'Modal',

  components: {
    SearchBox
  },
  computed: {
    showSearchBox(){
      return this.$store.getters.showSearchBox
    },
  },
}
</script>

<style lang="scss" scoped>
  .modal {
    bottom: 49px;
  }
</style>