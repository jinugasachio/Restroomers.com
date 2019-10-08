<template>
  <v-ons-tab 
    icon="ion-ios-search"
    @click.prevent="searchRoom"
  />
</template>


<script>

export default {

  name: "SeatrchTab",

  computed: {
    map(){
      return this.$store.state.map;
    }
  },

  methods: {

    searchRoom(){
      this.$emit('backToMap')
      console.log('helllo')
    },

  },
}
</script>