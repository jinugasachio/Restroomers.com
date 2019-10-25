<template>
  <div class="images_box">
    <div v-for="(url, index) in imageUrls"
          :key=index
          class="image_box">
      <img :src=url.url
            @click="addActive"
            class="image"
      >
    </div>
  </div>
</template>

<script>

export default {

  props: {
    imageUrls: Array
  },

  methods: {
    addActive(e){
      this.$emit('addActive', e)
    }
  },

 }
</script>

<style lang="scss" scoped>

.images_box {
  display: flex;
  flex-flow: row wrap;
  justify-content: flex-start;
  width: 100%;
  margin-left: 0.2rem;

  .image_box {
    cursor: pointer;

    .image {
      width: 3.8rem;
      height: 3.8rem;
      margin: 0 0.3rem 0 0;

      &:active {
        opacity: 0.5;
      }
    }
  }
}
</style>