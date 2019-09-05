<template>
  <div id="app">
    <p>{{ message }}</p>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue!!!!"
    }
  }
}
</script>

<style lang="scss" scoped>
p {
  font-size: 5em;
  color: blue;
  text-align: center;
}
</style>
