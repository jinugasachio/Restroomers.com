import Vue from 'vue'
import VueRouter from 'vue-router'


//Components for router
import TopPage from './components/TopPage.vue'
import Room from './components/Room.vue'


Vue.use(VueRouter)

const router = new VueRouter({
  mode: "history",
  routes: [
    { path: '/', component: TopPage },
    { path: '/room/:id', component: Room }
  ]
});

export default router