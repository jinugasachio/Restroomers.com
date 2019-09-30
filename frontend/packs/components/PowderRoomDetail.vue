<template>
  <v-ons-list>
    <v-ons-list-header>詳細情報</v-ons-list-header>
    <v-ons-list-item>営業時間
      <div class="right">
        {{ room.open }} ~ {{ room.close }}
      </div>
    </v-ons-list-item>
    <v-ons-list-item>TEL
      <a class="right" :href="'tel:' + room.phone_number">
        {{ room.phone_number }}
      </a>
    </v-ons-list-item>
    <v-ons-list-item>住所
      <div class="right">
        {{ room.address }}
      </div>
      </v-ons-list-item>
    <v-ons-list-item>公式HP
      <a class="right" target="_blank" :href=room.official_url>
        ホームページを確認する
      </a>
    </v-ons-list-item>
  </v-ons-list>
</template>

<script>
export default {
  computed: {
    room(){
      return this.$store.getters.powderRoom
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