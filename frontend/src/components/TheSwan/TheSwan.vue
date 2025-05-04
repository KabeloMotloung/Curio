<template>
  <div class="relative w-full overflow-hidden h-[500vh] custom-cursor">
    <!-- Loading overlay removed -->

    <!-- Back button -->
    <BackButton />

    <!-- Scroll Progress Indicator -->
    <ScrollProgress :totalSections="4" activeColor="bg-white" inactiveColor="bg-white/30" />

    <!-- Background component -->
    <SwanBackground ref="swanBackground" />
    
    <!-- Welcome view with clouds component -->
    <WelcomeView ref="welcomeView" :scrollPosition="scrollPosition" 
                :paintingRevealStart="WELCOME_START" 
                :paintingRevealEnd="WELCOME_END" />
    
    <!-- Timeline component - appears after welcome view -->
    <div ref="timelineContainer" 
         class="fixed inset-0 z-20 transition-opacity duration-500"
         :class="{'opacity-0': scrollPosition < TIMELINE_START || scrollPosition > TIMELINE_END, 
                'opacity-100': scrollPosition >= TIMELINE_START && scrollPosition < TIMELINE_END}">
      <Timeline 
        ref="timeline" 
        :events="timelineEvents" 
        :scrollPosition="scrollPosition"
        :startPosition="TIMELINE_START"
        :endPosition="TIMELINE_END" />
    </div>
    
    <!-- Background Information component -->
    <div ref="backgroundInfoContainer"
         class="fixed inset-0 z-20 transition-all duration-500"
         :class="{'opacity-0': scrollPosition < BACKGROUND_INFO_START || scrollPosition > BACKGROUND_INFO_END, 
                'opacity-100': scrollPosition >= BACKGROUND_INFO_START && scrollPosition <= BACKGROUND_INFO_END}">
      <BackgroundInformation 
        ref="backgroundInfo" 
        :scrollPosition="scrollPosition"
        :startPosition="BACKGROUND_INFO_START"
        :endPosition="BACKGROUND_INFO_END" />
    </div>
    
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
import BackButton from "../UniversalComponents/BackButton.vue";
import ScrollProgress from "../UniversalComponents/ScrollProgress.vue";
import Timeline from "./components/Timeline.vue"; 
import BackgroundInformation from "./components/BackgroundInformation.vue";

gsap.registerPlugin(ScrollTrigger);

const WELCOME_START = 0.0;
const WELCOME_END = 0.18;
const TIMELINE_START = 0.1;
const TIMELINE_END = 0.4;  
const BACKGROUND_INFO_START = 0.38;
const BACKGROUND_INFO_END = 0.6;
const PAINTING_REVEAL_START = 0.6;
const PAINTING_REVEAL_END = 0.7;
const PARCHMENT_REVEAL_START = 0.7; 
const PARCHMENT_REVEAL_END = 0.95;
const PARCHMENT_STAGES = 7;

const timelineEvents = [
  {
    date: "",
    description: "",
    details: "",
    fact: ""
  },
  {
    date: "",
    description: "",
    details: "",
    fact: ""
  },
  {
    date: "",
    description: "",
    details: "",
    fact: ""
  },
  {
    date: "1849",
    description: "Creation of 'The Swan'",
    details: "Jan Jacob Spohler completes 'The Swan' (Het Zwaantje), depicting a rural inn with symbolic imagery.",
    fact: "Spohler painted the swan on the inn's signboard with unusual detail, making it the focal point."
  },
  {
    date: "1850",
    description: "Initial Exhibition",
    details: "First displayed in small galleries throughout the Netherlands, primarily in Amsterdam.",
    fact: "The painting was initially criticized for its focus on common rural life rather than grand scenes."
  },
  {
    date: "1876",
    description: "Acquisition by Collectors",
    details: "Purchased by the van der Meer family, wealthy textile merchants from Tilburg.",
    fact: "The painting was displayed prominently in their home library for over 40 years."
  },
  {
    date: "1920",
    description: "Period of Obscurity",
    details: "The painting changed hands several times during both World Wars and was nearly damaged.",
    fact: "It was hidden in a countryside cellar to protect it from wartime looting."
  },
  {
    date: "1978",
    description: "Scholarly Rediscovery",
    details: "Art historians recognized the painting's symbolic depth and historical significance.",
    fact: "X-ray analysis revealed a different landscape beneath the current painting."
  },
  {
    date: "2015",
    description: "Museum Acquisition",
    details: "Added to the permanent collection of the Dutch National Museum of Fine Arts.",
    fact: "Modern digital analysis has identified previously unnoticed details in the background."
  },
  {
    date: "",
    description: "",
    details: "",
    fact: ""
  }
];

