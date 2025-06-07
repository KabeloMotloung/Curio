<template>
  <div class="relative w-full overflow-hidden h-[1500vh] custom-cursor">   
    <!-- Loading overlay -->
    <div 
      ref="loaderOverlay"
      class="fixed inset-0 z-50 flex items-center justify-center bg-[#111111] transition-opacity duration-1000"
      :class="{ 'opacity-0 pointer-events-none': !isLoading }"
    >
      <div class="flex flex-col items-center">
        <!-- Sleek spinner loader -->
        <div class="relative w-16 h-16 mb-5">
          <div class="absolute inset-0 border-2 border-white/10 rounded-full"></div>
          <div class="absolute inset-0 border-2 border-transparent border-t-white rounded-full animate-spinner"></div>        </div>
        <p class="text-white text-base font-raleway uppercase tracking-widest">Loading<span ref="loadingDots">.</span></p>
      </div>
    </div>

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

    <!-- Page End component -->
    <div v-if="scrollPosition >= PAGE_END_START">
      <PageEnd 
        nextArtifactTitle="Sidwane Tokozile"
        nextArtifactPath="/sidwane-tokozile"
        bgColor="#1a1a1a"
        textColor="#ffffff"
        :isVisible="true"
        @resetAnimations="resetAnimations"
      />
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted, watch, nextTick } from 'vue';
import { onBeforeRouteLeave } from 'vue-router';
import gsap from 'gsap';
import ScrollTrigger from 'gsap/ScrollTrigger';

import SwanBackground from './components/SwanBackground.vue';
import WelcomeView from './components/WelcomeView.vue';
import FramedArtifact from './components/FramedArtifact.vue';
import ParchmentScroll from './components/ParchmentScroll.vue';
import BackButton from "../UniversalComponents/BackButton.vue";
import ScrollProgress from "./components/ScrollProgress.vue";
import Timeline from "./components/Timeline.vue"; 
import BackgroundInformation from "./components/BackgroundInformation.vue";
import PageEnd from "../UniversalComponents/PageEnd.vue";
import swanImage from './assets/TheSwan.png';
import parchmentImage from './assets/parchments/parchment-1.png';
import cloudImage from './assets/cloud.png';
import skyBackground from './assets/sky-background.jpg';

gsap.registerPlugin(ScrollTrigger);

const WELCOME_START = 0.0;
const WELCOME_END = 0.14;
const TIMELINE_START = 0.0823;
const TIMELINE_END = 0.4;  
const BACKGROUND_INFO_START = 0.35;
const BACKGROUND_INFO_END = 0.7;
const PAINTING_REVEAL_START = 0.7;
const PAINTING_REVEAL_END = 0.72;
const PARCHMENT_REVEAL_START = 0.73; 
const PARCHMENT_REVEAL_END = 0.83;
const PARCHMENT_STAGES = 7;
const EXIT_START = 0.88;
const EXIT_END = 0.94;
const PAGE_END_START = 0.98;

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
const isLoading = ref(true);
const loadingDots = ref(null);
const loadingDotsInterval = ref(null);
let isSnapping = ref(false);
let snapTimeout = null;
let lastSnapPosition = ref(null);
let lastScrollDirection = ref(null);
let lastScrollTime = ref(Date.now());
let hasAutoScrolled = ref(false);
let isAutoScrolling = ref(false);
let currentScrollInterval = null;
let inactivityTimer = null;
let isManualScrolling = ref(false);

const swanBackground = ref(null);
const welcomeView = ref(null);
const framedArtifact = ref(null);
const parchmentScroll = ref(null);
const timeline = ref(null);
const timelineContainer = ref(null);
const backgroundInfo = ref(null);
const backgroundInfoContainer = ref(null);
const loaderOverlay = ref(null);

let ticking = false;
let lastScrollY = 0;
const scrollThreshold = 5;

const REFRESH_KEY = "swan_refresh_requested";

