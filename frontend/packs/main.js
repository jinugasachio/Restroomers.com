// webpackエントリーポイント用jsファイル


import Vue from 'vue'
import VueOnsen from 'vue-onsenui';
import App from './App.vue'
import store from './store.js'
import router from './router.js'


//Image
import './images/woman.png'
import './images/lipstick.png'
import './images/ladyicon.png'
import './images/no_image.png'

Vue.use(VueOnsen);
Vue.component('star-rating', VueStarRating.default);

// 最初に仮の<root></root>要素を入れてそれをrenderで差し替えるっていうこと.
// このVueインスタンスではこのテンプレートを使いますという意味。
document.addEventListener('DOMContentLoaded', () => {
  // const el = document.body.appendChild(document.createElement('root'))
  new Vue({
    // el: '#app',
    store,
    router,
    render: h => h(App),
    beforeCreate() {
      this.$ons.disableAutoStyling(); //onsが端末に合わせて自動でデザインが変わるのを防ぐ設定
    }
  }).$mount('#app')
})
