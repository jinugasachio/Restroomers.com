export default {

  state: {

    roomLikes:[],
    roomLikes_1:[],
    favoriteRooms: [],
    activeTab: 0
    
  },

  getters: {

    roomLikes(state){
      if (state.activeTab == 0){
        return state.roomLikes;
      }
      else if (state.activeTab == 1){
        return state.roomLikes_1;
      }
    },
    favoriteRooms(state){
      return state.favoriteRooms;
    },

  },

  mutations: {

    roomLikes(state, payload){
      if(state.activeTab == 0){
        state.roomLikes = payload.roomLikes;
      }
      else if(state.activeTab == 1){
        state.roomLikes_1 = payload.roomLikes;
      }
    },
    addLike(state, payload){
      if(state.activeTab == 0){
        state.roomLikes.push(payload.newLike);
      }
      else if(state.activeTab == 1){
        state.roomLikes_1.push(payload.newLike);
      }
    },
    deleteLike(state, payload){
      if(state.activeTab == 0){
        state.roomLikes = state.roomLikes.filter(function(like){
          return like.id !== payload.like.id
        })
      }
      else if(state.activeTab == 1){
        state.roomLikes_1 = state.roomLikes_1.filter(function(like){
          return like.id !== payload.like.id
        })
      }
    },
    favoriteRooms(state, payload){
      state.favoriteRooms = payload.favoriteRooms;
    },
    addFavorite(state, payload){
      state.favoriteRooms.push(payload)
    },
    deleteFavorite(state, payload){
      state.favoriteRooms = state.favoriteRooms.filter(function(room){
        return room.id !== payload.id
      })
    },
    activeTab(state, payload){
      state.activeTab = payload;
    },

  },


  actions: {

    like(context, likeParams){
      axios.post('/api/likes', likeParams, { headers: context.rootState.userStore.headers })
      .then(function(response){
        const favoriteRoom = context.rootGetters.room.powder_room
        context.commit('addLike', { newLike: response.data })
        context.commit('addFavorite', favoriteRoom)
      })
      .catch(function () {
        alert('予期しないエラーが発生しました。');
      })
    },

    unlike(context, params){
      axios.delete('/api/likes/' + params.id,  { headers: context.rootState.userStore.headers })
      .then(function(response){
        const favoriteRoom = context.rootGetters.room.powder_room
        context.commit('deleteLike', { like: response.data })
        context.commit('deleteFavorite', favoriteRoom)
      })
      .catch(function (error) {
        alert('予期しないエラーが発生しました。');
      })
    },

    favoriteRooms(context){
      axios.get('/api/likes/favorite_rooms', { headers: context.rootState.userStore.headers })
      .then(function(response){
        context.commit('favoriteRooms', { favoriteRooms: response.data })
      })
      .catch(function (error) {
        alert('予期しないエラーが発生しました。');
      })
    },

  }
}