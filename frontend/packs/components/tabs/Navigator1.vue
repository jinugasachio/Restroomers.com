<template>
    <v-ons-navigator
      :page-stack="pageStack1"
    >
    </v-ons-navigator>
</template>

<script>


export default {

  name: "Navigator1",

  computed: {
    pageStack1(){
      return this.$store.state.pageStack1;
    }
  },


}
</script>