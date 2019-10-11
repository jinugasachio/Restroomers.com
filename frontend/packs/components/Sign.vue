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
          <v-ons-button
            v-for="button in buttons"
            :key="button.id"
            modifier="large"
            :id="button.name"
            @click="button.event"
          >
            {{button.text}}
          </v-ons-button>
        </v-ons-card>
      </div>
    </v-ons-page>
</template>


<script>
import ToolBar from './ToolBar.vue'
import SignUp from './SignUp.vue'
import SignIn from './SignIn.vue'

export default {

  name: "Sign",
  components: {
    ToolBar,
    SignUp,
    SignIn
  },
  data(){
    return{
      buttons:[
        { id: 1, text: '新規登録',    name: "sign_up", event: this.push },
        { id: 2, text: 'ログイン',    name: "sign_in", event: this.push }, 
        { id: 3, text: '簡単ログイン', name: "sign_in-easy", event: this.easySignIn }
      ],
      testUser: {
        "email": "test@gmail.com",
        "password": "123456"
      }
    }
  },
  computed:{
    currentUser(){
      return this.$store.getters.currentUser
    },
    pageStack2(){
      return this.$store.getters.pageStack2
    }
  },
  methods: {
    push(event){
      if(event.target.id == 'sign_up'){
        this.$store.dispatch('pushPage', SignUp)
      }
      else if(event.target.id == 'sign_in'){
        this.$store.dispatch('pushPage', SignIn)
      }
    },

    easySignIn(){
      if(window.confirm('ログインしてもよろしいですか？')){
        this.$store.dispatch('signIn', this.testUser)
      }
    }
  },
  watch:{
    currentUser:{
      handler(){
        if(this.pageStack2.length == 1){
          alert('ログインしました！')
        }
      }
    }
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
    height: 450px;
    padding: 50px 16px 20px;
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
      top: 9px;
      right: 15px;
    }

    .title-text {
      margin-bottom: 2rem;
      font-size: 0.9rem;
      font-weight: 600;
      color: #7a7a7a;
      text-align: center;
    }

    .button--large {
      width: 65%;
      margin: 0 auto 2rem;
      cursor: pointer;
    }

    #sign_up {
      background-color: #fd9d98;
    }

    #sign_in {
      background-color: #fd9d98;
    }

    #sign_in-easy {
      background-color: #ff645c;
    }
  }
}
</style>
