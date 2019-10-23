<template>
<div class="wrapper">
  <div class="top-message">投稿する場所を中心に合わせてください。</div>
  <img src="packs/images/center.png" id="target">
</div>
</template>

<script>

export default {

  name: 'GetCenter',

}
</script>

<style lang="scss" scoped>

.wrapper {
  position: relative;
  width: 100%;

  .top-message {
    position: absolute;
    z-index: 2;
    width: 100%;
    font-size: 1rem;
    font-weight: 600;
    line-height: 50px;
    color: #fff;
    text-align: center;
    background-color: #fdaaaa;
  }

  #target {
    position: absolute;
    top: 44vh;
    right: 0;
    left: 0;
    z-index: 2;
    width: 5rem;
    margin: auto;
  }
}
</style>