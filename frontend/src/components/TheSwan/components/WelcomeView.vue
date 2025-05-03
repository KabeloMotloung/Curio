// Components for the clouds and welcome screen
<template>
  <div class="fixed inset-0 pointer-events-none" ref="cloudContainer">      
    <div class="absolute top-[10%] left-0 w-full flex items-center justify-center text-white/90 transition-opacity duration-500" ref="titleText">
      <h1 class="text-7xl font-extralight tracking-[0.25em] uppercase">The Swan</h1>
    </div>
    <img 
      :src="cloudImageUrl"
      class="absolute top-[15%] left-[10%] w-[30%] opacity-0 animate-float-slow" 
      ref="cloud1" 
      alt="Cloud 1"
    />
    <img 
      :src="cloudImageUrl"
      class="absolute top-[25%] right-[20%] w-[40%] opacity-0 animate-float-medium" 
      ref="cloud2" 
      alt="Cloud 2"
    />
    <img 
      :src="cloudImageUrl"
      class="absolute top-[60%] left-[30%] w-[35%] opacity-0 animate-float-fast" 
      ref="cloud3" 
      alt="Cloud 3"
    />
  </div>

  <div class="fixed bottom-12 left-1/2 -translate-x-1/2 text-[#1F2937] flex flex-col items-center gap-3 transition-opacity duration-500" ref="scrollIndicator">
    <span class="text-sm font-light tracking-[0.25em] uppercase font-['Raleway']">Scroll to explore</span>
    <svg class="w-5 h-5 animate-bounce opacity-90" fill="none" stroke="currentColor" viewBox="0 0 24 24">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1" d="M19 13l-7 7-7-7"></path>
    </svg>
  </div>
</template>

<script setup>
import { ref, onMounted, computed } from 'vue';
import gsap from 'gsap';

const cloudContainer = ref(null);
const cloud1 = ref(null);
const cloud2 = ref(null);
const cloud3 = ref(null);
const titleText = ref(null);
const scrollIndicator = ref(null);


const cloudImageUrl = computed(() => {
  return new URL('../assets/cloud.png', import.meta.url).href;
});

defineProps({
  scrollPosition: {
    type: Number,
    default: 0
  },
  paintingRevealStart: {
    type: Number,
    default: 0.1
  },
  paintingRevealEnd: {
    type: Number,
    default: 0.3
  }
});


onMounted(() => {
  if (cloud1.value && cloud2.value && cloud3.value) {
    gsap.to([cloud1.value, cloud2.value, cloud3.value], {
      opacity: 0.8,
      duration: 1.5,
      stagger: 0.3,
      ease: "power2.out"
    });
  }
});

defineExpose({
  cloud1,
  cloud2,
  cloud3,
  titleText,
  scrollIndicator
});
</script>

<style scoped>
@font-face {
  font-family: 'Raleway';
  font-style: normal;
  font-weight: 200;
  src: local('Raleway'),
       url('/fonts/Raleway/static/Raleway-ExtraLight.ttf') format('truetype');
  font-display: swap;
}

h1 {
  font-family: 'Raleway', sans-serif !important;
  text-shadow: 0 2px 8px rgba(0, 0, 0, 0.3);
  color: #E5E7EB !important;
  font-weight: 200 !important;
}

[ref="scrollIndicator"] {
  text-shadow: 0 1px 4px rgba(255, 255, 255, 0.5);
  font-weight: 200;
}

[ref="scrollIndicator"] span {
  font-family: 'Raleway', sans-serif !important;
}

@keyframes floatSlow {
  0%, 100% { 
    transform: translate(0, 0) rotate(0deg); 
  }
  25% {
    transform: translate(25px, 8px) rotate(1deg);
  }
  75% {
    transform: translate(-15px, -5px) rotate(-1deg);
  }
}

@keyframes floatMedium {
  0%, 100% { 
    transform: translate(0, 0) rotate(0deg); 
  }
  33% {
    transform: translate(-30px, 10px) rotate(-1deg);
  }
  66% {
    transform: translate(20px, -8px) rotate(1deg);
  }
}

@keyframes floatFast {
  0%, 100% { 
    transform: translate(0, 0) rotate(0deg); 
  }
  40% {
    transform: translate(35px, -12px) rotate(1.5deg);
  }
  60% {
    transform: translate(-25px, 8px) rotate(-1deg);
  }
}

.animate-float-slow {
  animation: floatSlow 12s ease-in-out infinite;
  will-change: transform;
}

.animate-float-medium {
  animation: floatMedium 14s ease-in-out infinite;
  will-change: transform;
}

.animate-float-fast {
  animation: floatFast 10s ease-in-out infinite;
  will-change: transform;
}

[ref="cloud1"],
[ref="cloud2"],
[ref="cloud3"] {
  transition: opacity 0.5s ease-in-out, transform 0.5s ease-in-out;
  transform-origin: center center;
}
</style>