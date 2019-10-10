<template>
    <v-ons-navigator
    :page-stack="pageStack1"
    @push-page="push($event)"
  ></v-ons-navigator>
</template>

<script>


export default {

  name: "Navigator1",

  computed: {
    pageStack1(){
      return this.$store.getters.pageStack1
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