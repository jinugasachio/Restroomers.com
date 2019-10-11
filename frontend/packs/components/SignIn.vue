<template>
    <v-ons-page>
      <ToolBar/>
      <div class="wrapper">
        <v-ons-card>
          <v-ons-list
            v-for="item in list"
            :key="item.id"
          >
            <v-ons-list-header>{{ item.header }}</v-ons-list-header>
            <v-ons-list-item>
              <div class="center">
                <v-ons-input
                  :placeholder="item.text"
                  v-model="item.model"
                >
                </v-ons-input>
              </div>
            </v-ons-list-item>
          </v-ons-list>
          <v-ons-button modifier="large" id="signup-button" >ログインする</v-ons-button>
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
      list:[
        {id: 1, header: 'メールアドレス',    text: 'PC・携帯どちらでも可', model: '' },
        {id: 2, header: 'パスワード',       text: '6文字以上',           model: '' },
      ],
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