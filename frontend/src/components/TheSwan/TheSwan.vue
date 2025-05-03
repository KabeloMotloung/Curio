<template>
  <div class="relative w-full overflow-hidden h-[300vh]">
    <!-- Loading overlay -->
    <div v-if="isLoading" class="fixed inset-0 z-[100] flex items-center justify-center bg-[#545863]/80">
      <div class="flex flex-col items-center gap-4">
        <div class="w-16 h-16 border-4 border-[#E5E7EB] border-t-transparent rounded-full animate-spin shadow-[0_0_15px_rgba(229,231,235,0.3)]"></div>
        <span class="text-[#E5E7EB] font-['Raleway'] tracking-[0.25em] uppercase text-sm text-shadow-[0_2px_8px_rgba(0,0,0,0.3)]">Loading</span>
      </div>
    </div>

    <!-- Back button -->
    <div class="fixed top-8 left-8 z-50">
      <button 
        @click="$router.back()" 
        class="text-white/40 hover:text-white/80 transition-all duration-300 flex items-center gap-2 group backdrop-blur-sm bg-white/5 px-4 py-2 rounded-lg hover:shadow-[0_0_15px_rgba(255,255,255,0.3)] hover:border hover:border-white/30"
      >
        <svg 
          class="w-6 h-6 transform group-hover:-translate-x-1 transition-transform duration-300" 
          fill="none" 
          stroke="currentColor" 
          viewBox="0 0 24 24"
        >
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M15 19l-7-7 7-7" />
        </svg>
        <span class="text-sm font-light tracking-[0.25em] uppercase font-['Raleway'] leading-none">Back</span>
      </button>
    </div>

    <!-- Background component -->
    <SwanBackground ref="swanBackground" />
    
    <!-- Welcome view with clouds component -->
    <WelcomeView ref="welcomeView" :scrollPosition="scrollPosition" 
                :paintingRevealStart="PAINTING_REVEAL_START" 
                :paintingRevealEnd="PAINTING_REVEAL_END" />

    
    <!-- Display content area -->
    <div class="relative z-10 flex flex-col items-center justify-center min-h-screen p-4">
      <!-- Framed Artifact component -->
      <FramedArtifact ref="framedArtifact" />

      <!-- Parchment Scroll component -->
      <ParchmentScroll ref="parchmentScroll" :parchmentStage="currentParchmentIndex" />
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted, watch } from 'vue';
import gsap from 'gsap';
import ScrollTrigger from 'gsap/ScrollTrigger';

import SwanBackground from './components/SwanBackground.vue';
import WelcomeView from './components/WelcomeView.vue';
import FramedArtifact from './components/FramedArtifact.vue';
import ParchmentScroll from './components/ParchmentScroll.vue';

gsap.registerPlugin(ScrollTrigger);


const PAINTING_REVEAL_START = 0.1;
const PAINTING_REVEAL_END = 0.3;
const PARCHMENT_REVEAL_END = 0.9;
const PARCHMENT_STAGES = 7;
const PARCHMENT_MOVE_DURATION = 0.2;


const isLoading = ref(true);
const assetsLoaded = ref(0);
const totalAssets = ref(0);
const scrollPosition = ref(0);
const currentParchmentIndex = ref(1);
const contentOpacity = ref(0);


const swanBackground = ref(null);
const welcomeView = ref(null);
const framedArtifact = ref(null);
const parchmentScroll = ref(null);


const loadAssets = () => {
  const assets = [
    './assets/sky-background.jpg',
    './assets/cloud.png',
    './assets/TheSwan.png',
    ...Array.from({ length: 7 }, (_, i) => `./assets/parchments/parchment-${i + 1}.png`)
  ];
  
  totalAssets.value = assets.length;
  

  const loadingTimeout = setTimeout(() => {
    isLoading.value = false;
  }, 5000);
  
  assets.forEach(src => {
    const img = new Image();
    img.onload = () => {
      assetsLoaded.value++;
      if (assetsLoaded.value === totalAssets.value) {
        clearTimeout(loadingTimeout);
        setTimeout(() => {
          isLoading.value = false;
        }, 500);
      }
    };
    img.onerror = () => {
      assetsLoaded.value++;
      if (assetsLoaded.value === totalAssets.value) {
        clearTimeout(loadingTimeout);
        setTimeout(() => {
          isLoading.value = false;
        }, 500);
      }
    };
    img.src = src;
  });
};


