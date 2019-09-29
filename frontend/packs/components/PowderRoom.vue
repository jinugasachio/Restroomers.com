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
        <div>
          <v-ons-button><v-ons-icon icon="ion-thumbsup"></v-ons-icon></v-ons-button>
          <v-ons-button><v-ons-icon icon="ion-share"></v-ons-icon></v-ons-button>
        </div>
        <v-ons-list>
          <v-ons-list-header>詳細情報</v-ons-list-header>
          <v-ons-list-item>営業時間
            <div class="right">{{ room.open }}~{{ room.close }}</div>
          </v-ons-list-item>
          <v-ons-list-item>TEL
            <a class="right" :href="'tel:' + room.phone_number">{{ room.phone_number }}</a>
          </v-ons-list-item>
          <v-ons-list-item>住所
            <div class="right">{{ room.address }}</div>
            </v-ons-list-item>
          <v-ons-list-item>公式HP
            <a class="right" target="_blank" :href=room.official_url>{{ room.official_url }}</a>
          </v-ons-list-item>
        </v-ons-list>
      </div>
    </v-ons-card>
  </v-ons-page>
</template>

<script>
export default {
  
  // data: function(){
  //   return {
  //     powderRoom: detail
  //   }
  // },

  computed: {
    room(){
      return this.$store.getters.powderRoom
    },
  },
}
</script>
