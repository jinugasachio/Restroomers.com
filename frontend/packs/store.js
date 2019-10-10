import 'babel-polyfill'
import Vue from 'vue'
import Vuex from 'vuex'
import GoogleMap from './components/GoogleMap.vue'
import defaultData from './modules/default_data.json'

Vue.use(Vuex)

const store =  new Vuex.Store({

  state: {

    map: null,
    room: defaultData, //コンソールエラー防止のため | リレーションしてるモデルデータも合わせて格納している
    allRooms: null,
    roomList: [],
    pageStack1: [GoogleMap],
    pageStack2: [],
    directionTrigger: false,
    guideTrigger: false,
    showSearchBox: false,
    activeIndex: 0

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
      state.pageStack1.push(payload);
    },
    popPage(state) {
      state.pageStack1.pop();
    },
    resetPageStack(state) {
      state.pageStack1 = [GoogleMap];
    },
    directionTrigger(state) {
      state.directionTrigger = !state.directionTrigger
    },
    guideTrigger(state) {
      state.guideTrigger = !state.guideTrigger
    },
    showSearchBox(state) {
      state.showSearchBox = !state.showSearchBox
    },
    activeIndex(state, payload){
      state.activeIndex = payload
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

    // Navigatorの挙動が変わるのでリセット
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
    }

  },

})

export default store