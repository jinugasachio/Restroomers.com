<template>
    <v-ons-page>
      <ToolBar/>
      <div class="wrapper">
        <v-ons-card>
          <!-- <v-ons-list
            v-for="item in list"
            :key="item.id"
          >
            <v-ons-list-header>{{ item.header }}</v-ons-list-header>
            <v-ons-list-item>
              <div class="center">

                <v-ons-input
                  class="form-control"
                  :name="item.name"
                  :v-validate="item.validate"
                  :data-vv-as="item.data"
                  :placeholder="item.text"
                  v-model="item.model"
                >
                </v-ons-input>
                <div class="form-control-feedback"
                  v-show="errors.has(item.name)"
                >
                  <p class="alert alert-danger">{{ errors.first(item.name) }}</p>
                </div>
              </div>
            </v-ons-list-item>
          </v-ons-list> -->

<validation-provider rules="required" v-slot="{ errors }">
  <input v-model="email" name="email" type="text" />
  <span>{{ errors[0] }}</span>
</validation-provider>
          <v-ons-button
            modifier="large"
            id="signup-button" 
            @click="register"
          >
            ログインする
          </v-ons-button>
        </v-ons-card>
      </div>
    </v-ons-page>
</template>


<script>
import ToolBar from './ToolBar.vue'


export default {

  name: "SignIn",

  components: {
    ToolBar
  },

  data(){
    return {
      email:'',
      name: 'name',
      // list:[
      //   { 
      //     id: 1,
      //     header: 'メールアドレス',
      //     text: 'PC・携帯どちらでも可',
      //     model: '',
      //     name: 'email',
      //     validate: 'required|email',
      //     data: 'メールアドレス'
      //   },
        // {
        //   id: 2,
        //   header: 'パスワード',
        //   text: '6文字以上',
        //   model: '' 
        // },
      // ],
      errors: []
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
      this.$validator.validateAll().then((result) => {
        if (!result) {
          alert(this.errors.all())
          return
        }
        alert('Hello, ' + this.email)
      })
    }
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

    .text-input {
      width: 180%;
    }

    #signup-button {
      width: 65%;
      margin: 30px auto 0;
      background-color: #ff8b85;
    }
  }
}

</style>