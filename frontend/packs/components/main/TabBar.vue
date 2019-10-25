<template>
    <v-ons-tabbar  position="auto" animation="none"
      :tabs="tabs"
      :visible="true"
      :index.sync="activeTab"
    >
      <v-ons-tab v-for="(tab, i) in tabs"
        :icon="tabs[i].icon"
        :label="tabs[i].label"
        :badge="tabs[i].badge"
        :key="tabs[i].icon"
        @click.prevent="active"
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
      <ActionButton/>
    </v-ons-tabbar>
</template>


<script>
import Navigator1   from '../tabs/Navigator1.vue'
import Navigator2   from '../tabs/Navigator2.vue'
import SearchTab    from '../tabs/SearchTab.vue'
import DirectionTab from '../tabs/DirectionTab.vue'
import ActionButton from '../others/ActionButton.vue'



export default {

  name: "TabBar",

  components: {
    Navigator1,
    Navigator2,
    SearchTab,
    DirectionTab,
    ActionButton,
  },

  data() {
    return {
      tabs: [
        {
          icon: 'ion-ios-home',
          page: Navigator1,
        },
        {
          icon: 'ion-ios-happy',
          page: Navigator2,
        }
      ]
    };
  },

  computed: {
    activeTab: {
      get()        { return this.$store.getters.activeTab },
      set(newIndex){ this.$store.dispatch('activeTab', newIndex) }
    }
  },

  methods: {

    active(){
      this.activeTab = event.currentTarget.index;
    },

    backToMap(){
      this.activeTab = 0
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