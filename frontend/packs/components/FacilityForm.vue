<template>
        <v-ons-card class="facility">
          <v-ons-list>
           <v-ons-list-header>設備情報 (あるものをチェック)</v-ons-list-header>

            <v-ons-list-item class="facility__list"
              v-for="list in checkBoxList"
              :key="list.name"
            >
              <label v-text="list.name" class="center"></label>
              <label class="right">
                <v-ons-checkbox
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
                <v-ons-select>
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
        { name: "ドレッサー" },
        { name: "全身鏡" },
        { name: "拡大鏡" },
        { name: "無料Wi-Fi" },
        { name: "フィッティングブース" },
        { name: "手洗いボウル" },
        { name: "荷物置き" },
        { name: "コンセント" },
        { name: "ウェイティングブース" },
        { name: "ゴミ箱" },
      ],
      selectList: [
        { name: "利用条件", options: [
        { text: 'あり', value: 'あり' }, 
        { text: 'なし', value: '特になし' }, 
      ]},
        { name: "料金プラン", options: [
        { text: '無料', value: '無料' }, 
        { text: '有料', value: '有料' }, 
      ]}
      ],


      // conditions: [
      //   { text: 'あり', value: 'あり' }, 
      //   { text: 'なし', value: '特になし' }, 
      // ],
      // plans: [
      //   { text: '無料', value: '無料' }, 
      //   { text: '有料', value: '有料' }, 
      // ],
    }
  }
  
}
</script>

<style scoped lang="scss">

.facility {
  margin-bottom: 2rem;

  .facility__list {
    font-size: 0.75rem;

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