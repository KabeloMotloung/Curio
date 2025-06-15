import { createApp } from 'vue'
import './assets/style.css'
import { createRouter, createWebHistory } from 'vue-router'
import App from './App.vue'
import TheSwan from "./components/TheSwan/TheSwan.vue";
import PangolinAndCrocodile from "./components/PangolinAndCrocodile/PangolinAndCrocodile.vue";
import SidwaneTokozile from "./components/SidwaneTokozile/SidwaneTokozile.vue";
import TheKraal from "./components/TheKraal/components/theKraal.vue";
import TheDiscovery from "./components/TheDiscovery/TheDiscovery.vue";
import SpindleWhorl from "./components/SpindleWhorl/SpindleWhorl.vue";
import BattleOfTorquay from "./components/BattleOfTorquay/BattleOfTorquay.vue";
import LandingPage from "./components/LandingPage/LandingPage.vue";

const routes = [
    {path: '/', component: LandingPage},
    {path: '/the-swan', component: TheSwan},
    {path: '/pangolin-and-crocodile', component: PangolinAndCrocodile},
    {path: '/sidwane-tokozile', component: SidwaneTokozile},
    {path: '/the-kraal', component: TheKraal},
    {path: '/the-discovery', component: TheDiscovery},
    {path: '/spindle-whorl', component: SpindleWhorl},
    {path: '/battle-of-torquay', component: BattleOfTorquay},
]

const router = createRouter({
    history: createWebHistory(),
    routes,
    scrollBehavior(to, from, savedPosition) {
        return { top: 0 };
    },
});

createApp(App).use(router).mount('#app')