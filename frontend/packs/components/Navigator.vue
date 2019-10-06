<template>
    <v-ons-navigator
    :page-stack="pageStack"
    @push-page="push($event)"
  ></v-ons-navigator>
</template>

<script>
import GoogleMap from './GoogleMap.vue'

export default {

  name: "Navigator",

  computed: {
    pageStack(){
      return this.$store.getters.pageStack
    }
  },

  methods: {
    push(page){
      debugger;
      this.$store.dispatch('pushPage', page)
    }
  },


}
</script>