let ticking = false;
const animateOnScroll = () => {
  const maxScroll = document.body.scrollHeight - window.innerHeight;
  scrollPosition.value = maxScroll > 0 ? window.scrollY / maxScroll : 0;
  scrollPosition.value = Math.max(0, Math.min(1, scrollPosition.value));
  
  if (!ticking) {
    window.requestAnimationFrame(() => {
      const titleText = welcomeView.value?.titleText;
      const scrollIndicator = welcomeView.value?.scrollIndicator;
      const cloud1 = welcomeView.value?.cloud1;
      const cloud2 = welcomeView.value?.cloud2;
      const cloud3 = welcomeView.value?.cloud3;
      const paintingContainer = framedArtifact.value?.paintingContainer;
      const parchmentContainer = parchmentScroll.value?.parchmentContainer;
      
      if (titleText && scrollIndicator) {
        const fadeProgress = Math.min(1, (scrollPosition.value - PAINTING_REVEAL_START) / 
                           (PAINTING_REVEAL_END - PAINTING_REVEAL_START));
        
        gsap.to(titleText, {
          opacity: Math.max(0, 1 - fadeProgress * 2),
          y: -50 * fadeProgress,
          duration: 0.1
        });

        gsap.to(scrollIndicator, {
          opacity: Math.max(0, 1 - fadeProgress * 3), 
          duration: 0.1
        });
      }

      if (cloud1 && cloud2 && cloud3) {
        const cloudAnimProgress = Math.min(1, (scrollPosition.value - PAINTING_REVEAL_START) / 
                                 (PAINTING_REVEAL_END - PAINTING_REVEAL_START));
        
        const cloud1X = 10 - (cloudAnimProgress * 110); 
        gsap.to(cloud1, {
          left: `${cloud1X}%`,
          opacity: Math.max(0, 1 - cloudAnimProgress), 
          duration: 0.1
        });
        
        const cloud2X = 20 + (cloudAnimProgress * 110);
        gsap.to(cloud2, {
          right: `${-cloud2X}%`,
          opacity: Math.max(0, 1 - cloudAnimProgress),
          duration: 0.1
        });
        
        const cloud3Y = 60 + (cloudAnimProgress * 70);
        gsap.to(cloud3, {
          top: `${cloud3Y}%`,
          opacity: Math.max(0, 1 - cloudAnimProgress),
          duration: 0.1
        });
      }
      
      if (paintingContainer) {
        if (scrollPosition.value < PAINTING_REVEAL_END) {
          const paintingProgress = Math.max(0, Math.min(1, (scrollPosition.value - PAINTING_REVEAL_START) / 
                                         (PAINTING_REVEAL_END - PAINTING_REVEAL_START)));
          
          const paintingScale = 0.7 + (paintingProgress * 0.3); 
          const paintingOpacity = paintingProgress;
          
          gsap.to(paintingContainer, {
            scale: paintingScale,
            opacity: paintingOpacity,
            x: "0%",
            duration: 0.1
          });
        } else {
          const laterScrollProgress = Math.max(0, Math.min(1, (scrollPosition.value - PAINTING_REVEAL_END) / 0.1));
          
          const paintingScale = 1 - (laterScrollProgress * 0.3); 
          const paintingX = laterScrollProgress * -25; 
          
          gsap.to(paintingContainer, {
            scale: paintingScale,
            x: `${paintingX}%`,
            opacity: 1, 
            duration: 0.1
          });
        }
      }

      if (parchmentContainer) {
        const PAINTING_SHRINK_COMPLETE = PAINTING_REVEAL_END + 0.1;
        
        if (scrollPosition.value > PAINTING_SHRINK_COMPLETE) {
          const moveProgress = Math.min(1, (scrollPosition.value - PAINTING_SHRINK_COMPLETE) / PARCHMENT_MOVE_DURATION);
          const parchmentX = 100 - (moveProgress * 150); 
          const parchmentY = -20 - (moveProgress * 30); 
          
          gsap.to(parchmentContainer, {
            x: `${parchmentX}%`,
            y: `${parchmentY}%`,
            opacity: 1,
            duration: 0.1
          });

          if (moveProgress >= 1) {

            const unrollProgress = (scrollPosition.value - (PAINTING_SHRINK_COMPLETE + PARCHMENT_MOVE_DURATION)) / 
                                 (PARCHMENT_REVEAL_END - (PAINTING_SHRINK_COMPLETE + PARCHMENT_MOVE_DURATION));
            
            const parchmentStage = Math.min(
              PARCHMENT_STAGES,
              Math.max(1, Math.ceil(unrollProgress * PARCHMENT_STAGES))
            );
            currentParchmentIndex.value = parchmentStage;
            
            contentOpacity.value = Math.min(1, unrollProgress * 1.2);
          } else {
            currentParchmentIndex.value = 1;
            contentOpacity.value = 0;
          }
        } else {
          currentParchmentIndex.value = 1;
          contentOpacity.value = 0;
          gsap.to(parchmentContainer, {
            x: '100%',
            y: '0%',
            opacity: 1, 
            duration: 0.1
          });
        }
      }
      
      ticking = false;
    });
    ticking = true;
  }
};

watch(currentParchmentIndex, (newValue) => {
  if (parchmentScroll.value?.updateParchmentStage) {
    parchmentScroll.value.updateParchmentStage(newValue);
  }
});

onMounted(() => {
  loadAssets();
  window.addEventListener('scroll', animateOnScroll);
  
  animateOnScroll();
});

onUnmounted(() => {
  window.removeEventListener('scroll', animateOnScroll);
});
</script>

<style scoped>
@font-face {
  font-family: 'Montserrat';
  font-style: normal;
  font-weight: 600;
  src: local('Montserrat'),
       url('/fonts/Montserrat/static/Montserrat-SemiBold.ttf') format('truetype');
  font-display: swap;
}

@font-face {
  font-family: 'Raleway';
  font-style: normal;
  font-weight: 200;
  src: local('Raleway'),
       url('/fonts/Raleway/static/Raleway-ExtraLight.ttf') format('truetype');
  font-display: swap;
}

:root {
  scrollbar-width: none;
  -ms-overflow-style: none;
}

:root::-webkit-scrollbar {
  display: none;
}

body {
  scrollbar-width: none;
  -ms-overflow-style: none;
  overflow-y: scroll;
}

body::-webkit-scrollbar {
  display: none;
}

.transition-all {
  transition-property: all;
  transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
  transition-duration: 150ms;
}

html, body {
  overflow-x: hidden;
  height: 100%;
}
</style>