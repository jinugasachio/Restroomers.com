<template>
    <v-ons-navigator
    :page-stack="pageStack2"
  >これはナビゲーター</v-ons-navigator>
</template>

<script>


export default {

  name: "Navigator2",

  computed: {
    pageStack2(){
      return this.$store.getters.pageStack2
    }
  },


}
</script>