// webpackエントリーポイントファイル
import Vue from 'vue'
import App from './App.vue'
import store from './store.js'
import router from './router.js'
import './library.js'
import './images/woman.png'
import './images/lipstick.png'
import './images/ladyicon.png'
import './images/no_image.png'
import './images/position.png'
import './images/search1.png'
import './images/sign_out.png'

// 最初に仮の<root></root>要素を入れてそれをrenderで差し替えるっていうこと.
// このVueインスタンスではこのテンプレートを使いますという意味。
document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    store,
    router,
    render: h => h(App),
    beforeCreate() {
      this.$ons.disableAutoStyling(); //onsが端末に合わせて自動でデザインが変わるのを防ぐ設定
    }
  }).$mount('#app')
})
