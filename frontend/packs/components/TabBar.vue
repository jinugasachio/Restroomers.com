<template>
    <v-ons-tabbar swipeable position="auto"
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
// const homePage = {
//   template: '#home',
//   props: ['myProp']
// };

// const newsPage = {
//   template: '#news'
// };

// const settingsPage = {
//   template: '#settings'
// };

import UserPage from './UserPage.vue'



export default {
  components: {
    UserPage
  },
  data: function() {
    return {
      activeIndex: 0,
      tabs: [
        {
          icon: 'ion-ios-home',
          label: '',
          page: UserPage,
          props: {
            myProp: 'This is a page prop!'
          },
          // key: "homePage"
        },
        {
          // icon: 'packs/images/lipstick.png',
          // 上の形では指定できないっぽい
          icon: '',
          label: '',
          page: UserPage,
          badge: 7,
          // key: "newsPage"
        },
        {
          icon: 'ion-ios-search',
          label: '',
          page: UserPage,
          // key: "settingsPage"
        },
        {
          icon: 'ion-ios-navigate',
          label: '',
          page: UserPage,
          // key: "settingsPage"
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