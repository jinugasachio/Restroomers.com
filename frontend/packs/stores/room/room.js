import defaultData from '../../modules/default_data.json'
import reviewStore from './review.js'
import likeStore from './like.js'

export default {

  modules: {
    reviewStore,
    likeStore
  },

  state: {
    room: defaultData,
    room_1: defaultData,
    roomReviews:[],
    roomReviews_1:[],
    allRooms: [],
    roomList: [],
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

    postReview(context, reviewParams){
      debugger;
      axios.post('/api/reviews', reviewParams, { headers: context.rootState.userStore.headers })
      .then(function(response){
        context.commit('postReview', { newReview: response.data })
      })
      .catch(function (error) {
        alert('予期しないエラーが発生しました。');
      })
    },

    deleteReview(context, params){
      axios.delete('/api/reviews/' + params.id,  { headers: context.rootState.userStore.headers })
      .then(function(response){
        context.commit('deleteReview', { review: response.data })
      })
      .catch(function (error) {
        alert('予期しないエラーが発生しました。');
      })
    },

    postRoom(context, roomParams){
      axios.post('/api/powder_rooms', roomParams,  { headers: context.rootState.userStore.headers })
      .then(function(response){
        context.commit ('postRoom', response.data)
      })
      .catch(function (error) {
        alert('予期しないエラーが発生しました。');
      })
    },
  }
}