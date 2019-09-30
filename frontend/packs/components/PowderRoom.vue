<template>
  <v-ons-page>
    <v-ons-toolbar>
      <div class="left">
        <v-ons-back-button></v-ons-back-button>
      </div>
      <div class="center">{{ room.name }}</div>
    </v-ons-toolbar>

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
import Facility from './PowderRoomFacility.vue'
import Detail from './PowderRoomDetail.vue'

export default {
  
  // data: function(){
  //   return {
  //     powderRoom: detail
  //   }
  // },
  components: {
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