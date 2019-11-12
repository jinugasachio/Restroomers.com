import 'babel-polyfill'
import Vue          from 'vue'
import Vuex         from 'vuex'
import GoogleMap    from './components/others/GoogleMap.vue'
import SignTop      from './components/others/SignTop.vue'
import RoomList     from './components/room/RoomList.vue'
import roomStore    from './stores/room/room.js'
import triggerStore from './stores/trigger.js'
import mapStore     from './stores/map.js'
import userStore    from './stores/user.js'

Vue.use(Vuex)


const store =  new Vuex.Store({

  modules: {
    roomStore,
    triggerStore,
    mapStore,
    userStore
  },

  state: {

    pageStack1: [GoogleMap],
    pageStack2: [SignTop],
    signFormData: [],
    activeTab: 0,

  },

  getters: {

    pageStack(state){
      if(state.activeTab === 0){
        return state.pageStack1
      }
      else if(state.activeTab == 1){
        return state.pageStack2
      }
    },
    activeTab(state){
      return state.activeTab;
    },
    signFormData(state){
      return state.signFormData;
    },

  },

  mutations: {

    pushPage(state, payload) {
      if(state.activeTab === 0){
        state.pageStack1.push(payload);
      }
      else if(state.activeTab == 1){
        state.pageStack2.push(payload);
      }
    },
    popPage(state) {
      if(state.activeTab === 0){
        state.pageStack1.pop();
      }
      else if(state.activeTab == 1){
        state.pageStack2.pop();
      }
    },
    resetPageStack(state) {
      if(state.activeTab === 0){
        state.pageStack1 = [GoogleMap];
      }
      else if(state.activeTab == 1){
        if(state.userStore.headers == null){
          state.pageStack2 = [SignTop];
        }
      }
    },
    activeTab(state, payload){
      state.activeTab = payload;
    },
    updateSignFormData(state, payload){
      state.signFormData = payload;
    },
    showUserPage(state){
      state.pageStack2 = [RoomList];
    },

  },

  actions: {

    pushPage(context, page){
      context.commit('pushPage', page);
    },

    popPage(context) {
      context.commit('popPage');
    },

    resetPageStack(context) {
      context.commit('resetPageStack');
    },

    activeTab(context, newVal){
      context.commit('activeTab', newVal);
    },

    updateSignFormData(context, signFormData){
      context.commit('updateSignFormData', signFormData);
    },

    showUserPage(context){
      context.commit('showUserPage');
    },

  },

})

export default store