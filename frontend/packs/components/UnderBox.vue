<template>
  <div class="under_box">
    <Star/>
    <span class="rating_number">3.9</span>
    <HeartButton/>
  </div>
</template>

<script>
import HeartButton from './HeartButton.vue'
import Star from './StarRating.vue'

export default {
  name: 'UnderBox',
  components:{
    HeartButton,
    Star
  },
}
</script>

<style lang="scss" scoped>

.under_box {
  position: relative;
}

.rating_number {
  position: absolute;
  top: 0.45rem;
  left: 6rem;
  color: #1f1f21;
}

</style>