<template>
  <v-ons-list-header>
    みんなの口コミ
    <button class="review-button">
      投稿する
    </button>
  </v-ons-list-header>
</template>

<script>

export default {

  name: 'Review'

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

    &:active {
      background-color: #ddd;
      border-radius: 4px;
      outline: 0;
    }
  }
}

</style>