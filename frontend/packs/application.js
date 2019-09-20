// webpackエントリーポイント用jsファイル


import Vue from 'vue'
import App from './components/GoogleMap.vue'
import store from './store.js' //import vuex as store

//Image
import './images/woman.png'
import './images/lipstick.png'


// Vue.use(Vuex)

// 最初に仮の<root></root>要素を入れてそれをrenderで差し替えるっていうこと.
// このVueインスタンスではこのテンプレートを使いますという意味。
document.addEventListener('DOMContentLoaded', () => {
  const el = document.body.appendChild(document.createElement('root'))
  const app = new Vue({
    el,
    store,
    render: h => h(App)
  })
  console.log(app)
})
