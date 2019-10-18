<template>
  <v-ons-list>
    <v-ons-list-header>
      みんなの口コミ
      <button class="review-button"
        @click="pushPage"
      >
        投稿する
      </button>
    </v-ons-list-header>

    <v-ons-list-item
      v-for="review in roomReviews"
      :key="review.id"
    >
      <div class="user-name">

      </div>
      <div class="user-review">
        <Star/>
        <div class="user-review__text">

        </div>
      </div>
      

    </v-ons-list-item>
  </v-ons-list>
</template>

<script>
import ReviewForm from './ReviewForm.vue'
import Star from './StarRating.vue'

export default {

  name: 'Review',
  components: {
    ReviewForm,
    Star
  },
  computed: {
    headers(){
      return this.$store.getters.headers
    },
    roomReviews(){
      return this.$store.getters.roomReviews 
    }
  },
  methods: {
    pushPage(){
      if(this.headers !== null){
        this.$store.dispatch('pushPage', ReviewForm)
      }
      else{
        this.$ons.notification.alert({ message: 'ログインしてください。', title: '' });
      }
    }
  }

}
</script>

<style lang="scss" scoped>

.list-header {
  margin-top: 1rem;

  .review-button {
    position: absolute;
    top: 2px;
    right: 10px;
    display: inline-block;
    height: 1.3rem;
    background-color: #fff;
    border-radius: 4px;
    outline: 0;

    &:active {
      background-color: #ddd;
    }
  }
}

</style>