import 'babel-polyfill'
import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

const store =  new Vuex.Store({

  state: {
    powderRooms: null,
  },

  getters: {
    powderRooms(state) {
      return state.powderRooms;
    }
  },

  mutations: {
    updatePowderRooms(state, payload) {
      state.powderRooms = payload.powderRooms
    }
  },

  actions: {
    // 全てのpowder_roomデータの取り出し
    pullPowderRoomData(context){
      axios.get('/api/powder_rooms')
      .then(function(response){
        context.commit('updatePowderRooms', { powderRooms: response.data })
      })
      .catch(function (error) {
        console.log(error);
      })
    }
  },

})

export default store