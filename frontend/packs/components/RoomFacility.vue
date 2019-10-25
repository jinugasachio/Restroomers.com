<template>
  <v-ons-list>
    <v-ons-list-header>設備情報</v-ons-list-header>
    <div class="f-container">
      <div class="f-item" v-for="item in facilities" :key="item.name" :id="item.id">
        <p class="f-item-name" v-text="item.name"></p>
        <div><p :class="item.class" v-text="item.value"></p></div>
      </div>
    </div>
  </v-ons-list>
</template>

<script>

export default {

  data(){
    return{
      facilities: [
        { name: "ドレッサー",         key: "dresser",          value: null },
        { name: "全身鏡",            key: "body_mirror",      value: null },
        { name: "拡大鏡",            key: "makeup_mirror",    value: null },
        { name: "無料Wi-Fi",         key: "wifi",             value: null },
        { name: "フィッティングブース", key: "fitting_booth",   value: null },
        { name: "手洗いボウル",        key: "washstands",      value: null },
        { name: "荷物置き",           key: "luggage_storage", value: null },
        { name: "コンセント",         key: "outlet",          value: null },
        { name: "ウェイティングブース", key: "waiting_space",   value: null },
        { name: "ゴミ箱",             key: "dust_box",        value: null },
        { name: "利用条件",           key: "membership",      value: null, class: "letter" },
        { name: "料金プラン",         key: "rate_plan",        value: null, class: "letter" },
        { name: "その他",            key: "others",           value: null, class: "letter", id: "others" },
      ]
    }
  },

  computed: {
    facility(){
      return this.$store.getters.room.facility;
    },
  },
  methods:{
    updateFacilities(){
      const vm = this;
      vm.facilities.forEach(function(item){
        item.value = vm.facility[item.key]
      })
    }
  },
  mounted(){
    this.updateFacilities();
  }

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

    &#others {
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