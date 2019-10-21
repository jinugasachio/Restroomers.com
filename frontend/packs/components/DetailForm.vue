<template>
  <v-ons-card class="detail">
      <v-ons-list-header>詳細情報 (任意)</v-ons-list-header>
      <v-ons-list-item class="detail__list"
        v-for="detail in detailForm"
        :key="detail.name" 
      >
        <label v-text="detail.name" class="center">
        </label>              
        <label class="right">
          <v-ons-input :placeholder="detail.holder" type="text"
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
        { name: '営業開始', holder: '例) 10:00"' },
        { name: '営業終了', holder: '例) 21:00"' },
        { name: 'TEL',    holder: '例) 0312345678' },
        { name: '住所',    holder: '例) 東京都渋谷区~' },
        { name: '公式HP',  holder: '例) https://~' }
      ]
    }
  }
  
}
</script>

<style lang="scss" scoped>

.detail {
  &__list {
    font-size: 0.8rem;
  }
}
</style>
