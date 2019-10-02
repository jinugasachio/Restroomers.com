<template>
  <v-ons-page>
    <ToolBar/>
    <v-ons-card>
      <img v-if="roomImage" :src=images[0].urls[0].url alt="Room Image" style="width: 100%;" class="top_image">
      <img v-else src="packs/images/no_image.png" alt="Room Image" style="width: 100%;" class="top_image">

      <StarRating/>
      <div class="content">
        <div v-if="roomImage" class="images_box" style="width: 100%;">
          <!-- <img alt="Room Image" style="width: 15%;"
            v-for="image in images"
            :key=image.id
            :src=image.urls[0].url 
          > -->
          <!-- <div alt="Room Image"
               v-for="image in images"
               :key=image.id
               class="image_box"
          >
            <img v-if="image.urls.length == 1"
                 :src=image.urls[0].url
                 class="image_child"
            >
            <img v-else
                 v-for="url in image.urls"
                 :key=url.url
                 :src=url.url
                 class="image_child"
            >
          </div> -->
          <div v-for="(url, index) in imageUrls"
               :key=index class="image_box">
               <img :src=url.url class="image">
          </div>
        </div>
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
    pageStack(){
      return this.$store.getters.pageStack.length
    },
    imageUrls(){
      let urlsArray = []
      this.images.forEach(function(image){
        image.urls.forEach(function(url){
          urlsArray.push(url);
          // debugger;
        })
      })
      return urlsArray
    }
  },

  destroyed() {
    this.$store.dispatch('removePage')
    if (this.pageStack == 2) {
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

<style>
.top_image {
  margin-bottom: 0.4rem;
}

.images_box {
  display: flex;
  flex-flow: row wrap;
  justify-content: flex-start;
  margin-left: 0.2rem;
}

.image {
  width: 3.5rem;
  height: 3.5rem;
  margin: 0 0.3rem 0 0;

  /* object-fit: cover; */

  /* 親もリサイズしたほうがいいかも、要検討 */
}
</style>