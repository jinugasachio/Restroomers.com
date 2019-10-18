import 'babel-polyfill'
import Vue from 'vue'
import Vuex from 'vuex'
import GoogleMap from './components/GoogleMap.vue'
import SignTop from './components/SignTop.vue'
import RoomList from './components/RoomList.vue'
import defaultData from './modules/default_data.json'

Vue.use(Vuex)

const store =  new Vuex.Store({

  state: {

    map: null,
    room: defaultData, //コンソールエラー防止のため | リレーションしてるモデルデータも合わせて格納している
    room_1: defaultData,
    roomLikes:[], //リアクティブにするにはroomと分ける必要がある
    roomLikes_1:[],
    roomReviews:[], //リアクティブにするにはroomと分ける必要がある
    roomReviews_1:[],
    allRooms: null,
    roomList: [],
    pageStack1: [GoogleMap],
    pageStack2: [SignTop],
    directionTrigger: false,
    guideTrigger: false,
    showSearchBox: false,
    activeTab: 0,
    currentUser: null,
    favoriteRooms: [],
    headers: null,
    signFormData: []

  },

  getters: {

    map(state) {
      return state.map;
    },
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
    pageStack(state){
      if(state.activeTab == 0){
        return state.pageStack1
      }
      else if(state.activeTab == 1){
        return state.pageStack2
      }
    },
    directionTrigger(state){
      return state.directionTrigger;
    },
    guideTrigger(state){
      return state.guideTrigger;
    },
    showSearchBox(state){
      return state.showSearchBox;
    },
    activeTab(state){
      return state.activeTab;
    },
    currentUser(state){
      return state.currentUser;
    },
    headers(state){
      return state.headers;
    },
    signFormData(state){
      return state.signFormData;
    }

  },

  mutations: {

    updateMap(state, payload) {
      state.map = payload
    },
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
    pushPage(state, payload) {
      if(state.activeTab == 0){
        state.pageStack1.push(payload);
      }
      else if(state.activeTab == 1){
        state.pageStack2.push(payload);
      }
    },
    popPage(state) {
      if(state.activeTab == 0){
        state.pageStack1.pop();
      }
      else if(state.activeTab == 1){
        state.pageStack2.pop();
      }
    },
    resetPageStack(state) {
      if(state.activeTab == 0){
        state.pageStack1 = [GoogleMap];
      }
      else if(state.activeTab == 1){
        if(state.headers == null){
          state.pageStack2 = [SignTop];
        }
      }
    },
    directionTrigger(state) {
      state.directionTrigger = !state.directionTrigger;
    },
    guideTrigger(state) {
      state.guideTrigger = !state.guideTrigger;
    },
    showSearchBox(state) {
      state.showSearchBox = !state.showSearchBox;
    },
    activeTab(state, payload){
      state.activeTab = payload;
    },
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
    updateSignFormData(state, payload){
      state.signFormData = payload;
    },
    showUserPage(state){
      state.pageStack2 = [RoomList];
    }

  },

  actions: {

    updateMap(context, map){
      context.commit('updateMap', map)
    },

    getAllRooms(context){
      axios.get("/api/powder_rooms")
      .then(function(response){
        context.commit('updateAllRooms', { allRooms: response.data })
      })
      .catch(function (error) {
        alert(error);
      })
    },

    getRoom(context, url){
      axios.get('/api/powder_rooms/' + url)
      .then(function(response){
        if (response.data.length > 1){
          context.commit('updateRoomList', { roomList: response.data })
        } else {
          context.commit('updateRoom', { room: response.data })
          context.commit('roomLikes',  { roomLikes: response.data.likes })
          context.commit('roomReviews',  { roomReviews: response.data.reviews })
        }
      })
      .catch(function (error) {
        alert(error);
      })
    },

    resetRoomList(context){
      context.commit('resetRoomList');
    },

    pushPage(context, page){
      context.commit('pushPage', page);
    },

    popPage(context) {
      context.commit('popPage');
    },

    resetPageStack(context) {
      context.commit('resetPageStack');
    },

    directionTrigger(context) {
      context.commit('directionTrigger');
    },

    guideTrigger(context) {
      context.commit('guideTrigger');
    },

    showSearchBox(context){
      context.commit('showSearchBox');
    },

    activeTab(context, newVal){
      context.commit('activeTab', newVal);
    },

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

    updateSignFormData(context, signFormData){
      context.commit('updateSignFormData', signFormData);
    },

    showUserPage(context){
      context.commit('showUserPage');
    },

    // roomLikes(context, params){
    //   axios.get(`/api/likes/?id=${params.id}`)
    //   .then(function(response){
    //     context.commit('roomLikes', { roomLikes: response.data });
    //   })
    //   .catch(function () {
    //     alert('予期しないエラーが発生しました。');
    //   })
    // },

    like(context, likeParams){
      axios.post('/api/likes', likeParams, { headers: context.state.headers })
      .then(function(response){
        const favoriteRoom = context.getters.room.powder_room
        context.commit('addLike', { newLike: response.data })
        context.commit('addFavorite', favoriteRoom)
      })
      .catch(function () {
        alert('予期しないエラーが発生しました。');
      })
    },

    unlike(context, params){
      axios.delete('/api/likes/' + params.id,  { headers: context.state.headers })
      .then(function(response){
        const favoriteRoom = context.getters.room.powder_room
        context.commit('deleteLike', { like: response.data })
        context.commit('deleteFavorite', favoriteRoom)
      })
      .catch(function (error) {
        alert('予期しないエラーが発生しました。');
      })
    },

    favoriteRooms(context){
      axios.get('/api/likes/favorite_rooms', { headers: context.state.headers })
      .then(function(response){
        context.commit('favoriteRooms', { favoriteRooms: response.data })
      })
      .catch(function (error) {
        alert('予期しないエラーが発生しました。');
      })
    },

    postReview(context, reviewParams){
      axios.post('/api/reviews', reviewParams, { headers: context.state.headers })
      .then(function(response){
        context.commit('postReview', { newReview: response.data })
      })
      .catch(function () {
        alert('予期しないエラーが発生しました。');
      })
    },

    deleteReview(context, params){
      axios.delete('/api/reviews/' + params.id,  { headers: context.state.headers })
      .then(function(response){
        context.commit('deleteReview', { review: response.data })
      })
      .catch(function (error) {
        alert('予期しないエラーが発生しました。');
      })
    },

  },

})

export default store