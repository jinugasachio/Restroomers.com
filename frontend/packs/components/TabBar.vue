<template>
    <v-ons-tabbar  position="auto"
      :tabs="tabs"
      :visible="true"
      :index.sync="activeIndex"
    >
      <v-ons-tab v-for="(tab, i) in tabs"
        :icon="tabs[i].icon"
        :label="tabs[i].label"
        :badge="tabs[i].badge"
        :key= i
      >
      </v-ons-tab>
    </v-ons-tabbar>
</template>


<script>
import UserPage from './UserPage.vue'
import GoogleMap from './GoogleMap.vue'
import Navigator from './Navigator.vue'


export default {
  components: {
    UserPage,
    Navigator,
  },
  data: function() {
    return {
      activeIndex: 0,
      tabs: [
        {
          icon: 'ion-ios-home',
          label: '',
          page: Navigator,
          props: {
            myProp: 'This is a page prop!'
          },
          // key: ""
        },
        {
          // icon: 'packs/images/lipstick.png',
          // 上の形では指定できないっぽい
          icon: 'ion-ios-woman',
          label: '',
          page: UserPage,
          badge: 7,
          // key: ""
        },
        {
          icon: 'ion-ios-search',
          label: '',
          page: UserPage,
          // key: ""
        },
        {
          icon: 'ion-ios-navigate',
          label: '',
          page: UserPage,
          // key: ""
        }
      ]
    };
  },
  // methods: {
  //   md() {
  //     return this.$ons.platform.isAndroid();
  //   }
  // },
  // computed: {
  //   title() {
  //     return this.tabs[this.activeIndex].label;
  //   }
  // }
}
</script>

<style lang="scss" scoped>
button {
  cursor: pointer !important;
}
</style>