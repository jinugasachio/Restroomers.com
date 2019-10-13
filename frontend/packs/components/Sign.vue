<template>
    <v-ons-page>
      <ToolBar/>
      <div class="wrapper">
        <v-ons-card>
          <ValidationObserver v-slot="{ invalid }">
          <v-ons-list
            v-for="item in signFormData"
            :key="item.id"
          >
            <v-ons-list-header>{{ item.header }}</v-ons-list-header>
            <v-ons-list-item>
              <div class="center">
                <validation-provider
                  mode="eager"
                  :rules="item.rules"
                  :ref="item.id"
                  :vid="item.vid"
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
            @click="sign"
          >
            {{ buttonName }}
          </v-ons-button>
          </ValidationObserver>
        </v-ons-card>
      </div>
    </v-ons-page>
</template>


<script>
import ToolBar from './ToolBar.vue'


export default {

  name: "SignPage",

  components: {
    ToolBar
  },

  computed:{
    currentUser(){
      return this.$store.getters.currentUser;
    },
    pageStack2(){
      return this.$store.getters.pageStack2;
    },
    signFormData(){
      return this.$store.getters.signFormData;
    },
    buttonName(){
      if(this.signFormData.length == 4){
        return '登録する'
      }
      else if(this.signFormData.length == 2){
        return 'ログインする'
      }
    }
  },

  methods:{
    sign(){
      if(this.buttonName == '登録する'){
        this.signUp();
      }
      else if (this.buttonName == 'ログインする'){
        this.signIn();
      }
    },
    signUp(){
      const userParams = {
        "nickname":              this.signFormData[0].model,
        "email":                 this.signFormData[1].model,
        "password":              this.signFormData[2].model,
        "password_confirmation": this.signFormData[3].model
      }
      this.$store.dispatch('signUp', userParams)
    },
    signIn(){
      const userParams = {
        "email":    this.signFormData[0].model,
        "password": this.signFormData[1].model
      }
      this.$store.dispatch('signIn', userParams)
    },
  },

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