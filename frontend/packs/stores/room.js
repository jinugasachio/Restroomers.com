import defaultData from '../modules/default_data.json'
import userStore from './user.js'

export default {

  modules: {
    userStore
  },

  state: {
    room: defaultData,
    room_1: defaultData,
    roomLikes:[],
    roomLikes_1:[],
    roomReviews:[],
    roomReviews_1:[],
    allRooms: [],
    roomList: [],
    favoriteRooms: [],
    activeTab: 0,
  },

  getters: {
    room(state) {
      if (state.activeTab == 0){
        return state.room
      }
      else if (state.activeTab == 1){
        return state.room_1
      }
    },
    roomLikes(state){
      if (state.activeTab == 0){
        return state.roomLikes;
      }
      else if (state.activeTab == 1){
        return state.roomLikes_1;
      }
    },
    roomReviews(state){
      if (state.activeTab == 0){
        return state.roomReviews;
      }
      else if (state.activeTab == 1){
        return state.roomReviews_1;
      }
    },
    allRooms(state) {
      return state.allRooms;
    },
    roomList(state) {
      return state.roomList;
    },
    favoriteRooms(state){
      return state.favoriteRooms;
    },
  },


  mutations: {
    updateRoom(state, payload) {
      if(state.activeTab == 0){
        state.room = payload.room;
      }
      else if(state.activeTab == 1){
        state.room_1 = payload.room;
      }
    },
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
    roomReviews(state, payload){
      if(state.activeTab == 0){
        state.roomReviews = payload.roomReviews;
      }
      else if(state.activeTab == 1){
        state.roomReviews_1 = payload.roomReviews;
      }
    },
    postReview(state, payload){
      if(state.activeTab == 0){
        state.roomReviews.push(payload.newReview);
      }
      else if(state.activeTab == 1){
        state.roomReviews_1.push(payload.newReview);
      }
    },
    deleteReview(state, payload){
      if(state.activeTab == 0){
        state.roomReviews = state.roomReviews.filter(function(review){
          return review.id !== payload.review.id
        })
      }
      else if(state.activeTab == 1){
        state.roomReviews_1 = state.roomReviews_1.filter(function(review){
          return review.id !== payload.review.id
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
    updateAllRooms(state, payload) {
      state.allRooms = payload.allRooms;
    },
    updateRoomList(state, payload) {
      state.roomList = payload.roomList;
    },
    resetRoomList(state) {
      state.roomList = [];
    },
    postRoom(state, payload){
      state.allRooms.push(payload);
    },
    activeTab(state, payload){
      state.activeTab = payload;
    },

  },


  actions: {
    getAllRooms(context){
      axios.get("/api/powder_rooms")
      .then(function(response){
        context.commit('updateAllRooms', { allRooms: response.data })
      })
      .catch(function (error) {
        alert('予期しないエラーが発生しました。');
      })
    },

    getRoom(context, url){
      axios.get('/api/powder_rooms/' + url)
      .then(function(response){
        if (response.data.length > 1){
          context.commit('updateRoomList', { roomList: response.data })
        } else {
          context.commit('updateRoom',  { room: response.data })
          context.commit('roomLikes',   { roomLikes: response.data.likes })
          context.commit('roomReviews', { roomReviews: response.data.reviews })
        }
      })
      .catch(function (error) {
        alert('予期しないエラーが発生しました。');
      })
    },

    resetRoomList(context){
      context.commit('resetRoomList');
    },

    like(context, likeParams){
      axios.post('/api/likes', likeParams, { headers: context.state.userStore.headers })
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
      axios.delete('/api/likes/' + params.id,  { headers: context.state.userStore.headers })
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
      debugger
      axios.get('/api/likes/favorite_rooms', { headers: context.state.userStore.headers })
      .then(function(response){
        context.commit('favoriteRooms', { favoriteRooms: response.data })
      })
      .catch(function (error) {
        alert('予期しないエラーが発生しました。');
      })
    },

    postReview(context, reviewParams){
      axios.post('/api/reviews', reviewParams, { headers: context.state.userStore.headers })
      .then(function(response){
        context.commit('postReview', { newReview: response.data })
      })
      .catch(function (error) {
        alert('予期しないエラーが発生しました。');
      })
    },

    deleteReview(context, params){
      axios.delete('/api/reviews/' + params.id,  { headers: context.state.userStore.headers })
      .then(function(response){
        context.commit('deleteReview', { review: response.data })
      })
      .catch(function (error) {
        alert('予期しないエラーが発生しました。');
      })
    },

    postRoom(context, roomParams){
      axios.post('/api/powder_rooms', roomParams,  { headers: context.state.userStore.headers })
      .then(function(response){
        context.commit ('postRoom', response.data)
      })
      .catch(function (error) {
        alert('予期しないエラーが発生しました。');
      })
    },
  }
}