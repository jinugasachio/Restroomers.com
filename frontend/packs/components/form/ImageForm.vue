<template>
  <v-ons-list-item>
      <label for="file_photo">
        <img src="packs/images/camera.png" id="camera">
        <input type="file" multiple="multiple" id="file_photo" style="display: none;"
          @change="getImages"
        >
      </label>
      <div class="preview-box"
        v-show="previewImages.length > 0"
      >
        <div class="preview-box__inner"
          v-for=" image in previewImages"
          :key="image.name"
        >
          <button class="preview-box__inner__button"
            @click="remove"
          >
            <img  src="packs/images/cancel.png" class="preview-box__inner__cancel">
          </button>
          <img :src="image" class="preview-box__inner__image">
        </div>
      </div>
  </v-ons-list-item>
</template>

<script>


export default {

  name: 'ImageForm',
  props:{
    previewImages: Array
  },
    
  methods:{
    getImages(e) {
      const vm = this;
      const images = Array.from(e.target.files);
      images.forEach(function(image){
        vm.preview(image);
      });
    },
    preview(image) {
      const vm = this;
      const reader = new FileReader();
      reader.onload = e => {
        vm.$emit('previewImage', e.target.result)
      };
      reader.readAsDataURL(image);
    },
    remove(e){
      const targetImage = e.currentTarget.nextElementSibling.src;
      this.$emit('removeImage', targetImage);
    }
  },
}
</script>

<style scoped lang="scss">

.preview-box {
  display: flex;
  flex-wrap: wrap;
  margin-left: 20px;

  &__inner {
    position: relative;
    display: flex;
    align-items: flex-start;
    margin-right: 10px;

    &__image {
      width: 2rem;
    }

    &__button {
      position: absolute;
      top: -5px;
      left: -10px;
      width: 1rem;
      padding: 0;
      background-color: #ececec;
      border: none;
      border-radius: 50%;

      &:focus {
        outline: 0;
      }
    }

    &__cancel {
      width: 0.6rem;
      cursor: pointer;
    }
  }
}

#camera {
  width: 1rem;
}

</style>