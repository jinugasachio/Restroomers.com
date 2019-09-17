// webpackエントリーポイント用jsファイル


import Vue from 'vue'
// import axios from 'axios'
import App from './components/GoogleMap.vue'

//Image
import './images/woman.png'


Vue.use

// 最初に仮の<root></root>要素を入れてそれをrenderで差し替えるっていうこと.
// このVueインスタンスではこのテンプレートを使いますという意味。
document.addEventListener('DOMContentLoaded', () => {
  const el = document.body.appendChild(document.createElement('root'))
  const app = new Vue({
    el,
    render: h => h(App)
  })
  console.log(app)
})
