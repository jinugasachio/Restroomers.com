<template>
  <v-ons-card id="name-and-photo">
    <v-ons-list>

      <v-ons-list-header>名前</v-ons-list-header>
      <v-ons-list-item>
          <v-ons-input placeholder="例) 渋谷ストリーム 2F" type="text" class="name-input"
            v-model="roomName"
          >
          </v-ons-input>
      </v-ons-list-item>

      <v-ons-list-header>写真 ( 複数可 )</v-ons-list-header>
      <v-ons-list-item>
          <label for="file_photo">
            <img src="packs/images/camera.png" id="camera">
            <input type="file" multiple="multiple" id="file_photo" style="display: none;"
              @change="getImages"
            >
          </label>

          <div class="preview-box"  v-show="uploadedImages.length > 0">
            <div class="preview-box__inner"
              v-for=" image in uploadedImages"
              :key="image.name"
            >
              <button @click="remove" class="preview-box__inner__button">
                <img  src="packs/images/cancel.png" class="preview-box__inner__cancel">
              </button>
              <img :src="image" class="preview-box__inner__image">
            </div>
          </div>
      </v-ons-list-item>

    </v-ons-list>
  </v-ons-card>
</template>

<script>


export default {

  name: 'PictureForm',
  data(){
    return{
      roomName: null,
      uploadedImages: []
    }
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
        const reader = new FileReader();
        reader.onload = e => {
          this.uploadedImages.push(e.target.result);
        };
        reader.readAsDataURL(image);
      },
      remove(e){
        const targetImage = e.currentTarget.nextElementSibling.src
        this.uploadedImages = this.uploadedImages.filter(function(image){
          return image !== targetImage;
        });
      }
  }


  
}
</script>

<style scoped lang="scss">

#name-and-photo {
  margin-bottom: 2rem;

  .name-input {
    width: 100%;
  }

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
        background-color: #f8f8f8;
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
}

</style>