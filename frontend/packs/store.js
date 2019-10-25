import 'babel-polyfill'
import Vue from 'vue'
import Vuex from 'vuex'
import GoogleMap from './components/others/GoogleMap.vue'
import SignTop from './components/others/SignTop.vue'
import RoomList from './components/room/RoomList.vue'
import roomStore from './stores/room.js'
import triggerStore from './stores/trigger.js'

Vue.use(Vuex)


const store =  new Vuex.Store({

  modules: {
    roomStore,
    triggerStore
  },

  state: {

    map: null,
    center: null,
    pageStack1: [GoogleMap],
    pageStack2: [SignTop],
    // directionTrigger: false,
    // guideTrigger: false,
    // showSearchBox: false,
    // postTrriger: false,
    activeTab: 0,
    currentUser: null,
    headers: null,
    signFormData: []

  },

  getters: {

    map(state) {
      return state.map;
    },
    room(state) {
      if (state.activeTab == 0){
        return state.roomStore.room
      }
      else if (state.activeTab == 1){
        return state.roomStore.room_1
      }
    },
    roomLikes(state){
      if (state.activeTab == 0){
        return state.roomStore.roomLikes;
      }
      else if (state.activeTab == 1){
        return state.roomStore.roomLikes_1;
      }
    },
    roomReviews(state){
      if (state.activeTab == 0){
        return state.roomStore.roomReviews;
      }
      else if (state.activeTab == 1){
        return state.roomStore.roomReviews_1;
      }
    },
    allRooms(state) {
      return state.roomStore.allRooms;
    },
    roomList(state) {
      return state.roomStore.roomList;
    },
    favoriteRooms(state){
      return state.roomStore.favoriteRooms;
    },
    pageStack(state){
      if(state.activeTab == 0){
        return state.pageStack1
      }
      else if(state.activeTab == 1){
        return state.pageStack2
      }
    },
    directionTrigger(state){
      return state.triggerStore.directionTrigger;
    },
    guideTrigger(state){
      return state.triggerStore.guideTrigger;
    },
    showSearchBox(state){
      return state.triggerStore.showSearchBox;
    },
    postTrriger(state){
      return state.triggerStore.postTrriger;
    },
    activeTab(state){
      return state.activeTab;
    },
    currentUser(state){
      return state.currentUser;
    },
    headers(state){
      return state.headers;
    },
    signFormData(state){
      return state.signFormData;
    },
    center(state){
      return state.center;
    }

  },

  mutations: {

    updateMap(state, payload) {
      state.map = payload
    },
    pushPage(state, payload) {
      if(state.activeTab == 0){
        state.pageStack1.push(payload);
      }
      else if(state.activeTab == 1){
        state.pageStack2.push(payload);
      }
    },
    popPage(state) {
      if(state.activeTab == 0){
        state.pageStack1.pop();
      }
      else if(state.activeTab == 1){
        state.pageStack2.pop();
      }
    },
    resetPageStack(state) {
      if(state.activeTab == 0){
        state.pageStack1 = [GoogleMap];
      }
      else if(state.activeTab == 1){
        if(state.headers == null){
          state.pageStack2 = [SignTop];
        }
      }
    },
    // directionTrigger(state) {
    //   state.directionTrigger = !state.directionTrigger;
    // },
    // guideTrigger(state) {
    //   state.guideTrigger = !state.guideTrigger;
    // },
    // showSearchBox(state) {
    //   state.showSearchBox = !state.showSearchBox;
    // },
    // postTrriger(state) {
    //   state.postTrriger = !state.postTrriger;
    // },
    activeTab(state, payload){
      state.activeTab = payload;
    },
    currentUser(state, payload){
      state.currentUser = payload.user;
    },
    signIn(state, payload){
      state.headers = {
        "access-token" : payload["access-token"],
        "client"       : payload["client"],
        "content-type" : payload["content-type"],
        "uid"          : payload["uid"],
      };
    },
    signOut(state){
      state.headers = null;
      state.currentUser = null;
    },
    updateSignFormData(state, payload){
      state.signFormData = payload;
    },
    showUserPage(state){
      state.pageStack2 = [RoomList];
    },
    updateCenter(state, payload){
      state.center = payload;
    },

  },

  actions: {

    updateMap(context, map){
      context.commit('updateMap', map)
    },

    pushPage(context, page){
      context.commit('pushPage', page);
    },

    popPage(context) {
      context.commit('popPage');
    },

    resetPageStack(context) {
      context.commit('resetPageStack');
    },

    // directionTrigger(context) {
    //   context.commit('directionTrigger');
    // },

    // guideTrigger(context) {
    //   context.commit('guideTrigger');
    // },

    // showSearchBox(context){
    //   context.commit('showSearchBox');
    // },

    // postTrriger(context){
    //   context.commit('postTrriger');
    // },

    activeTab(context, newVal){
      context.commit('activeTab', newVal);
    },

    signIn(context, userParams){
      axios.post('/api/auth/sign_in', userParams)
      .then(function(response){
        context.commit('currentUser', { user: response.data });
        context.commit('signIn', response.headers )
      })
      .catch(function (error) {
        context.commit('currentUser', { user: error });
      })
    },

    signUp(context, userParams){
      axios.post('/api/auth', userParams)
      .then(function(response){
        context.commit('currentUser', { user: response.data });
        context.commit('signIn', response.headers);
      })
      .catch(function (error) {
        context.commit('currentUser', { user: error });
      })
    },

    signOut(context){
      axios.delete('/api/auth/sign_out', { headers: context.state.headers })
      .then(function(){
        context.commit('signOut')
      })
      .catch(function (error) {
        alert('予期しないエラーが発生しました。');
      })
    },

    updateSignFormData(context, signFormData){
      context.commit('updateSignFormData', signFormData);
    },

    showUserPage(context){
      context.commit('showUserPage');
    },

    updateCenter(context, latLng){
      context.commit('updateCenter', latLng);
    }
  },

})

export default store