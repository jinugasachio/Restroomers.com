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
        <v-ons-list>
          <v-ons-list-header>設備情報</v-ons-list-header>
          <div class="f-container">
            <div class="f-item">
              <p>ドレッサー</p>
              <div><p>{{ room.dresser }}</p></div>
            </div>
            <div class="f-item">
              <p>全身鏡</p>
              <div><p>{{ room.body_mirror }}</p></div>
            </div>
            <div class="f-item">
              <p>拡大鏡</p>
              <div><p>{{ room.makeup_mirror }}</p></div>
            </div>
            <div class="f-item">
              <p>無料Wi-Fi</p>
              <div><p>{{ room.wifi }}</p></div>
            </div>
            <div class="f-item">
              <p>フィッティングスペース</p>
              <div><p>{{ room.fitting_booth }}</p></div>
            </div>
            <div class="f-item">
              <p>手洗いボウル</p>
              <div><p>{{ room.washstands }}</p></div>
            </div>
            <div class="f-item">
              <p>荷物置き</p>
              <div><p>{{ room.luggage_storage }}</p></div>
            </div>
            <div class="f-item">
              <p>コンセント</p>
              <div><p>{{ room.outlet }}</p></div>
            </div>
            <div class="f-item">
              <p>ウェイティングスペース</p>
              <div><p>{{ room.waiting_space }}</p></div>
            </div>
            <div class="f-item">
              <p>ゴミ箱</p>
              <div><p>{{ room.dust_box }}</p></div>
            </div>
            <div class="f-item">
              <p>利用条件</p>
              <div><p class="letter">{{ room.membership }}</p></div>
            </div>
            <div class="f-item">
              <p>料金プラン</p>
              <div><p class="letter">{{ room.rate_plan }}</p></div>
            </div>
            <div class="f-item others">
              <p>その他</p>
              <div><p class="letter">{{ room.others }}</p></div>
            </div>
          </div>
        </v-ons-list>


        <v-ons-list>
          <v-ons-list-header>詳細情報</v-ons-list-header>
          <v-ons-list-item>営業時間
            <div class="right">
              {{ room.open }} ~ {{ room.close }}
            </div>
          </v-ons-list-item>
          <v-ons-list-item>TEL
            <a class="right" :href="'tel:' + room.phone_number">
              {{ room.phone_number }}
            </a>
          </v-ons-list-item>
          <v-ons-list-item>住所
            <div class="right">
              {{ room.address }}
            </div>
            </v-ons-list-item>
          <v-ons-list-item>公式HP
            <a class="right" target="_blank" :href=room.official_url>
              ホームページを確認する
            </a>
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

<style lang="scss" scoped>

a {
  &:hover {
    cursor: pointer !important;
  }
}

.f-container {
  display: flex;
  flex-flow: row wrap;
  justify-content: space-around;
  width: 100%;
  padding-top: 0.8rem;
  margin: 0 auto;

  .f-item {
    width: 30%;
    height: 100%;
    margin-bottom: 1rem;
    font-size: 0.1rem;
    text-align: center;
    border: solid  #b2b2b2 1px;

    &.others {
      width: 97%;

      .letter {
        padding: 1rem 1rem;
        text-align: left;
      }
    }

    div {
      border-top: solid  #b2b2b2 1px;

      .letter {
        padding: 0.5rem 0;
        font-size: 1rem;
      }

      p {
        font-size: 2rem;
        line-height: 90%;
      }
    }

    p {
      padding-bottom: 2px;
    }
  }
}
</style>