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
      <SearchTab 
        @backToMap="backToMap"
        @addClass="addClass"
        @removeClass="removeClass"
      />
      <DirectionTab 
        @backToMap="backToMap"
        @addClass="addClass"
        @removeClass="removeClass"
      />
    </v-ons-tabbar>
</template>


<script>
import UserPage from './UserPage.vue'
import Navigator from './Navigator.vue'
import SearchTab from './SearchTab.vue'
import DirectionTab from './DirectionTab.vue'

export default {

  name: "TabBar",

  components: {
    UserPage,
    Navigator,
    SearchTab,
    DirectionTab
  },

  data: function() {
    return {
      activeIndex: 0,
      tabs: [
        {
          icon: 'ion-ios-home',
          label: '',
          page: Navigator,
        },
        {
          // icon: 'packs/images/lipstick.png',
          // 上の形では指定できないっぽい
          icon: 'ion-ios-heart',
          label: '',
          page: UserPage,
          badge: '',
        }
      ]
    };
  },

  methods: {
    
    backToMap(){
      this.activeIndex = 0
      this.$store.dispatch('resetPageStack')
    },
    addClass(idName, className){
      const button = document.getElementById(idName);
      button.classList.add(className)

    },
    removeClass(idName, className){
      const button = document.getElementById(idName);
      button.classList.remove(className)
    },

  }

}
</script>

<style lang="scss">

.tabbar__item {
  &:active {
    background-color: #f0f0f0;

    .tabbar__button {
      color: #ff5a47;
    }
  }

  :checked + .tabbar__button {
    color: #ff5a47;
  }
}

</style>