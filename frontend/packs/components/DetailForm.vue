<template>
  <v-ons-card class="detail">
      <v-ons-list-header>詳細情報 (任意)</v-ons-list-header>
      <v-ons-list-item class="detail__list"
        v-for="d in detailForm"
        :key="d.name" 
      >
        <label v-text="d.name" class="center">
        </label>              
        <label class="right">
          <v-ons-input type="text"
            v-model="d.model"
            :placeholder="d.holder"
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
      detailForm: [
        { name: '営業開始', holder: '例) 10:00"',      model: ""},
        { name: '営業終了', holder: '例) 21:00"',      model: ""},
        { name: 'TEL',    holder: '例) 0312345678',  model: ""},
        { name: '住所',    holder: '例) 東京都渋谷区~', model: ""},
        { name: '公式HP',  holder: '例) https://~',   model: ""}
      ],
      // detailParams: {
      //   "open":         this.detailForm[0].model,
      //   "close":        this.detailForm[1].model,
      //   "phone_number": this.detailForm[2].model,
      //   "address":      this.detailForm[3].model,
      //   "official_url": this.detailForm[4].model
      // }
    }
  },
  mounted(){
    // debugger;
  },
  updated(){
    
  }
  
}
</script>

<style lang="scss" scoped>

.detail {
  margin-bottom: 2rem;

  &__list {
    font-size: 0.8rem;
  }
}
</style>
