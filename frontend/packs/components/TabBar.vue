<template>
    <v-ons-tabbar  position="auto" animation="none"
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
      <v-ons-tab 
        icon="ion-ios-search"
        @click.prevent="searchRoom"
      />
      <v-ons-tab
        icon="ion-ios-navigate"
        @click.prevent="getPosition"
      />
    </v-ons-tabbar>
</template>


<script>
import UserPage from './UserPage.vue'
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
          icon: 'ion-ios-heart',
          label: '',
          page: UserPage,
          badge: '',
          // key: ""
        }],

    };
  },
  methods: {
    searchRoom(){
      debugger;
      this.activeIndex = 0
      console.log('search!!')
    },
    getPosition() {
      this.activeIndex = 0
      console.log('getposition!')
    }
  },
}
</script>

<style lang="scss">

.tabbar__item {
  &:active {
    background-color: #f2f2f2;

    .tabbar__button {
      color: #fc744a;
    }
  }

  :checked + .tabbar__button {
    color: #fc744a;
  }
}
</style>