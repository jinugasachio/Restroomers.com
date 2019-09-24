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

export default {
  components: {
    UserPage,
    UserPage,
  },
  data: function() {
    return {
      activeIndex: 0,
      tabs: [
        {
          icon: 'ion-ios-home',
          label: '',
          page: GoogleMap,
          props: {
            myProp: 'This is a page prop!'
          },
          // key: ""
        },
        {
          // icon: 'packs/images/lipstick.png',
          // 上の形では指定できないっぽい
          icon: '',
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