<template>
    <v-ons-navigator
    :page-stack="pageStack2"
    >
    </v-ons-navigator>
</template>

<script>


export default {

  name: "Navigator2",

  computed: {
    pageStack2(){
      return this.$store.state.pageStack2
    }
  },


}
</script>