const scrollPosition = ref(0);
const currentParchmentIndex = ref(1);
const contentOpacity = ref(0);

const swanBackground = ref(null);
const welcomeView = ref(null);
const framedArtifact = ref(null);
const parchmentScroll = ref(null);
const timeline = ref(null);
const timelineContainer = ref(null);
const backgroundInfo = ref(null);
const backgroundInfoContainer = ref(null);

let ticking = false;
let lastScrollY = 0;
const scrollThreshold = 5;

const animateOnScroll = () => {
  if (Math.abs(window.scrollY - lastScrollY) < scrollThreshold && ticking) {
    return;
  }
  
  lastScrollY = window.scrollY;
  const maxScroll = document.body.scrollHeight - window.innerHeight;
  scrollPosition.value = maxScroll > 0 ? window.scrollY / maxScroll : 0;
  scrollPosition.value = Math.max(0, Math.min(1, scrollPosition.value));
  
  if (!ticking) {
    window.requestAnimationFrame(() => {
      const titleText = welcomeView.value?.titleText;
      const cloud1 = welcomeView.value?.cloud1;
      const cloud2 = welcomeView.value?.cloud2;
      const cloud3 = welcomeView.value?.cloud3;
      const paintingContainer = framedArtifact.value?.paintingContainer;
      const parchmentContainer = parchmentScroll.value?.parchmentContainer;
      
      if (titleText) {
        const fadeProgress = Math.min(1, (scrollPosition.value - WELCOME_START) / 
                           (WELCOME_END - WELCOME_START));
        
        gsap.to(titleText, {
          opacity: Math.max(0, 1 - fadeProgress * 2),
          y: -50 * fadeProgress,
          duration: 0.1
        });
      }

      if (cloud1 && cloud2 && cloud3) {
        const cloudAnimProgress = Math.min(1, (scrollPosition.value - WELCOME_START) / 
                                 (WELCOME_END - WELCOME_START));
        
        const cloud1X = 18 - (cloudAnimProgress * 120); 
        const cloud1Y = 15 + (cloudAnimProgress * 10);
        gsap.to(cloud1, {
          left: `${cloud1X}%`,
          top: `${cloud1Y}%`,
          opacity: Math.max(0, 1 - cloudAnimProgress), 
          duration: 0.1
        });
        
        const cloud2X = 65 + (cloudAnimProgress * 120);
        const cloud2Y = 25 - (cloudAnimProgress * 10);
        gsap.to(cloud2, {
          left: `${cloud2X}%`,
          right: 'auto',
          top: `${cloud2Y}%`,
          opacity: Math.max(0, 1 - cloudAnimProgress),
          duration: 0.1
        });
        
        const cloud3X = 15 + (cloudAnimProgress * 40);
        const cloud3Y = 60 + (cloudAnimProgress * 150);
        gsap.to(cloud3, {
          left: `${cloud3X}%`,
          top: `${cloud3Y}%`,
          opacity: Math.max(0, 1 - cloudAnimProgress),
          duration: 0.1
        });
      }
      
      if (paintingContainer) {
        if (scrollPosition.value < PAINTING_REVEAL_START) {
          gsap.to(paintingContainer, {
            scale: 0.7,
            opacity: 0,
            duration: 0.1
          });
        } else if (scrollPosition.value >= PAINTING_REVEAL_START && scrollPosition.value <= PAINTING_REVEAL_END) {
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
        const PARCHMENT_ENTER = PARCHMENT_REVEAL_START;
        const PARCHMENT_FINAL_POS = PARCHMENT_REVEAL_START + 0.08;
        const PARCHMENT_UNFOLD_START = PARCHMENT_FINAL_POS;
        
        if (scrollPosition.value >= PARCHMENT_ENTER && scrollPosition.value < PARCHMENT_FINAL_POS) {
          const entranceProgress = (scrollPosition.value - PARCHMENT_ENTER) / (PARCHMENT_FINAL_POS - PARCHMENT_ENTER);
          
          const initialX = 100 - (entranceProgress * 150);
          const initialScale = 0.6 + (entranceProgress * 0.4);
          const initialRotation = 45 - (entranceProgress * 45);
          
          parchmentContainer.style.opacity = entranceProgress;
          parchmentContainer.style.transform = `translate(${initialX}%, -50%) scale(${initialScale}) rotate(${initialRotation}deg)`;
          
          currentParchmentIndex.value = 1;
          contentOpacity.value = 0;
        } 
        else if (scrollPosition.value >= PARCHMENT_FINAL_POS && scrollPosition.value <= PARCHMENT_REVEAL_END) {
          parchmentContainer.style.opacity = 1;
          parchmentContainer.style.transform = `translate(-50%, -50%) scale(1) rotate(0deg)`;
          
          const unrollProgress = (scrollPosition.value - PARCHMENT_UNFOLD_START) / 
                               (PARCHMENT_REVEAL_END - PARCHMENT_UNFOLD_START);
          
          const stageProgress = Math.pow(unrollProgress, 1.2);
          const rawStage = stageProgress * PARCHMENT_STAGES;
          const targetStage = Math.min(PARCHMENT_STAGES, Math.max(1, Math.ceil(rawStage)));
          
          if (currentParchmentIndex.value !== targetStage) {
            currentParchmentIndex.value = targetStage;
          }
          
          const stageThreshold = (targetStage - 0.5) / PARCHMENT_STAGES;
          const withinStageProgress = Math.max(0, Math.min(1, 
            (unrollProgress - stageThreshold) * PARCHMENT_STAGES));
          
          contentOpacity.value = Math.min(1, withinStageProgress * 2);
        } 
        else if (scrollPosition.value > PARCHMENT_REVEAL_END) {
          const hoverProgress = (scrollPosition.value - PARCHMENT_REVEAL_END) / 0.05;
          const hoverScale = 1 + Math.min(0.05, Math.max(0, hoverProgress - 0.5) * 0.1);
          
          parchmentContainer.style.opacity = 1;
          parchmentContainer.style.transform = `translate(-50%, -50%) scale(${hoverScale}) rotate(0deg)`;
          
          currentParchmentIndex.value = PARCHMENT_STAGES;
          contentOpacity.value = 1;
        } 
        else {
          currentParchmentIndex.value = 1;
          contentOpacity.value = 0;
          parchmentContainer.style.opacity = 0;
          parchmentContainer.style.transform = 'translate(100%, -50%) scale(0.6) rotate(45deg)';
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
  window.addEventListener('scroll', animateOnScroll);
  animateOnScroll();
});

onUnmounted(() => {
  window.removeEventListener('scroll', animateOnScroll);
});
</script>

<style scoped>
@font-face {
  font-family: 'Playfair Display';
  font-style: normal;
  font-weight: 400;
  src: local('Playfair Display'),
       url('/fonts/Playfair_Display/static/PlayfairDisplay-Regular.ttf') format('truetype');
  font-display: swap;
}

@font-face {
  font-family: 'Playfair Display';
  font-style: normal;
  font-weight: 700;
  src: local('Playfair Display'),
       url('/fonts/Playfair_Display/static/PlayfairDisplay-Bold.ttf') format('truetype');
  font-display: swap;
}

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

html, body {
  overflow-x: hidden;
  height: 100%;
}

.custom-cursor {
  cursor: url('./assets/quill_cursor.png'), auto;
}
</style>