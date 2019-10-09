<template>
    <v-ons-modal :visible="true" @click="modalVisible = false">
      <SearchBox/>
    </v-ons-modal>
</template>

<script>

import SearchBox from './SearchBox.vue'

export default {
  name: 'Modal',
  data(){
    return{
      modalVisible: false
    }
  },
  components: {
    SearchBox
  }
}
</script>

<style lang="scss" scoped>
  
</style>