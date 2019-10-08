<template>
  <v-ons-page>
    <ToolBar/>
    <v-ons-card>
      <img v-if="roomImage" :src=activeImage class="top_image">
      <img v-else src="packs/images/no_image.png" class="top_image">
      <StarRating/>
      <div class="content">
        <Images v-if="roomImage" 
                :imageUrls="imageUrls"
                @addActive="addActive"/>
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
import Images from './Images.vue'
import Facility from './RoomFacility.vue'
import Detail from './RoomDetail.vue'
import Review from './Review.vue'

export default {

  name: "Room",
  
  components: {
    StarRating,
    Images,
    ToolBar,
    Facility,
    Detail,
    Review,
  },

  data() {
    return {
      roomImage: false,
      activeImage: "packs/images/no_image.png"
    }
  },

  computed: {

    room(){
      return this.$store.getters.room.powder_room
    },
    images(){
      return this.$store.getters.room.images
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

</style>