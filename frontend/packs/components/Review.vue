<template>
  <v-ons-list-header>
    みんなの口コミ
    <button class="review-button"
      @click="pushPage"
    >
      投稿する
    </button>
  </v-ons-list-header>
</template>

<script>
import ReviewForm from './ReviewForm.vue'

export default {

  name: 'Review',
  components: {
    ReviewForm
  },
  methods: {
    pushPage(){
      this.$store.dispatch('pushPage', ReviewForm)
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