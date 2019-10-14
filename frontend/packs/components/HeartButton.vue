<template>
  <div id="heart" @click="changeClass">
    <span>34</span>
  </div>
</template>

<script>

export default {
  name: 'HeartButton',
  methods: {
    changeClass(){
      const button = document.getElementById('heart');
      button.classList.toggle('isAnimating')
    }
  },
}
</script>

<style lang="scss" scoped>

#heart {
  position: absolute;
  top: -0.16rem;
  right: 1rem;
  width: 35px;
  height: 35px;
  cursor: pointer;
  background-image: url('https://abs.twimg.com/a/1446542199/img/t1/web_heart_animation.png');
  background-repeat: no-repeat;
  background-position: 0.5% 45%;
  background-size: 4000%;

  span {
    position: absolute;
    top: 9px;
    right: -11px;
    display: inline-block;
  }
}

.isAnimating {
  background-position: 99.51% 45% !important;
  animation: heart-burst 1s steps(28) 1;
}

@keyframes heart-burst {
  from { background-position: 0.5% 45%; }
  to { background-position: 99.51% 45%; }
}
</style>