<template>
  <div class="wrapper">
    <router-view></router-view>
    <TabBar/>
  </div>
</template>

<script>
import TabBar from './components/TabBar.vue'
export default {
  name: 'App',
  components: {
    TabBar
  }
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
