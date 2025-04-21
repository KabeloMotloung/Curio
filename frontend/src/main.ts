import { createApp } from 'vue'
import './assets/style.css'
import { createRouter, createWebHistory } from 'vue-router'
import App from './App.vue'
import LandingPage from './components/LandingPage/LandingPage.vue'
import TheDiscovery from "./components/TheDiscovery/TheDiscovery.vue"

const routes = [
    {path : '/', component: LandingPage},
    { path: "/the-discovery", component: TheDiscovery },
]

const router = createRouter({
    history: createWebHistory(),
    routes,
});

createApp(App).use(router).mount('#app')
