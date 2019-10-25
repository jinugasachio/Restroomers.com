export default {

  state: {
    currentUser: null,
    headers: null,
  },

  getters: {

    currentUser(state){
      return state.currentUser;
    },
    headers(state){
      return state.headers;
    },

  },

  mutations: {

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

  },


  actions: {

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

  }
}