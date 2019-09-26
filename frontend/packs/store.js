import 'babel-polyfill'
import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

const store =  new Vuex.Store({

  state: {
    powderRooms: null,
    powderRoom: null
  },

  getters: {
    powderRooms(state) {
      return state.powderRooms;
    },
    powderRoom(state) {
      return state.powderRoom;
    },

  },

  mutations: {
    updatePowderRooms(state, payload) {
      state.powderRooms = payload.powderRooms
    },
    updatePowderRoom(state, payload) {
      state.powderRoom = payload.powderRoom
    },
  },

  actions: {
    // 全てのpowder_roomデータの取り出し
    pullPowderRoomsData(context){
      axios.get("/api/powder_rooms")
      .then(function(response){
        context.commit('updatePowderRooms', { powderRooms: response.data })
      })
      .catch(function (error) {
        console.log(error);
      })
    },
    // 特定の一つのpowder_roomデータの取り出し
    pullPowderRoomData(context, id){
      debugger;
      axios.get('/api/powder_rooms/' + id)

      .then(function(response){
        debugger;
        context.commit('updatePowderRoom', { powderRoom: response.data })
      })
      .catch(function (error) {
        console.log(error);
      })
    },



  },

})

export default store