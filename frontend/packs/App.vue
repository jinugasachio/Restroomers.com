<template>
  <div class="wrapper">
    <router-view></router-view>
  </div>
</template>

<script>
export default {
  name: 'App'
}
</script>

<style lang="scss" scoped>

html,
body {
  padding: 0;
  margin: 0;
}

.wrapper {
  width: 100%;
  height: 100%;
}
</style>
