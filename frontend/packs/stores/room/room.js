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
    allRooms: [],
    roomList: [],
    activeTab: 0,

  },

  getters: {

    room(state) {
      if (state.activeTab === 0){
        return state.room
      }
      else if (state.activeTab == 1){
        return state.room_1
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
      if(state.activeTab === 0){
        state.room = payload.room;
      }
      else if(state.activeTab == 1){
        state.room_1 = payload.room;
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