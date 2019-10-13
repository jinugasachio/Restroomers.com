<template>
  <v-ons-page>
    <ToolBar/>
    <v-ons-list>
      <v-ons-list-header>お気に入りリスト</v-ons-list-header>
      <!-- <v-ons-list-item modifier="chevron longdivider" tappable
        @click="getRoom"
        v-for="room in roomList" 
        :key=room.id
        :data-id=room.id
      >
      {{ room.name }}
      </v-ons-list-item> -->

      <v-ons-list-item modifier="chevron longdivider" tappable>部屋名</v-ons-list-item>
      <v-ons-list-item modifier="chevron longdivider" tappable>部屋名</v-ons-list-item>
      <v-ons-list-item modifier="chevron longdivider" tappable>部屋名</v-ons-list-item>
    </v-ons-list>
  </v-ons-page>
</template>


<script>
import ToolBar from './ToolBar.vue'

export default {
  name: 'UserPage',
  components:{
    ToolBar
  }

}
</script>

<style lang="scss" scoped>
.list-item {
  padding: 13px 0 13px 20px;
}
</style>