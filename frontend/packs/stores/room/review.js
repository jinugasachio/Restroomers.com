export default {

  state: {

    roomReviews:[],
    roomReviews_1:[],
    activeTab: 0
    
  },

  getters: {

    roomReviews(state){
      if (state.activeTab == 0){
        return state.roomReviews;
      }
      else if (state.activeTab == 1){
        return state.roomReviews_1;
      }
    },

  },

  mutations: {

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
    activeTab(state, payload){
      state.activeTab = payload;
    },

  },


  actions: {

    postReview(context, reviewParams){
      axios.post('/api/reviews', reviewParams, { headers: context.rootState.userStore.headers })
      .then(function(response){
        context.commit('postReview', { newReview: response.data })
      })
      .catch(function (error) {
        alert('予期しないエラーが発生しました。');
      })
    },

    // deleteReview(context, params){
    //   axios.delete('/api/reviews/' + params.id,  { headers: context.rootState.userStore.headers })
    //   .then(function(response){
    //     context.commit('deleteReview', { review: response.data })
    //   })
    //   .catch(function (error) {
    //     alert('予期しないエラーが発生しました。');
    //   })
    // },

  }
}