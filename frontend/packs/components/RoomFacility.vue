<template>
  <v-ons-list>
    <v-ons-list-header>設備情報</v-ons-list-header>
    <div class="f-container">
      <div class="f-item">
        <p class="f-item-name">ドレッサー</p>
        <div><p>{{ facility.dresser }}</p></div>
      </div>
      <div class="f-item">
        <p class="f-item-name">全身鏡</p>
        <div><p>{{ facility.body_mirror }}</p></div>
      </div>
      <div class="f-item">
        <p class="f-item-name">拡大鏡</p>
        <div><p>{{ facility.makeup_mirror }}</p></div>
      </div>
      <div class="f-item">
        <p class="f-item-name">無料Wi-Fi</p>
        <div><p>{{ facility.wifi }}</p></div>
      </div>
      <div class="f-item">
        <p class="f-item-name">フィッティングブース</p>
        <div><p>{{ facility.fitting_booth }}</p></div>
      </div>
      <div class="f-item">
        <p class="f-item-name">手洗いボウル</p>
        <div><p>{{ facility.washstands }}</p></div>
      </div>
      <div class="f-item">
        <p class="f-item-name">荷物置き</p>
        <div><p>{{ facility.luggage_storage }}</p></div>
      </div>
      <div class="f-item">
        <p class="f-item-name">コンセント</p>
        <div><p>{{ facility.outlet }}</p></div>
      </div>
      <div class="f-item">
        <p class="f-item-name">ウェイティングブース</p>
        <div><p>{{ facility.waiting_space }}</p></div>
      </div>
      <div class="f-item">
        <p class="f-item-name">ゴミ箱</p>
        <div><p>{{ facility.dust_box }}</p></div>
      </div>
      <div class="f-item">
        <p class="f-item-name">利用条件</p>
        <div><p class="letter">{{ facility.membership }}</p></div>
      </div>
      <div class="f-item">
        <p class="f-item-name">料金プラン</p>
        <div><p class="letter">{{ facility.rate_plan }}</p></div>
      </div>
      <div class="f-item others">
        <p class="f-item-name">その他</p>
        <div><p class="letter">{{ facility.others }}</p></div>
      </div>
    </div>
  </v-ons-list>
</template>

<script>
//後で下記参考にようリファクタリング
// import facilityData from "../modules/facility.json"

export default {
  
  data: function(){
    return {
      // names: [{"ドレッサー"}, {"全身鏡"}, {"拡大鏡"}, {"無料Wi-Fi"}, {"フィッティングスペース"}, 
      //        {"手洗いボウル"}, {"荷物置き"}, {"コンセント"}, {"ウェイティングスペース"}, {"ゴミ箱"}],

      // columns: ["dresser", "body_mirror", "makeup_mirror", "wifi", "fitting_booth", 
      //          "washstands", "luggage_storage", "outlet", "waiting_space", "dust_box"]
      // facilities: facilityData
    }
  },

  computed: {
    facility(){
      return this.$store.getters.room.facility
    },
  },

}
</script>

<style lang="scss" scoped>

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
    font-size: 0.6rem;
    text-align: center;
    border: solid  #b2b2b2 1px;

    .f-item-name {
      padding: 0.1rem 0 !important;
    }

    &.others {
      width: 97%;

      .letter {
        padding: 0.5rem 1rem;
        line-height: 1.5;
        text-align: left;
      }
    }

    div {
      border-top: solid  #b2b2b2 1px;

      .letter {
        padding: 0.35rem 0;
        font-size: 0.8rem;
      }

      p {
        font-size: 1.3rem;
        line-height: 100%;
        color: #3a3a3a;
      }
    }

    p {
      padding-bottom: 2px;
    }
  }
}
</style>