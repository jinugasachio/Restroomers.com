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
        <FacilityForm
          @inputFacility="inputFacility"
        />
        <DetailForm @inputDetail="inputDetail"/>
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
      uploadedImages: [],
      // imagesParams: {
      //   "urls": []
      // },
      facilityParams: { //送るときにnullのやつは×にする
        "dresser":          '×',
        "body_mirror":      '×',
        "makeup_mirror":    '×',
        "wifi":             '×',
        "fitting_booth":    '×',
        "washstands":       '×',
        "luggage_storage":  '×',
        "outlet":           '×',
        "waiting_space":    '×',
        "dust_box":         '×',
        "membership":       0,
        "rate_plan":        '無料',
        "others":           '-'
      },
      detailParams: {
        "open":         null,
        "close":        null,
        "phone_number": null,
        "address":      null,
        "official_url": null
      },
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
      this.imagesParams["urls"].push(image);
    },
    removeImage(targetImage){
      this.uploadedImages = this.uploadedImages.filter(function(image){
        return image !== targetImage;
      });
    },
    inputFacility(item){
      debugger;
      this.facilityParams[item.key] = item.value;
    },
    inputDetail(detail){
      const key = detail.dataset.key;
      this.detailParams[key] = detail.value;
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