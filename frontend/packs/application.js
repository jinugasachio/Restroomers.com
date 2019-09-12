// webpackエントリーポイント用jsファイル

//Vue
import Vue from 'vue'
import App from './components/app.vue'
import './components/google_map.vue'

// import App from  './components/google_map.js'

//Image
import './images/woman.png'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(App)
  }).$mount()
  document.body.appendChild(app.$el)

  console.log(app)

})