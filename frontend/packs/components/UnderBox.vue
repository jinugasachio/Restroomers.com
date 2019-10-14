<template>
  <div class="under_box">
    <star-rating  
      :star-size="18"
      :increment="0.1"
      :read-only="true"
      :show-rating="false"
      >
    </star-rating>
    <span class="rating_number">3.9</span>
    <HeartButton/>
  </div>
</template>

<script>
import HeartButton from './HeartButton.vue'

export default {
  name: 'UnderBox',
  components:{
    HeartButton,
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

.vue-star-rating {
  height: 35px;
  // margin-bottom: 0.5rem;
}

</style>