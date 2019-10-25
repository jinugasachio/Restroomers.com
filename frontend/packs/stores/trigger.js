export default {

  state: {
    directionTrigger: false,
    guideTrigger:     false,
    postTrriger:      false,
    showSearchBox:    false,
  },

  getters: {

    directionTrigger(state){
      return state.directionTrigger;
    },
    guideTrigger(state){
      return state.guideTrigger;
    },
    postTrriger(state){
      return state.postTrriger;
    },
    showSearchBox(state){
      return state.showSearchBox;
    },

  },

  mutations: {

    directionTrigger(state) {
      state.directionTrigger = !state.directionTrigger;
    },
    guideTrigger(state) {
      state.guideTrigger = !state.guideTrigger;
    },
    postTrriger(state) {
      state.postTrriger = !state.postTrriger;
    },
    showSearchBox(state) {
      state.showSearchBox = !state.showSearchBox;
    },

  },


  actions: {

    directionTrigger(context) {
      context.commit('directionTrigger');
    },
    guideTrigger(context) {
      context.commit('guideTrigger');
    },
    postTrriger(context){
      context.commit('postTrriger');
    },
    showSearchBox(context){
      context.commit('showSearchBox');
    },

  }
}