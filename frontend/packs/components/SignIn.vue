<template>
    <v-ons-page>
      <ToolBar/>
      <div class="wrapper">
        <v-ons-card>
          <ValidationObserver v-slot="{ invalid }">
          <v-ons-list
            v-for="item in list"
            :key="item.id"
          >
            <v-ons-list-header>{{ item.header }}</v-ons-list-header>
            <v-ons-list-item>
              <div class="center">
                <validation-provider
                  mode="eager"
                  :rules="item.rules"
                  :ref="item.id"
                  v-slot="{ errors }"
                >
                <v-ons-input
                  type="text"
                  class="ons-input"
                  :name="item.name"
                  :placeholder="item.text"
                  v-model="item.model"
                >
                </v-ons-input>
                <p class="error-text"><span>{{ errors[0] }}</span></p>
                </validation-provider>
              </div>
            </v-ons-list-item>
          </v-ons-list>
          <v-ons-button
            modifier="large"
            id="sign-button" 
            :disabled="invalid"
            @click="signIn"
          >
            ログインする
          </v-ons-button>
          </ValidationObserver>
        </v-ons-card>
      </div>
    </v-ons-page>
</template>


<script>
import ToolBar from './ToolBar.vue'
import { validate } from 'vee-validate';


export default {

  name: "SignIn",

  components: {
    ToolBar
  },

  data(){
    return {
      list:[
        { 
          id: 1,
          header: 'メールアドレス',
          text: 'PC・携帯どちらでも可',
          model: '',
          name: 'email',
          rules: 'required|email'
        },{
          id: 2,
          header: 'パスワード',
          text: '6文字以上',
          model: '' ,
          name: 'password',
          rules: 'required|min:6'
        }
      ],
    }
  },

  computed:{
    currentUser(){
      return this.$store.getters.currentUser;
    },
    pageStack2(){
      return this.$store.getters.pageStack2;
    }
  },

  methods:{
    signIn(){
      const userParams = {
        "email":    this.list[0].model,
        "password": this.list[1].model
      }
      this.$store.dispatch('signIn', userParams)
    },
    register () {
      debugger;
      this.$validator.validateAll().then((result) => {
        if (!result) {
          alert(this.errors.all())
          return
        }
        alert('Hello, ' + this.email)
      })
    },
  },

  watch:{
    currentUser:{
      handler(){
        this.$ons.notification.alert({message: 'ログインしました！', title: ''});
        this.$store.dispatch('resetPageStack')
      }
    }
  }

}
</script>

<style lang="scss" scoped>

.wrapper {
  display: flex;
  width: 100%;
  height: 100%;

  .card {
    display: inline-block;
    width: 90%;
    max-width: 560px;
    padding: 40px 20px 20px;
    margin: auto;

    .list-item {
      padding: 0;

      .list-item__center {
        padding-left: 6px;

        .ons-input {
          width: 14rem;
        }
      }
    }

    .error-text {
      font-size: 0.85rem;
      line-height: 22px;
      color: rgb(172, 44, 44);
    }

    #sign-button {
      width: 65%;
      margin: 30px auto 0;
      background-color: #ff8b85;
    }
  }
}

</style>