<template>


        <v-ons-card class="facility">
          <v-ons-list>
           <v-ons-list-header>設備情報 (あるものをチェック)</v-ons-list-header>

            <v-ons-list-item class="facility__list">
              <label class="center">
                ドレッサー
              </label>              
              <label class="right">
                <v-ons-checkbox
                >
                </v-ons-checkbox>
              </label>
            </v-ons-list-item>
            
            <v-ons-list-item class="facility__list">
              <label class="center">
                 全身鏡
              </label>              
              <label class="right">
                <v-ons-checkbox
                >
                </v-ons-checkbox>
              </label>

            </v-ons-list-item>

            <v-ons-list-item class="facility__list">
              <label class="center">
                拡大鏡
              </label>              
              <label class="right">
                <v-ons-checkbox
                >
                </v-ons-checkbox>
              </label>
            </v-ons-list-item>

            <v-ons-list-item class="facility__list">
              <label class="center">
                無料Wi-Fi
              </label>              
              <label class="right">
                <v-ons-checkbox
                >
                </v-ons-checkbox>
              </label>
            </v-ons-list-item>

            <v-ons-list-item class="facility__list">
              <label class="center">
                フィッティングブース
              </label>              
              <label class="right">
                <v-ons-checkbox
                >
                </v-ons-checkbox>
              </label>
            </v-ons-list-item>

            <v-ons-list-item class="facility__list">
              <label class="center">
                手洗いボウル
              </label>              
              <label class="right">
                <v-ons-checkbox
                >
                </v-ons-checkbox>
              </label>
            </v-ons-list-item>

            <v-ons-list-item class="facility__list">
              <label class="center">
                荷物置き
              </label>              
              <label class="right">
                <v-ons-checkbox
                >
                </v-ons-checkbox>
              </label>
            </v-ons-list-item>

            <v-ons-list-item class="facility__list">
              <label class="center">
                コンセント
              </label>              
              <label class="right">
                <v-ons-checkbox
                >
                </v-ons-checkbox>
              </label>
            </v-ons-list-item>

            <v-ons-list-item class="facility__list">
              <label class="center">
                ウェイティングブース
              </label>              
              <label class="right">
                <v-ons-checkbox
                >
                </v-ons-checkbox>
              </label>
            </v-ons-list-item>

            <v-ons-list-item class="facility__list">
              <label class="center">
                ゴミ箱
              </label>              
              <label class="right">
                <v-ons-checkbox
                >
                </v-ons-checkbox>
              </label>
            </v-ons-list-item>

            <v-ons-list-item class="facility__list">
              <label class="center">
                利用条件
              </label>
              <label class="right">
                <v-ons-select>
                  <option 
                    v-for="c in conditions"
                    :value="c.value" 
                    :key='c.text'
                  >
                    {{ c.text }}
                  </option>
                </v-ons-select>
              </label>
            </v-ons-list-item>

            <v-ons-list-item class="facility__list">
              <label class="center">
                料金プラン
              </label>              
              <label class="right">
                <v-ons-select>
                  <option 
                    v-for="p in plans"
                    :value="p.value" 
                    :key='p.text'
                  >
                    {{ p.text }}
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
      conditions: [
        { text: 'あり', value: 'あり' }, 
        { text: 'なし', value: '特になし' }, 
      ],
      plans: [
        { text: '無料', value: '無料' }, 
        { text: '有料', value: '有料' }, 
      ],
    }
  }
  
}
</script>

<style scoped lang="scss">

.facility {
  .facility__list {
    font-size: 0.75rem;

    .facility-text {
      padding: 0;
    }
  }
}

</style>