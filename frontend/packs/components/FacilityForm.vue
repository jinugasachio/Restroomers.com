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
            :data-key="list.name"
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
          <v-ons-select v-model="list.model">
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
                v-model="facilityText"
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
        { name: "ドレッサー",          model: false },
        { name: "全身鏡",              model: false },
        { name: "拡大鏡",              model:  false },
        { name: "無料Wi-Fi",          model: false },
        { name: "フィッティングブース",  model: false },
        { name: "手洗いボウル",         model: false },
        { name: "荷物置き",            model: false },
        { name: "コンセント",          model:  false },
        { name: "ウェイティングブース",  model:  false },
        { name: "ゴミ箱",              model:  false },
      ],
      selectList: [
        { name: "利用条件", model: null,
          options: [
            { text: 'あり', value: 1 }, 
            { text: 'なし', value: 0 }, 
          ]
        },
        { name: "料金プラン", model: null,
          options: [
            { text: '無料', value: '無料' }, 
            { text: '有料', value: '有料' }, 
          ]
        }
      ],
      facilityText: '',
    }
  },
  methods:{
    check(e){
      debugger;
      const vm = this;
      const index = e.target.id;

      // const unwatch = this.$watch('checkBoxList[`${index}`].model', function(){
        
        const key = e.currentTarget.dataset.key
        const checked = this.checkBoxList[index].model

        if(checked){
          this.$emit('check', { key: key, value: "○" })
        }
        else{
          this.$emit('check',  { key: key, value: "×" })
        }
      //   unwatch()
      // })


    }
  },
    //   mounted(){
    //   // debugger;
    // },
    updated(){
      debugger;
    },
    // beforeDestroy(){
    //   debugger;
    // }
  
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
        min-width: 100%;
        max-width: 100%;
        min-height: 75px;
        font-size: 0.8rem;
        resize: none;
      }
    }
  }
}

</style>