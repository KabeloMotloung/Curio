import { createApp } from 'vue'
import './assets/style.css'
import { createRouter, createWebHistory } from 'vue-router'
import App from './App.vue'
import TheSwan from "./components/TheSwan/TheSwan.vue";
import PangolinAndCrocodile from "./components/PangolinAndCrocodile/PangolinAndCrocodile.vue";
import SidwaneTokozile from "./components/SidwaneTokozile/SidwaneTokozile.vue";
import Base from "./components/TheKraal/components/Base.vue";
import TheDiscovery from "./components/TheDiscovery/TheDiscovery.vue";
import SpindleWhorl from "./components/SpindleWhorl/SpindleWhorl.vue";
import BattleOfTorquay from "./components/BattleOfTorquay/BattleOfTorquay.vue";

const routes = [
    {path: '/the-swan', component: TheSwan},
    {path: '/pangolin-and-crocodile', component: PangolinAndCrocodile},
    {path: '/sidwane-tokozile', component: SidwaneTokozile},
    {path: '/the-kraal', component: Base},
    {path: '/the-discovery', component: TheDiscovery},
    {path: '/spindle-whorl', component: SpindleWhorl},
    {path: '/battle-of-torquay', component: BattleOfTorquay},
]

const router = createRouter({
    history: createWebHistory(),
    routes,
});

createApp(App).use(router).mount('#app')