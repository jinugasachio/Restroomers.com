<template>
  <button class="sign-out">
    <img src="packs/images/sign_out.png"  class="sign-out__image">
  </button>
</template>
<script>
export default {
  
}
</script>

<style lang="scss" scoped>

.sign-out {
  position: absolute;
  right: 1rem;
  bottom: 1rem;
  z-index: 10;
  width: 4rem;
  min-height: 4rem;
  padding: 0;
  cursor: pointer;
  background-color: #ff8b85;
  border: none;
  border-radius: 50%;

  &:active {
    background-color: #e67f7a;
  }

  &:focus {
    outline: 0;
  }

  .sign-out__image {
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    width: 1.5rem;
    margin: auto;
    background-color: #ff8b85;

    &:active {
      background-color: #e67f7a;
    }
  }
}
</style>