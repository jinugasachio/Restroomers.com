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
import Navigator1 from './Navigator1.vue'
import Navigator2 from './Navigator2.vue'
import SearchTab from './SearchTab.vue'
import DirectionTab from './DirectionTab.vue'

export default {

  name: "TabBar",

  components: {
    Navigator1,
    Navigator2,
    SearchTab,
    DirectionTab
  },

  data() {
    return {
      activeIndex: 0,
      tabs: [
        {
          icon: 'ion-ios-home',
          label: '',
          page: Navigator1,
        },
        {
          icon: 'ion-ios-happy',
          label: '',
          page: Navigator2,
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
  },

  watch: {
    activeIndex: {
      handler(newVal){
        this.$store.dispatch('activeIndex', newVal)
      }
    }
  }


}
</script>

<style lang="scss">

.tabbar__item {
  &:active {
    background-color: #e7e7e7;

    .tabbar__button {
      color: #fa8686;
    }
  }

  :checked + .tabbar__button {
    color: #fa8686;
  }
}

</style>