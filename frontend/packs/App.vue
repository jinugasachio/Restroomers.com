<template>
<div class='wrapper'>
  <TabBar/>
  <!-- ルーティングで振り分けるテンプレートが下記に入る -->
  <router-view></router-view>
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
