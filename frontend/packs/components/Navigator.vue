<template>
    <v-ons-navigator
    :page-stack="pageStack"
    @push-page="pageStack.push($event)"
  ></v-ons-navigator>
</template>

<script>
// import PowderRoom from './PowderRoom.vue'
// import PowderRoomList from './PowderRoomList.vue'
import GoogleMap from './GoogleMap.vue'


export default {
  components: {
    GoogleMap,
    // PowderRoomList,
    // PowderRoom
  },

  data() {
    return {
      pageStack: [GoogleMap,] //後ろに来た方が先に読み込まれるっぽい。
    };
  }
}
</script>