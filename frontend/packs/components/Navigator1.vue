<template>
    <v-ons-navigator
    :page-stack="pageStack"
    @push-page="push($event)"
  ></v-ons-navigator>
</template>

<script>


export default {

  name: "Navigator1",

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