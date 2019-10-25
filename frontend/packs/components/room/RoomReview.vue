<template>
  <v-ons-list>
    <v-ons-list-header>
      みんなの口コミ
      <button class="review-button" @click="pushPage">
        <span>投稿する</span>
      </button>
    </v-ons-list-header>
    <v-ons-list-item
      class="review"
      v-for="review in roomReviews"
      :key="review.id"
    >
      <div class="review-box">
          <div class="user-name">
            <p v-text="review.user.nickname"></p>
          </div>
          <div class="user-review">
            <div class="user-review__inner">
              <Star class="user-review__inner__star" :userRate="review.rate"/>
              <span v-text="review.rate"></span>
            </div>
            <div class="user-review__text">
              <p v-text="review.review"></p>
            </div>
          </div>
      </div>
    </v-ons-list-item>


  </v-ons-list>
</template>

<script>
import ReviewForm from '../form/ReviewForm.vue'
import Star       from '../others/StarRating.vue'

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
  .review-button {
    position: absolute;
    top: 2px;
    right: 10px;
    display: inline-block;
    height: 1.3rem;
    cursor: pointer;
    background-color: #fff;
    border-style: solid;
    border-width: 1px;
    border-radius: 4px;
    outline: 0;

    span {
      font-size: 12px;
      line-height: 0;
    }

    &:active {
      background-color: #ddd;
    }
  }
}

.user-name {
  margin-bottom: 4px;

  p {
    font-size: 12px;
  }
}

.user-review {
  margin-bottom: 5px;

  .user-review__inner {
    position: relative;
    width: 153px;
    margin-bottom: 10px;

    span {
      position: absolute;
      top: 0;
      right: 72px;
    }
  }

  .user-review__text {
    white-space: pre-wrap;
  }
}

</style>