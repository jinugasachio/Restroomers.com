import 'babel-polyfill'
import Vue from 'vue'
import Vuex from 'vuex'
import GoogleMap from './components/GoogleMap.vue'
import SignTop from './components/SignTop.vue'
import UserPage from './components/UserPage.vue'
import defaultData from './modules/default_data.json'

Vue.use(Vuex)

const store =  new Vuex.Store({

  state: {

    map: null,
    room: defaultData, //コンソールエラー防止のため | リレーションしてるモデルデータも合わせて格納している
    roomLikes:[],
    allRooms: null,
    roomList: [],
    pageStack1: [GoogleMap],
    pageStack2: [SignTop],
    directionTrigger: false,
    guideTrigger: false,
    showSearchBox: false,
    activeIndex: 0,
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
      return state.room;
    },
    roomLikes(state){
      return state.roomLikes;
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
    pageStack1(state){
      return state.pageStack1;
    },
    pageStack2(state){
      return state.pageStack2;
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
    activeIndex(state){
      return state.activeIndex;
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
      state.room = payload.room;
    },
    roomLikes(state, payload){
      state.roomLikes = payload.roomLikes;
    },
    addLike(state, payload){
      state.roomLikes.push(payload.newLike);
    },
    deleteLike(state, payload){
      state.roomLikes = state.roomLikes.filter(function(like){
        return like.id !== payload.like.id
      })
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
      if(state.activeIndex == 0){
        state.pageStack1.push(payload);
      }
      else if(state.activeIndex == 1){
        state.pageStack2.push(payload);
      }
    },
    popPage(state) {
      if(state.activeIndex == 0){
        state.pageStack1.pop();
      }
      else if(state.activeIndex == 1){
        state.pageStack2.pop();
      }
    },
    resetPageStack(state) {
      if(state.activeIndex == 0){
        state.pageStack1 = [GoogleMap];
      }
      else if(state.activeIndex == 1){
        state.pageStack2 = [SignTop];
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
    activeIndex(state, payload){
      state.activeIndex = payload;
    },
    currentUser(state, payload){
      state.currentUser = payload.user;
    },
    updateHeaders(state, payload){
      state.headers = {
        "access-token" : payload["access-token"],
        "client"       : payload["client"],
        "content-type" : payload["content-type"],
        "uid"          : payload["uid"],
      };
    },
    updateSignFormData(state, payload){
      state.signFormData = payload;
    },
    showUserPage(state){
      state.pageStack2 = [UserPage];
    }

  },

  actions: {

    //mapを生成または更新
    updateMap(context, map){
      context.commit('updateMap', map)
    },

    // 全てのpowder_roomデータの取り出し
    getAllRooms(context){
      axios.get("/api/powder_rooms")
      .then(function(response){
        context.commit('updateAllRooms', { allRooms: response.data })
      })
      .catch(function (error) {
        alert(error);
      })
    },

    // 特定の一つのpowder_room もしくは、その'子'の取り出し
    getRoom(context, url){
      axios.get('/api/powder_rooms/' + url)
      .then(function(response){
        if (response.data.length > 1){
          context.commit('updateRoomList', { roomList: response.data })
        } else {
          context.commit('updateRoom', { room: response.data })
          context.commit('roomLikes',  { roomLikes: response.data.likes })

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

    activeIndex(context, newVal){
      context.commit('activeIndex', newVal);
    },

    signIn(context, userParams){
      axios.post('/api/auth/sign_in', userParams)
      .then(function(response){
        context.commit('currentUser', { user: response.data });
        context.commit('updateHeaders', response.headers )
      })
      .catch(function (error) {
        context.commit('currentUser', { user: error });
      })
    },

    signUp(context, userParams){
      axios.post('/api/auth', userParams)
      .then(function(response){
        context.commit('currentUser', { user: response.data });
        context.commit('updateHeaders', response.headers);
      })
      .catch(function (error) {
        context.commit('currentUser', { user: error });
      })
    },

    updateSignFormData(context, signFormData){
      context.commit('updateSignFormData', signFormData);
    },

    showUserPage(context){
      context.commit('showUserPage');
    },

    roomLikes(context, params){
      axios.get(`/api/likes/?id=${params.id}`)
      .then(function(response){
        context.commit('roomLikes', { roomLikes: response.data });
      })
      .catch(function () {
        alert('予期しないエラーが発生しました。');
      })
    },

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
    }

  },

})

export default store