const SCROLL_CHECKPOINTS = [
  { position: 0.00, name: 'Welcome' },
  { position: 0.0824, name: 'Timeline Start' },
  { position: 0.1236, name: 'Timeline 1' },
  { position: 0.1647, name: 'Timeline 2' },
  { position: 0.2059, name: 'Timeline 3' },
  { position: 0.2471, name: 'Timeline 4' },
  { position: 0.2883, name: 'Timeline 5' },
  { position: 0.58, name: 'Background' },
  { position: 0.72, name: 'Painting' },
  { position: 0.87, name: 'Pre-End' },
  { position: 0.99, name: 'Next' }
];

const INACTIVITY_DELAY = 1000;
const SCROLL_STEP = 8;
const SCROLL_INTERVAL = 8;

const findNearestCheckpoint = (currentPosition, direction) => {
  let nearestCheckpoint = null;
  let minDistance = Infinity;

  for (const checkpoint of SCROLL_CHECKPOINTS) {
    const distance = checkpoint.position - currentPosition;
    
    if ((direction === 'up' && distance < 0) || (direction === 'down' && distance > 0)) {
      const absDistance = Math.abs(distance);
      if (absDistance < minDistance) {
        minDistance = absDistance;
        nearestCheckpoint = checkpoint;
      }
    }
  }

  return nearestCheckpoint;
};

const isAtCheckpoint = (position) => {
  return SCROLL_CHECKPOINTS.some(checkpoint => 
    Math.abs(checkpoint.position - position) < 0.001
  );
};

const resetInactivityTimer = () => {
  if (inactivityTimer) {
    clearTimeout(inactivityTimer);
  }
  inactivityTimer = null;
};

const stopAutoScroll = () => {
  if (currentScrollInterval) {
    clearInterval(currentScrollInterval);
    currentScrollInterval = null;
  }
  isSnapping.value = false;
  isAutoScrolling.value = false;
  hasAutoScrolled.value = false;
};

const autoScrollToCheckpoint = (targetPosition) => {
  if (isSnapping.value || hasAutoScrolled.value || isAutoScrolling.value || isManualScrolling.value) return;
  
  isSnapping.value = true;
  isAutoScrolling.value = true;
  hasAutoScrolled.value = true;
  
  const maxScroll = document.body.scrollHeight - window.innerHeight;
  const targetScroll = maxScroll * targetPosition;
  const startScroll = window.scrollY;
  const distance = targetScroll - startScroll;
  const direction = distance > 0 ? 1 : -1;
  
  stopAutoScroll();
  
  currentScrollInterval = setInterval(() => {
    if (isManualScrolling.value) {
      stopAutoScroll();
      return;
    }

    const currentScroll = window.scrollY;
    const remainingDistance = targetScroll - currentScroll;
    const absRemainingDistance = Math.abs(remainingDistance);
    
    const decelerationZone = 100;
    let currentStep = SCROLL_STEP;
    
    if (absRemainingDistance < decelerationZone) {
      currentStep = Math.max(1, Math.floor(SCROLL_STEP * (absRemainingDistance / decelerationZone)));
    }
    
    if (absRemainingDistance <= currentStep) {
      window.scrollTo(0, targetScroll);
      stopAutoScroll();
      lastSnapPosition.value = targetPosition;
      return;
    }
    
    window.scrollBy(0, direction * currentStep);
    
    if (targetPosition >= 0.99 && scrollPosition.value >= 0.88) {
      const exitProgress = Math.max(0, Math.min(1, (scrollPosition.value - 0.88) / 0.06));
      if (framedArtifact.value?.paintingContainer) {
        gsap.to(framedArtifact.value.paintingContainer, {
          opacity: 1 - exitProgress,
          duration: 0.1,
          ease: "none"
        });
      }
    }
  }, SCROLL_INTERVAL);
};

const checkForAutoScroll = () => {
  resetInactivityTimer();
  
  if (isManualScrolling.value) return;
  
  inactivityTimer = setTimeout(() => {
    if (!isSnapping.value && lastScrollDirection.value && !hasAutoScrolled.value && !isAutoScrolling.value) {
      if (isAtCheckpoint(scrollPosition.value)) {
        return;
      }
      
      const nearestCheckpoint = findNearestCheckpoint(scrollPosition.value, lastScrollDirection.value);
      if (nearestCheckpoint) {
        autoScrollToCheckpoint(nearestCheckpoint.position);
      }
    }
  }, INACTIVITY_DELAY);
};

