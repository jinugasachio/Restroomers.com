import Vue from 'vue'
import VueRouter from 'vue-router'

//Components for router
import TopPage from './components/TopPage.vue'
import GoogleMap from './components/GoogleMap.vue'


Vue.use(VueRouter)

const router = new VueRouter({
  mode: "history",
  routes: [
    { path: '/', component: TopPage },
    { path: '/post', component: GoogleMap }
  ]
});

export default router