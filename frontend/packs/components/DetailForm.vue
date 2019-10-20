<template>

        <v-ons-card>
           <v-ons-list-header>詳細情報 (任意)</v-ons-list-header>

            <v-ons-list-item class="facility__list">
              <label class="center">
                営業開始
              </label>              
              <label class="right">
                <v-ons-input placeholder="例) 10:00" type="text"
                >
                </v-ons-input>
              </label>
            </v-ons-list-item>

            <v-ons-list-item class="facility__list">
              <label class="center">
                営業終了
              </label>              
              <label class="right">
                <v-ons-input placeholder="例) 21:00" type="text"
                >
                </v-ons-input>
              </label>
            </v-ons-list-item>

            <v-ons-list-item class="facility__list">
              <label class="center">
                TEL
              </label>              
              <label class="right">
                <v-ons-input placeholder="例) 0312345678" type="text"
                >
                </v-ons-input>
              </label>
            </v-ons-list-item>

            <v-ons-list-item class="facility__list">
              <label class="center">
                住所
              </label>              
              <label class="right" >
                <v-ons-input placeholder="例) 東京都渋谷区~" type="text"
                >
                </v-ons-input>
              </label>
            </v-ons-list-item>

            <v-ons-list-item class="facility__list">
              <label class="center">
                公式HP
              </label>              
              <label class="right">
                <v-ons-input placeholder="例) https://~" type="text"
                >
                </v-ons-input>
              </label>
            </v-ons-list-item>
        </v-ons-card>

</template>

<script>


export default {

  name: 'DetailForm',

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
