<template>
    <v-ons-navigator
    :page-stack="pageStack"
    @push-page="pageStack.push($event)"
  ></v-ons-navigator>
</template>

<script>
export default {
  
}
</script>