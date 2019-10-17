<template>
    <star-rating  
      :star-size="18"
      :increment="1"
      :read-only="true"
      :show-rating="false"
      :class="atRoomPage"
      v-model="model"
      >
    </star-rating>
</template>

<script>

export default {
  name: 'Star',
  props:{
    rate: Number
  },
  computed:{
    model(){
      return this.rate //RoomとReviewFormでここで条件分岐させる
    },
    pageStack(){
      return this.$store.getters.pageStack
    },
    atRoomPage(){
      const page = this.pageStack[this.pageStack.length - 1]
      if(page.name == "Room"){
        return 'at-room-page'
      }
    },
  }
}
</script>

<style lang="scss" scoped>

.at-room-page {
  height: 35px;
}

</style>