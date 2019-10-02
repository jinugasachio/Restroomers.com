<template>
  <v-ons-page>
    <ToolBar/>
    <v-ons-card>
      <img v-if="roomImage" :src=activeImage alt="Room Image" class="top_image">
      <img v-else src="packs/images/no_image.png" alt="Room Image" class="top_image">
      <StarRating/>
      <div class="content">

        <div v-if="roomImage" class="images_box">
          <div v-for="(url, index) in imageUrls"
               :key=index
               class="image_box">
            <img :src=url.url
                 @click="addActive"
                 class="image">
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
      roomImage: false,
      activeImage: "packs/images/no_image.png"
    }
  },

  computed: {

    room(){
      return this.$store.getters.powderRoom.powder_room
    },
    images(){
      return this.$store.getters.powderRoom.images
    },
    imageUrls(){
      let urlsArray = []
      this.images.forEach(function(image){
        image.urls.forEach(function(url){
          urlsArray.push(url);
        })
      })
      return urlsArray
    },

  },

  methods: {
    addActive(event){
      const url = event.target.getAttribute('src')
      this.activeImage = url
    }
  },

  created(){
    if(this.images.length > 0){
      this.activeImage = this.imageUrls[0].url
    }
  },

  watch: {

    images: {
      handler() {
        if (this.images.length != 0){
          this.roomImage = true
        }
      },
      immediate: true
    },

  }

 }
</script>

<style>
.top_image {
  width: 100%;
  height: 20rem;
  margin-bottom: 0.4rem;
}

.images_box {
  display: flex;
  flex-flow: row wrap;
  justify-content: flex-start;
  width: 100%;
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