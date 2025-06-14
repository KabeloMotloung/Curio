<script setup lang="ts">
import { useRouter } from 'vue-router';

const router = useRouter();

const goToRoot = () => {
  router.replace('/');
};
</script>

<template>
  <div class="fixed top-8 left-8 z-50">
    <button 
      @click="goToRoot" 
      class="text-white/80 hover:text-white transition-all duration-300 flex items-center gap-2 group backdrop-blur-sm 
      bg-black/60 px-4 py-2 rounded-lg border border-black/20
      shadow-[0_0_10px_rgba(255,255,255,0.2)]
      hover:shadow-[0_0_20px_rgba(0,0,0,0.5)] hover:border-black/30"
    >
      <svg 
        class="w-5 h-5 transform group-hover:-translate-x-1 transition-transform duration-300" 
        fill="none" 
        stroke="currentColor" 
        viewBox="0 0 24 24"
      >
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M15 19l-7-7 7-7" />
      </svg>
      <span class="text-sm font-light tracking-[0.25em] uppercase font-['Raleway'] leading-none">Back</span>
    </button>
  </div>
</template>

<style scoped>
@font-face {
  font-family: 'Raleway';
  font-style: normal;
  font-weight: 200;
  src: local('Raleway'),
       url('/fonts/Raleway/static/Raleway-ExtraLight.ttf') format('truetype');
  font-display: swap;
}

@font-face {
  font-family: 'Raleway';
  font-style: normal;
  font-weight: 400;
  src: local('Raleway'),
       url('/fonts/Raleway/static/Raleway-Regular.ttf') format('truetype');
  font-display: swap;
}

button {
  font-family: 'Raleway', sans-serif;
  text-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
}

.transition-all {
  transition-property: all;
  transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
  transition-duration: 150ms;
}
</style>
