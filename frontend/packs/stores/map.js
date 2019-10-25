export default {

  state: {
    map: null,
    center: null,
  },

  gettes: {

    map(state) {
      return state.map;
    },
    center(state){
      return state.center;
    }

  },

  mutations: {

    updateMap(state, payload) {
      state.map = payload
    },
    updateCenter(state, payload){
      state.center = payload;
    },

  },


  actions: {

    updateMap(context, map){
      context.commit('updateMap', map)
    },
    updateCenter(context, latLng){
      context.commit('updateCenter', latLng);
    }

  }
}