import 'babel-polyfill'
import Vue from 'vue'
import Vuex from 'vuex'
import defaultData from './modules/default_data.json'

Vue.use(Vuex)

const store =  new Vuex.Store({

  

  state: {
    powderRooms: null,
    powderRoom: defaultData, //コンソールエラー防止。
    powderRoomList: null
  },

  getters: {
    powderRooms(state) {
      return state.powderRooms;
    },
    powderRoom(state) {
      return state.powderRoom;
    },
    powderRoomList(state) {
      return state.powderRoomList;
    },

  },

  mutations: {
    updatePowderRooms(state, payload) {
      state.powderRooms = payload.powderRooms
    },
    updatePowderRoom(state, payload) {
      state.powderRoom = payload.powderRoom
    },
    updatePowderRoomList(state, payload) {
      state.powderRoomList = payload.powderRoomList
    },

  },

  actions: {
    // 全てのpowder_roomデータの取り出し
    getPowderRooms(context){
      axios.get("/api/powder_rooms")
      .then(function(response){
        context.commit('updatePowderRooms', { powderRooms: response.data })
      })
      .catch(function (error) {
        console.log(error);
      })
    },
    // 特定の一つのpowder_roomデータの取り出し
    getPowderRoom(context, url){
      axios.get('/api/powder_rooms/' + url)
      .then(function(response){
        context.commit('updatePowderRoom', { powderRoom: response.data })
      })
      .catch(function (error) {
        console.log(error);
      })
    },



  },

})

export default store