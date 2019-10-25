<template>
  <v-ons-page id ="room">
    <ToolBar/>
    <div class="page__content">
      <v-ons-card>
        <img v-if="roomImage" :src=activeImage class="top_image">
        <img v-else src="packs/images/no_image.png" class="top_image">
        <UnderBox/>
        <div class="content">
          <Images v-if="roomImage" 
                  :imageUrls="imageUrls"
                  @addActive="addActive"/>
          <Facility/>
          <Detail/>
          <Review/>
        </div>
      </v-ons-card>
    </div>
  </v-ons-page>
</template>

<script>
import ToolBar      from '../main/ToolBar.vue'
import UnderBox     from './UnderBox.vue'
import HeartButton  from './HeartButton.vue'
import Images       from './Images.vue'
import Facility     from './RoomFacility.vue'
import Detail       from './RoomDetail.vue'
import Review       from './RoomReview.vue'

export default {

  name: "Room",
  
  components: {
    UnderBox,
    HeartButton,
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
    activeTab(){
      return this.$store.getters.activeTab
    }

  },

  methods: {
    addActive(event){
      const url = event.target.getAttribute('src')
      this.activeImage = url
    },
  },

  mounted(){
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

<style lang="scss" scoped>

#room {
  .page__content {
    padding: 0 5px;

    .card {
      max-width: 450px;
      margin: 0.5rem auto;
    }
  }
}

.top_image {
  display: block;
  width: 100%;
  max-width: 360px;
  height: 19rem;
  margin: 0 auto 0.4rem;
}

</style>