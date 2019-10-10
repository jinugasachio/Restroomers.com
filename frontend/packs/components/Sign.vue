<template>
    <v-ons-page>
      <ToolBar/>
      <v-ons-card>
        <h1 class="title">Restroomers.com</h1>
        <p class="title-text">お気に入りのレストルームを見つけよう！</p>
        <v-ons-button modifier="large" id="sign_up" >登録する</v-ons-button>
        <v-ons-button modifier="large" id="sign_in">ログイン</v-ons-button>
        <v-ons-button modifier="large" id="sign_in-easy" >簡単ログイン</v-ons-button>
      </v-ons-card>
    </v-ons-page>
</template>


<script>
import ToolBar from './ToolBar.vue'

export default {

  name: "Sign",
  components: {
    ToolBar
  }



}
</script>

<style lang="scss" scoped>
.card {
  .title {
    text-align: center;
  }

  .title-text {
    font-weight: 900;
    color: #7a7a7a;
    text-align: center;
  }
}
</style>
