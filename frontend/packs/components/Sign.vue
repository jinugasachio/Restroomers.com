<template>
    <v-ons-page>
      <ToolBar/>
      <div class="wrapper">
        <v-ons-card>
          <h2 class="title">
            Restroomers.com
            <img src='packs/images/lipstick.png' alt='口紅の写真' class='lip_image'>
          </h2>
          <p class="title-text">近くのレストルームを見つけよう！</p>
          <v-ons-button modifier="large" id="sign_up" >新規登録</v-ons-button>
          <v-ons-button modifier="large" id="sign_in">ログイン</v-ons-button>
          <v-ons-button modifier="large" id="sign_in-easy" >簡単ログイン</v-ons-button>
        </v-ons-card>
      </div>
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

.center {
  width: 100%;
}

.wrapper {
  display: flex;
  width: 100%;
  height: 100%;

  .card {
    display: inline-block;
    width: 90%;
    max-width: 560px;
    margin: auto;

    .title {
      position: relative;
      max-width: 256px;
      margin: 12px auto;
      font-weight: 900;
      text-align: center;
    }

    img {
      position: absolute;
      top: 13px;
      right: 1px;
    }

    .title-text {
      margin-bottom: 2rem;
      font-size: 0.9rem;
      font-weight: 900;
      color: #7a7a7a;
      text-align: center;
    }

    .button--large {
      width: 65%;
      margin: 0 auto 2rem;
      cursor: pointer;
    }

    #sign_up {
      background-color: #ff8b85;
    }

    #sign_in {
      background-color: #ff8b85;
    }

    #sign_in-easy {
      background-color: #ff554d;

      &:active {
        background-color: #c9423a !important;
      }
    }
  }
}
</style>
