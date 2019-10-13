import 'babel-polyfill'
import Vue from 'vue'
import Vuex from 'vuex'
import GoogleMap from './components/GoogleMap.vue'
import SignTop from './components/SignTop.vue'
import defaultData from './modules/default_data.json'

Vue.use(Vuex)

const store =  new Vuex.Store({

  state: {

    map: null,
    room: defaultData, //コンソールエラー防止のため | リレーションしてるモデルデータも合わせて格納している
    allRooms: null,
    roomList: [],
    pageStack1: [GoogleMap],
    pageStack2: [SignTop],
    directionTrigger: false,
    guideTrigger: false,
    showSearchBox: false,
    activeIndex: 0,
    currentUser: null,
    signFormData: []

  },

  getters: {

    map(state) {
      return state.map;
    },
    room(state) {
      return state.room;
    },
    allRooms(state) {
      return state.allRooms;
    },
    roomList(state) {
      return state.roomList;
    },
    pageStack1(state){
      return state.pageStack1;
    },
    pageStack2(state){
      return state.pageStack2;
    },
    directionTrigger(state){
      return state.directionTrigger;
    },
    guideTrigger(state){
      return state.guideTrigger;
    },
    showSearchBox(state){
      return state.showSearchBox;
    },
    activeIndex(state){
      return state.activeIndex;
    },
    currentUser(state){
      return state.currentUser;
    },
    signFormData(state){
      return state.signFormData;
    }

  },

  mutations: {

    updateMap(state, payload) {
      state.map = payload
    },
    updateRoom(state, payload) {
      state.room = payload.room;
    },
    updateAllRooms(state, payload) {
      state.allRooms = payload.allRooms;
    },
    updateRoomList(state, payload) {
      state.roomList = payload.roomList;
    },
    resetRoomList(state) {
      state.roomList = [];
    },
    pushPage(state, payload) {
      if(state.activeIndex == 0){
        state.pageStack1.push(payload);
      }
      else if(state.activeIndex == 1){
        state.pageStack2.push(payload);
      }
    },
    popPage(state) {
      if(state.activeIndex == 0){
        state.pageStack1.pop();
      }
      else if(state.activeIndex == 1){
        state.pageStack2.pop();
      }
    },
    resetPageStack(state) {
      if(state.activeIndex == 0){
        state.pageStack1 = [GoogleMap];
      }
      else if(state.activeIndex == 1){
        state.pageStack2 = [SignTop];
      }
    },
    directionTrigger(state) {
      state.directionTrigger = !state.directionTrigger;
    },
    guideTrigger(state) {
      state.guideTrigger = !state.guideTrigger;
    },
    showSearchBox(state) {
      state.showSearchBox = !state.showSearchBox;
    },
    activeIndex(state, payload){
      state.activeIndex = payload;
    },
    currentUser(state, payload){
      state.currentUser = payload.user;
    },
    updateSignFormData(state, payload){
      state.signFormData = payload;
    }

  },

  actions: {

    //mapを生成または更新
    updateMap(context, map){
      context.commit('updateMap', map)
    },

    // 全てのpowder_roomデータの取り出し
    getAllRooms(context){
      axios.get("/api/powder_rooms")
      .then(function(response){
        context.commit('updateAllRooms', { allRooms: response.data })
      })
      .catch(function (error) {
        alert(error);
      })
    },

    // 特定の一つのpowder_room もしくは、その'子'の取り出し
    getRoom(context, url){
      axios.get('/api/powder_rooms/' + url)
      .then(function(response){
        if (response.data.length > 1){
          context.commit('updateRoomList', { roomList: response.data })
        } else {
          context.commit('updateRoom', { room: response.data })
        }
      })
      .catch(function (error) {
        alert(error);
      })
    },

    resetRoomList(context){
      context.commit('resetRoomList');
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

    directionTrigger(context) {
      context.commit('directionTrigger');
    },

    guideTrigger(context) {
      context.commit('guideTrigger');
    },

    showSearchBox(context){
      context.commit('showSearchBox');
    },

    activeIndex(context, newVal){
      context.commit('activeIndex', newVal);
    },

    signIn(context, userParams){
      axios.post('/api/auth/sign_in', userParams)
      .then(function(response){
        context.commit('currentUser', {user: response.data});
      })
      .catch(function (error) {
        context.commit('currentUser', {user: error});
      })
    },

    signUp(context, userParams){
      axios.post('/api/auth', userParams)
      .then(function(response){
        context.commit('currentUser', {user: response.data});
      })
      .catch(function (error) {
        context.commit('currentUser', {user: error});
      })
    },

    updateSignFormData(context, signFormData){
      context.commit('updateSignFormData', signFormData);
    }

  },

})

export default store