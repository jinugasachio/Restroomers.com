<template>
  <v-ons-list>
    <v-ons-list-header>詳細情報</v-ons-list-header>
    <v-ons-list-item>営業時間
      <div class="right">
        {{ detail.open }} ~ {{ detail.close }}
      </div>
    </v-ons-list-item>
    <v-ons-list-item>TEL
      <a class="right" :href="'tel:' + detail.phone_number">
        {{ detail.phone_number }}
      </a>
    </v-ons-list-item>
    <v-ons-list-item>住所
      <div class="right">
        {{ detail.address }}
      </div>
      </v-ons-list-item>
    <v-ons-list-item>公式HP
      <a class="right" target="_blank" :href=detail.official_url>
        ホームページを確認する
      </a>
    </v-ons-list-item>
  </v-ons-list>
</template>

<script>
export default {
  computed: {
    detail(){
      return this.$store.getters.powderRoom.detail
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
</style>