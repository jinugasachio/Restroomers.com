import 'babel-polyfill'
import Vue from 'vue'
import Vuex from 'vuex'
import defaultData from './modules/default_data.json'

Vue.use(Vuex)

const store =  new Vuex.Store({

  

  state: {
    powderRooms: null,
    powderRoom: defaultData, //コンソールエラー防止のため | リレーションしてるモデルデータも合わせて格納している
    powderRoomList: [],
    navgatorItems: ["item"]
  },

  getters: {
    powderRooms(state) {
      return state.powderRooms;
    },
    powderRoom(state) {
      return state.powderRoom;
    },
    powderRoomList(state) {
      return state.powderRoomList;
    },
    navgatorItems(state) {
      return state.navgatorItems;
    }
  },

  mutations: {
    updatePowderRooms(state, payload) {
      state.powderRooms = payload.powderRooms
    },
    updatePowderRoom(state, payload) {
      state.powderRoom = payload.powderRoom
    },
    updatePowderRoomList(state, payload) {
      state.powderRoomList = payload.powderRoomList
    },
    resetPowderRoomImages(state) {
      state.powderRoom.images = []
    },
    resetPowderRoomList(state) {
      state.powderRoomList = []
    },
    addNavigatorItem(state) {
      state.navgatorItems.push("item")
    },

  },

  actions: {

    // 全てのpowder_roomデータの取り出し
    getPowderRooms(context){
      axios.get("/api/powder_rooms")
      .then(function(response){
        context.commit('updatePowderRooms', { powderRooms: response.data })
      })
      .catch(function (error) {
        alert(error);
      })
    },

    // 特定の一つのpowder_room もしくは、その'子'の取り出し
    getPowderRoom(context, url){
      axios.get('/api/powder_rooms/' + url)
      .then(function(response){
        if (response.data.length > 1){
          context.commit('updatePowderRoomList', { powderRoomList: response.data })
        } else {
          context.commit('updatePowderRoom', { powderRoom: response.data })
        }
      })
      .catch(function (error) {
        alert(error);
      })
    },

    //PowderRoomListに飛んだ時はstoreのPowderRoomのimageを更新する必要がある
    resetPowderRoomImages(context){
      context.commit('resetPowderRoomImages')
    },

    // Navigatorの挙動が変わるのでリセット
    resetPowderRoomList(context){
      context.commit('resetPowderRoomList')
    },

    addNavigatorItem(context){
      context.commit('addNavigatorItem')
    }



  },

})

export default store