const animateOnScroll = () => {
  if (isAutoScrolling.value) {
    stopAutoScroll();
    isManualScrolling.value = true;
    return;
  }

  if (isSnapping.value) {
    return;
  }

  if (Math.abs(window.scrollY - lastScrollY) < scrollThreshold && ticking) {
    return;
  }
  
  const currentTime = Date.now();
  const currentScrollY = window.scrollY;
  
  if (currentScrollY !== lastScrollY) {
    hasAutoScrolled.value = false;
    isAutoScrolling.value = false;
    lastScrollDirection.value = currentScrollY > lastScrollY ? 'down' : 'up';
    lastScrollTime.value = currentTime;
    resetInactivityTimer();
    checkForAutoScroll();
  }
  
  lastScrollY = currentScrollY;
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
            duration: 0.1,
            ease: "none"
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
            duration: 0.1,
            ease: "none"
          });
        } else if (scrollPosition.value >= EXIT_START && scrollPosition.value <= EXIT_END) {
          const exitProgress = Math.max(0, Math.min(1, (scrollPosition.value - EXIT_START) / 
                                         (EXIT_END - EXIT_START)));
          
          gsap.to(paintingContainer, {
            opacity: 1 - exitProgress,
            duration: 0.1,
            ease: "none"
          });
        } else if (scrollPosition.value > EXIT_END) {
          gsap.to(paintingContainer, {
            opacity: 0,
            duration: 0.1,
            ease: "none"
          });
        } else {
          const laterScrollProgress = Math.max(0, Math.min(1, (scrollPosition.value - PAINTING_REVEAL_END) / 0.1));
          
          const paintingScale = 1 - (laterScrollProgress * 0.3); 
          const paintingX = laterScrollProgress * -25; 
          
          gsap.to(paintingContainer, {
            scale: paintingScale,
            x: `${paintingX}%`,
            opacity: 1,
            duration: 0.1,
            ease: "none"
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
          
          gsap.to(parchmentContainer, {
            opacity: entranceProgress,
            x: `${initialX}%`,
            y: '-50%',
            scale: initialScale,
            rotation: initialRotation,
            duration: 0.1,
            ease: "none"
          });
          
          currentParchmentIndex.value = 1;
          contentOpacity.value = 0;
        } 
        else if (scrollPosition.value >= PARCHMENT_FINAL_POS && scrollPosition.value <= PARCHMENT_REVEAL_END) {
          gsap.to(parchmentContainer, {
            opacity: 1,
            x: '-50%',
            y: '-50%',
            scale: 1,
            rotation: 0,
            duration: 0.1,
            ease: "none"
          });
          
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
        else if (scrollPosition.value >= EXIT_START && scrollPosition.value <= EXIT_END) {
          const exitProgress = Math.max(0, Math.min(1, (scrollPosition.value - EXIT_START) / 
                                         (EXIT_END - EXIT_START)));
          
          gsap.to(parchmentContainer, {
            opacity: 1 - exitProgress,
            duration: 0.1,
            ease: "none"
          });
        }
        else if (scrollPosition.value > EXIT_END) {
          gsap.to(parchmentContainer, {
            opacity: 0,
            duration: 0.1,
            ease: "none"
          });
        }
        else if (scrollPosition.value > PARCHMENT_REVEAL_END) {
          gsap.to(parchmentContainer, {
            opacity: 1,
            x: '-50%',
            y: '-50%',
            scale: 1,
            rotation: 0,
            duration: 0.1,
            ease: "none"
          });
          
          currentParchmentIndex.value = PARCHMENT_STAGES;
          contentOpacity.value = 1;
        } 
        else {
          currentParchmentIndex.value = 1;
          contentOpacity.value = 0;
          gsap.to(parchmentContainer, {
            opacity: 0,
            x: '100%',
            y: '-50%',
            scale: 0.6,
            rotation: 45,
            duration: 0.1,
            ease: "none"
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


onBeforeRouteLeave((to, from, next) => {
  window.scrollTo(0, 0);
  next();
});

const resetAnimations = () => {
  window.scrollTo(0, 0);
  document.documentElement.scrollTop = 0;
  document.body.scrollTop = 0;
  
  scrollPosition.value = 0;
  currentParchmentIndex.value = 1;
  contentOpacity.value = 0;
  lastScrollY = 0;
  isLoading.value = true;
  isManualScrolling.value = false;
  
  document.body.style.overflow = 'hidden';
  
  setTimeout(() => {
    window.scrollTo(0, 0);
    document.documentElement.scrollTop = 0;
    document.body.scrollTop = 0;
  }, 50);
  
  nextTick(() => {
    window.scrollTo(0, 0);
    document.documentElement.scrollTop = 0;
    document.body.scrollTop = 0;
    
    animateOnScroll();
    setTimeout(() => {
      isLoading.value = false;
      document.body.style.overflow = '';
      window.scrollTo(0, 0);
      document.documentElement.scrollTop = 0;
      document.body.scrollTop = 0;
    }, 800);
  });
};

const manualRefresh = () => {
  resetAnimations();
  
  nextTick(() => {
    if (timeline.value) {
      const timelineElement = timeline.value.$el;
      if (timelineElement) {
        timelineElement.style.display = 'none';
        void timelineElement.offsetHeight;
        timelineElement.style.display = '';
      }
    }
    
    animateOnScroll();
  });
};

const handleBeforeUnload = () => {
  sessionStorage.setItem(REFRESH_KEY, 'true');
};

const animateLoadingDots = () => {
  const dots = document.querySelector('.loading-dots');
  if (!dots) return;
  
  let count = 0;
  loadingDotsInterval.value = setInterval(() => {
    if (!dots) {
      clearInterval(loadingDotsInterval.value);
      return;
    }
    count = (count + 1) % 4;
    dots.textContent = '.'.repeat(count);
  }, 500);
};

const handleAssetsLoaded = () => {
  setTimeout(() => {
    isLoading.value = false;
    if (loadingDotsInterval.value) {
      clearInterval(loadingDotsInterval.value);
    }
    document.body.style.overflow = '';
  }, 1500);
};

onMounted(() => {
  window.scrollTo(0, 0);
  document.documentElement.scrollTop = 0;
  document.body.scrollTop = 0;
  
  [50, 100, 200, 500].forEach(delay => {
    setTimeout(() => {
      window.scrollTo(0, 0);
      document.documentElement.scrollTop = 0;
      document.body.scrollTop = 0;
    }, delay);
  });
  
  const wasRefreshed = sessionStorage.getItem(REFRESH_KEY) === 'true';
  
  if (wasRefreshed) {
    sessionStorage.removeItem(REFRESH_KEY);
    manualRefresh();
  } else {
    resetAnimations();
  }
  
  animateLoadingDots();
  const imagesToPreload = [
    swanImage, 
    parchmentImage,
    cloudImage,
    skyBackground
  ];
  
  const preloadPromises = imagesToPreload.map(src => {
    return new Promise((resolve) => {
      const img = new Image();
      img.onload = resolve;
      img.onerror = resolve;
      img.src = src;
    });
  });
  
  Promise.all(preloadPromises).then(() => {
    handleAssetsLoaded();
    [0, 50, 100, 200].forEach(delay => {
      setTimeout(() => {
        window.scrollTo(0, 0);
        document.documentElement.scrollTop = 0;
        document.body.scrollTop = 0;
      }, delay);
    });
  });
  
  window.addEventListener('beforeunload', handleBeforeUnload);
  window.addEventListener('scroll', animateOnScroll);
  animateLoadingDots();
});

onUnmounted(() => {
  window.removeEventListener('scroll', animateOnScroll);
  window.removeEventListener('beforeunload', handleBeforeUnload);
  
  if (loadingDotsInterval.value) {
    clearInterval(loadingDotsInterval.value);
  }
  
  if (snapTimeout) {
    clearTimeout(snapTimeout);
  }
  
  resetInactivityTimer();
  stopAutoScroll();
  
  document.body.style.overflow = '';
});
</script>

<style scoped>

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

/* Loading animation */
@keyframes spinner {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}

.animate-spinner {
  animation: spinner 1s linear infinite;
}

.font-raleway {
  font-family: 'Raleway', sans-serif;
  font-weight: 300;
  letter-spacing: 0.15em;
}
</style>