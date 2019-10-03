<template>
  <div class="star">
    <star-rating  
      :star-size="18"
      :increment="0.1"
      :read-only="true"
      :show-rating="false"
      >
    </star-rating>
    <span class="rating_number">3.9</span>
  </div>
</template>

<script>
export default {
  // 算出プロパティでpowder_roomとリレーションしているreviewを取り出して
  // それを.rating_numberの値にバインドさせる
}
</script>

<style lang="scss" scoped>

.star {
  position: relative;
}

.rating_number {
  position: absolute;
  top: 0.05rem;
  left: 6rem;
  color: #1f1f21;
}

.vue-star-rating {
  margin-bottom: 0.5rem;
}

</style>