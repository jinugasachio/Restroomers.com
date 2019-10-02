<template>
  <v-ons-page>
    <ToolBar/>
    <v-ons-card>
      <img v-if="roomImage" :src=images[0].urls[0].url alt="Room Image" style="width: 100%;">

      <img v-else src="packs/images/no_image.png" alt="Room Image" style="width: 100%;">

        <StarRating/>
      <div class="content">
        <!-- <div>
          <v-ons-button><v-ons-icon icon="ion-thumbsup"></v-ons-icon></v-ons-button>
          <v-ons-button><v-ons-icon icon="ion-share"></v-ons-icon></v-ons-button>
        </div>
         -->
        <Facility/>
        <Detail/>
        <Review/>
      </div>
    </v-ons-card>
  </v-ons-page>
</template>

<script>
import ToolBar from './ToolBar.vue'
import StarRating from './StarRating.vue'
import Facility from './PowderRoomFacility.vue'
import Detail from './PowderRoomDetail.vue'
import Review from './Review.vue'

export default {
  
  components: {
    StarRating,
    ToolBar,
    Facility,
    Detail,
    Review 
  },

  data() {
    return {
      roomImage: false
    }
  },

  computed: {
    room(){
      return this.$store.getters.powderRoom.powder_room
    },
    images(){
      return this.$store.getters.powderRoom.images
    },
    navigatorItems(){
      return this.$store.getters.navgatorItems.length
    },
  },

  destroyed() {
    this.$store.dispatch('removeNavigatorItem')
    if (this.navigatorItems == 2) {
      this.$store.dispatch('resetPowderRoomImages')
    }
  },

  watch: {
    images: {
      handler: function() {
        if (this.images.length != 0){
          this.roomImage = true
        }
        console.log("変わった")
      },
      immediate: true
    }
  }

 }
</script>