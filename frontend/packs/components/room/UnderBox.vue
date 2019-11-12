<template>
  <div class="under_box">
    <Star
      class="average-rate"
      :averageRate="averageRate"
    />
    <span
      class="rating_number"
      v-text="averageRate"
      >
      </span>
    <HeartButton/>
  </div>
</template>

<script>
import HeartButton from './HeartButton.vue'
import Star        from '../others/StarRating.vue'

export default {
  name: 'UnderBox',
  components:{
    HeartButton,
    Star
  },
  computed:{
    roomReviews(){
      return this.$store.getters.roomReviews;
    },
    averageRate(){
      if(this.roomReviews.length > 0){
        let totalRate = 0;
        this.roomReviews.forEach(function(review){
          totalRate += review.rate;
        })
        const average = totalRate / this.roomReviews.length
        return Math.round(average * 100) / 100;
      }
      else{
        return 0;
      }
    }
  }
}
</script>

<style lang="scss" scoped>

.under_box {
  position: relative;

  .average-rate {
    height: 35px;
  }
}

.rating_number {
  position: absolute;
  top: 0.45rem;
  left: 6rem;
  color: #1f1f21e0;
}

</style>