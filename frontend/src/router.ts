import { createRouter, createWebHistory } from 'vue-router'
import HomePage from './pages/HomePage.vue'
import HealthPage from './pages/HealthPage.vue'

export default createRouter({
  history: createWebHistory(),
  routes: [
    { path: '/', component: HomePage },
    { path: '/health', component: HealthPage }
  ]
})