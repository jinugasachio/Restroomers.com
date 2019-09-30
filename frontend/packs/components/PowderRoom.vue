<template>
  <v-ons-page>
    <ToolBar/>
    <v-ons-card>
      <img src="https://monaca.io/img/logos/download_image_onsenui_01.png" alt="Onsen UI" style="width: 100%;">
      <div class="title">
        Awesome framework
      </div>
      <div class="content">
        <!-- <div>
          <v-ons-button><v-ons-icon icon="ion-thumbsup"></v-ons-icon></v-ons-button>
          <v-ons-button><v-ons-icon icon="ion-share"></v-ons-icon></v-ons-button>
        </div>
         -->
        <Facility/>
        <Detail/>
      </div>
    </v-ons-card>
  </v-ons-page>
</template>

<script>
import ToolBar from './ToolBar.vue'
import Facility from './PowderRoomFacility.vue'
import Detail from './PowderRoomDetail.vue'

export default {
  
  // data: function(){
  //   return {
  //     powderRoom: detail
  //   }
  // },
  components: {
    ToolBar,
    Facility,
    Detail
  },

  computed: {
    room(){
      return this.$store.getters.powderRoom
    },
  },
}
</script>