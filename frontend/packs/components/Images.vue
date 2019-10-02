<template>
  <div v-if="roomImage" class="images_box">
    <div v-for="(url, index) in imageUrls"
          :key=index
          class="image_box">
      <img :src=url.url
            @click="addActive"
            class="image">
    </div>
  </div>
</template>

<script>

export default {

  props: [''],

  data() {
    return {
      roomImage: false,
      activeImage: "packs/images/no_image.png"
    }
  },

  computed: {

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
      console.log('hello')
      const url = event.target.getAttribute('src')
      this.activeImage = url
      // this.$emit('addActive')
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
}
</style>