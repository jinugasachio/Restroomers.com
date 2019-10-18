<template>
    <v-ons-page>
      <ToolBar/>
      <div class="wrapper">
        <v-ons-card>
          <ValidationObserver v-slot="{ invalid }">
          <v-ons-list>

            <v-ons-list-header>レビュースター</v-ons-list-header>
            <v-ons-list-item>
              <div class="center">
                <validation-provider
                  mode="eager"
                  rules="required"
                  v-slot="{ errors }"
                >
                    <v-ons-select v-model="rate">
                      <option 
                        v-for="num in numbers"
                        :value="num.value" 
                        :key='num.text'
                      >
                        {{ num.text }}
                      </option>
                    </v-ons-select>
                    <Star :rate="rate"/>
                <p class="error-text"><span>{{ errors[0] }}</span></p>
                </validation-provider>
              </div>
            </v-ons-list-item>

            <v-ons-list-header>口コミ</v-ons-list-header>
            <v-ons-list-item>
              <div class="center">
                <validation-provider
                  mode="eager"
                  rules="required"
                  v-slot="{ errors }"
                  class="validate-span"
                >
                <textarea
                  class="review-text"
                  placeholder="口コミを入力してください。"
                  v-model="review"
                ></textarea>
                <p class="error-text"><span>{{ errors[0] }}</span></p>
                </validation-provider>
              </div>
            </v-ons-list-item>

          </v-ons-list>
          <v-ons-button
            modifier="large"
            id="post-button" 
            :disabled="invalid"
            @click="postReview"
          >
            投稿する
          </v-ons-button>
          </ValidationObserver>
        </v-ons-card>
      </div>
    </v-ons-page>
</template>


<script>
import ToolBar from './ToolBar.vue'
import Star from './StarRating.vue'


export default {

  name: "ReviewForm",

  data(){
    return{
      rate: null,
      review: null,
      numbers: [
        { text: '評価', value: null },
        { text: '1', value: 1 }, 
        { text: '2', value: 2 }, 
        { text: '3', value: 3 }, 
        { text: '4', value: 4 }, 
        { text: '5', value: 5 },
      ]
    }
  },

  components:{
    ToolBar,
    Star 
  },

  computed:{
    room(){
      return this.$store.getters.room.powder_room
    },
    roomReviews: {
      get()         { return this.$store.getters.roomReviews },
      set(newReview){ this.$store.dispatch('postReview', newReview) }
    }
  },

  methods:{
    postReview(){
      const vm = this;
      vm.$ons.notification.confirm({ message: '投稿してもよろしいですか?', title: '' })
        .then(function(response){
          if(response == 1){
            const reviewParams = {
              "rate":           vm.rate,
              "review":         vm.review,
              "powder_room_id": vm.room.id
            }
            vm.roomReviews = reviewParams
          }
        })
    },
  },

  watch:{
    roomReviews:{
      handler(){
        this.$store.dispatch('popPage')
        this.$ons.notification.alert({ message: '投稿が完了しました。', title: '' })
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
        position: relative;
        padding-left: 6px;

        .validate-span {
          display: block;
          width: 100%;
        }

        .select {
          padding-left: 10px;
        }

        .vue-star-rating {
          position: absolute;
          top: 17px;
          right: 10px;
        }

        .review-text {
          width: 95%;
          max-width: 510px;
          height: 7rem;
          padding: 0.5rem;
          resize: none;
        }
      }
    }

    .error-text {
      font-size: 0.85rem;
      line-height: 22px;
      color: rgb(172, 44, 44);
    }

    #post-button {
      width: 65%;
      margin: 30px auto 0;
      background-color: #ff8b85;
      border-bottom: solid 2px #b5b5b5;
      box-shadow: inset 0 2px 0 #ffffff80, 0 2px 2px #00000030;
    }
  }
}

</style>