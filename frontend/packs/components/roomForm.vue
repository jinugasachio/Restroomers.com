<template>
    <v-ons-page>
      <ToolBar/>
      <div class="wrapper">
        <ImageForm
          @inputName="inputRoomName"
          @upload="uploadImage"
          @remove="removeImage"
          :roomName="roomName"
          :uploadedImages="uploadedImages"
        />
        <FacilityForm/>
        <DetailForm/>
        <v-ons-button id="post-button" modifier="large"
          @click="postRoom"
        >
          投稿する
        </v-ons-button>
      </div>
    </v-ons-page>
</template>

<script>
import ToolBar from './ToolBar.vue'
import ImageForm from './ImageForm.vue'
import FacilityForm from './FacilityForm.vue'
import DetailForm from './DetailForm.vue'

export default {

  name: 'RoomForm',
  components: {
    ToolBar,
    ImageForm,
    FacilityForm,
    DetailForm
  },

  data(){
    return{
      roomName: null,
      uploadedImages: []
    }
  },

  methods: {
    postRoom(){
      this.$ons.notification.confirm({ message: '投稿してもよろしいですか?', title: '' })
    },
    inputRoomName(name){
      this.roomName = name;
    },
    uploadImage(image){
      this.uploadedImages.push(image)
    },
    removeImage(targetImage){
      this.uploadedImages = this.uploadedImages.filter(function(image){
        return image !== targetImage;
      });
    }
  },
  updated(){
    // debugger;
  }
  
}
</script>

<style scoped lang="scss">

#post-button {
  width: 65%;
  margin: 30px auto 10px;
  background-color: #ff8585;
  border-bottom: solid 2px #b5b5b5;
  box-shadow: inset 0 2px 0 #ffffff80, 0 2px 2px #00000030;
}

</style>