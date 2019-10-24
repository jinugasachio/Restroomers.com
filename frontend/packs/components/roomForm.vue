<template>
    <v-ons-page>
      <ToolBar/>
      <div class="wrapper">
        <ImageForm
          :previewImages="previewImages"
          @inputRoomName="inputRoomName"
          @previewImage="previewImage"
          @removeImage="removeImage"
        />
        <FacilityForm @inputFacility="inputFacility"/>
        <DetailForm  @inputDetail="inputDetail"/>
        <v-ons-button id="post-button" modifier="large"
          @click="postRoom"
        >投稿する
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
      previewImages: [],
      roomParams: {
        "name": null,
        "lat":  null,
        "lng":  null
      },
      facilityParams: {
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
        "membership":       'なし',
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

  computed: {
    center(){
      return this.$store.getters.center
    },
    markers(){
      return this.$store.getters.allRooms
    },
  },

  methods: {
    inputRoomName(name){
      this.roomParams["name"] = name;
    },
    previewImage(image){
      this.previewImages.push(image);
    },
    removeImage(targetImage){
      this.previewImages = this.previewImages.filter(function(image){
        return image !== targetImage;
      });
    },
    inputFacility(item){
      this.facilityParams[item.key] = item.value;
    },
    inputDetail(detail){
      const key = detail.dataset.key;
      this.detailParams[key] = detail.value;
    },
    postRoom(){
      const vm = this;
      vm.$ons.notification.confirm({ message: '投稿してもよろしいですか?', title: '' })
        .then(function(response){
          if(response == 1){
            const params = { room: {
              room_params:     vm.roomParams,
              facility_params: vm.facilityParams,
              detail_params:   vm.detailParams,
              images_params:   { "urls": vm.previewImages },
            }}
            vm.$store.dispatch('postRoom', params)
          }
        })
    },
  },
  mounted(){
    this.roomParams["lat"] = this.center.lat;
    this.roomParams["lng"] = this.center.lng;
  },
  watch:{
    markers(){
      this.$ons.notification.alert({ message: '投稿が完了しました。', title: '' })
      this.$store.dispatch('resetPageStack')
    }
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