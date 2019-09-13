// webpackエントリーポイント用jsファイル

//Vue
import Vue from 'vue'
// import App from './components/app.vue'
import App from './components/google_map.vue'

//Image
import './images/woman.png'


// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     render: h => h(App)}).$mount()
//     // debugger;
//   document.body.appendChild(app.$el)
//   console.log(app)
// })


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
