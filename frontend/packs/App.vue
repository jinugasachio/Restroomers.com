<template>
<div class='wrapper'>
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
.wrapper {
  width: 100%;
  height: 100%;
}
</style>
