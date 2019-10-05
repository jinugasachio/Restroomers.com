<template>
    <v-ons-navigator
    :page-stack="pageStack"
    @push-page="pageStack.push($event)"
  ></v-ons-navigator>
</template>

<script>
import GoogleMap from './GoogleMap.vue'


export default {

  name: "Navigator",

  // components: {
  //   GoogleMap
  // },
  
  // data() {
  //   return {
  //     pageStack: [GoogleMap]
  //   };
  // },

  computed: {
    pageStack(){
      return this.$store.getters.pageStack
    }
  },

  updated(){
    debugger
  }

}
</script>