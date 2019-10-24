<template>
  <v-ons-card class="facility">
    <v-ons-list>
      <v-ons-list-header>設備情報 (あるものをチェック)</v-ons-list-header>
      <v-ons-list-item class="facility__list"  tappable
        v-for="(list, $index) in checkBoxList"
        :key="list.name"
      >
        <label class="center"
          v-text="list.name"
          :for="$index"
        ></label>
        <label class="right">
          <v-ons-checkbox
            @change="check"
            :input-id="$index"
            :data-key="list.key"
            v-model="list.model"
          >
          </v-ons-checkbox>
        </label>
      </v-ons-list-item>
      <v-ons-list-item class="facility__list"
        v-for="list in selectList"
        :key="list.name"
      >
        <label v-text="list.name" class="center"></label>
        <label class="right">
          <v-ons-select
            v-model="list.model"
            :data-key="list.key"
            @change="selectOrText"
          >
            <option 
              v-for="o in list.options"
              :value="o.value" 
              :key='o.text'
            >
              {{ o.text }}
            </option>
          </v-ons-select>
        </label>
      </v-ons-list-item>
      <v-ons-list-header>その他</v-ons-list-header>
      <v-ons-list-item class="facility__list">
            <textarea
                class="facility-text__inner"
                placeholder="追記情報などを入力。"
                data-key="others"
                @change="selectOrText"
            ></textarea>
      </v-ons-list-item>
    </v-ons-list>
  </v-ons-card>
</template>

<script>

export default {

  name: 'FacilityForm',

  data(){
    return{
      checkBoxList: [
        { name: "ドレッサー",          key: "dresser",         model: false },
        { name: "全身鏡",             key: "body_mirror",     model: false },
        { name: "拡大鏡",             key: "makeup_mirror",   model:  false },
        { name: "無料Wi-Fi",          key: "wifi",            model: false },
        { name: "フィッティングブース",  key: "fitting_booth",   model: false },
        { name: "手洗いボウル",         key: "washstands",     model: false },
        { name: "荷物置き",            key: "luggage_storage", model: false },
        { name: "コンセント",          key: "outlet",          model:  false },
        { name: "ウェイティングブース",  key: "waiting_space",   model:  false },
        { name: "ゴミ箱",              key: "dust_box",        model:  false }
      ],
      selectList: [
    { name: "利用条件", key: "membership", model: null,
      options: [
        { text: "あり", value: "あり" }, 
        { text: "なし", value: "なし" }
      ]
    },
    { name: "料金プラン", key: "rate_plan", model: null,
      options: [
        { text: "無料", value: "無料" }, 
        { text: "有料", value: "有料" }
      ]
    }
  ]
    }
  },
  methods:{
    check(e){
      const unwatch = this.$watch('checkBoxList', function(){
        const index = e.target.id;
        const key = e.currentTarget.dataset.key
        const checked = this.checkBoxList[index].model
        if(checked){
          this.$emit('inputFacility', { key: key, value: '○' })
        }
        else{
          this.$emit('inputFacility',  { key: key, value: '×' })
        }
        unwatch()
      }, { deep: true })
    },
    selectOrText(e){
      const key = e.currentTarget.dataset.key;
      const value = e.target.value;
      this.$emit('inputFacility',  { key: key, value: value })
    },
  },
  mounted(){
    debugger;
  }
}
</script>

<style lang="scss">

.facility {
  margin-bottom: 2rem;

  .facility__list {
    font-size: 0.75rem;

    :checked + .checkbox__checkmark::before {
      background: #8ad4ff;
      border: none;
    }

    .facility-text {
      padding: 0;

      &__inner {
        min-width: 90%;
        max-width: 90%;
        min-height: 75px;
        padding: 0.7rem;
        font-size: 0.8rem;
        resize: none;
      }
    }
  }
}

</style>