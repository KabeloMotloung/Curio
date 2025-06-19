<template>
  <div class="page-end-section">
    <div class="w-full max-w-2xl px-4">
      <div class="relative group cursor-pointer" @click="navigateToNext">
        <div class="relative p-12 rounded-lg transition-all duration-300 overflow-hidden backdrop-blur-sm bg-black/60 
                    border border-white/20 shadow-[0_0_10px_rgba(255,255,255,0.2)]
                    group-hover:shadow-[0_0_20px_rgba(255,255,255,0.5)] group-hover:border-white/50 h-full min-h-[700px]">
          <div class="flex flex-col h-full items-center justify-center">
            <div class="w-96 h-96 rounded-lg overflow-hidden transform transition-transform duration-300
                        group-hover:scale-105 flex items-center justify-center mb-12">
              <img :src="artifactImage" 
                   alt="The Battle of Torquay"
                   class="w-full h-full object-contain" />
            </div>
            <div class="flex flex-col items-center text-center mb-8">
              <h3 class="text-sm font-raleway font-light tracking-[0.25em] uppercase mb-3 text-white/80 group-hover:text-white transition-colors duration-300">Next Artifact</h3>
              <p class="text-3xl font-raleway font-light tracking-[0.15em] text-white/90 group-hover:text-white transition-colors duration-300">The Battle of Torquay</p>
            </div>
            <div class="flex items-center justify-center">
              <span class="text-xs font-raleway font-light tracking-[0.25em] uppercase text-white/60 group-hover:text-white/80 transition-colors duration-300">Click to explore</span>
              <svg class="w-5 h-5 ml-2 text-white/60 group-hover:text-white/80 transition-colors duration-300 transform transition-transform duration-300 group-hover:translate-x-1" 
                   fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M9 5l7 7-7 7"/>
              </svg>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router';
import theBattleOfTorquayImage from '../../Cards/assets/BattleOfTorquayImage.png';

const router = useRouter();
const artifactImage = theBattleOfTorquayImage;

// Add the emit definition
const emit = defineEmits(['resetAnimations']);

const navigateToNext = () => {
  // Emit the resetAnimations event before navigation
  emit('resetAnimations');
  
  // Short timeout to ensure the event is processed
  setTimeout(() => {
    router.replace('/battle-of-torquay');
  }, 50);
};
</script>

<style scoped>
.page-end-section {
  position: relative;
  height: 100vh;
  width: 100%;
  background: linear-gradient(to bottom,#111, #313550);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 1;
}

/* Use same font styling as in your main component */
.font-raleway {
  font-family: 'Raleway', sans-serif;
  text-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
}
</style>