// webpackエントリーポイント用jsファイル


import Vue from 'vue'
// import App from './components/GoogleMap.vue'
import App from './App.vue'
import store from './store.js'
import router from './router.js'

//Image
import './images/woman.png'
import './images/lipstick.png'
import './images/ladyicon.png'


// 最初に仮の<root></root>要素を入れてそれをrenderで差し替えるっていうこと.
// このVueインスタンスではこのテンプレートを使いますという意味。
document.addEventListener('DOMContentLoaded', () => {
  // const el = document.body.appendChild(document.createElement('root'))
  const app = new Vue({
    // el: '#app',
    store,
    router,
    render: h => h(App)
  }).$mount('#app')
})
