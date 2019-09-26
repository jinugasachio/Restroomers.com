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
      console.log(error);
    },
    updatePowderRoom(state, payload) {
      state.powderRoom = payload.powderRoom
      debugger;
      console.log(error);
    },
  },

  actions: {
    // 全てのpowder_roomデータの取り出し
    pullPowderRoomsData(context){
      axios.get('/api/powder_rooms')
      .then(function(response){
        context.commit('updatePowderRooms', { powderRooms: response.data })
      })
      .catch(function (error) {
        console.log(error);
      })
    },

    

  },

})

export default store