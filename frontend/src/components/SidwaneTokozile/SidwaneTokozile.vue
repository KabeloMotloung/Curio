<template>
  <div class="sidwane-container">
    <BackButton />
    <ScrollProgress :sections="SECTIONS" />
    
    <section class="section">
      <LandingPage />
    </section>

    <section class="section">
      <TimelineScroll :events="timelineEvents" />
    </section >

    <section class="section">
      <BackgroundInformation />
    </section>

    <section class="section">
      <ImageShowcase />
    </section>

    <section class="section">
      <Model3D />
    </section>

    <section class="section">
      <PageEnd 
        v-if="scrollPosition >= PAGE_END_START"
        nextArtifactTitle="Pangolin and Crocodile"
        nextArtifactPath="/pangolin-and-crocodile"
        bgColor="#111"
        textColor="#ffffff"
        :isVisible="true"
        @resetAnimations="resetAnimations"
      />
    </section>
    
  </div>
</template>

<script setup>
import { onMounted, ref, onUnmounted } from 'vue';
import { onBeforeRouteLeave } from 'vue-router';
import { gsap } from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';

import BackButton from '../UniversalComponents/BackButton.vue';
import ScrollProgress from '../UniversalComponents/ScrollProgress.vue';
import LandingPage from './components/LandingPage.vue';
import BackgroundInformation from './components/BackgroundInformation.vue';
import TimelineScroll from './components/HorizontalTimeline.vue';
import ImageShowcase from './components/ImageShowcase.vue';
import Model3D from './components/3dModel.vue';
import PageEnd from '../UniversalComponents/PageEnd.vue';

gsap.registerPlugin(ScrollTrigger);

const scrollPosition = ref(0);
const PAGE_END_START = 0.98;

// Animation constants for non-timeline sections
const SECTION_TRANSITIONS = {
  landing: { start: 0.0, end: 0.2 },
  backgroundInfo: { start: 0.4, end: 0.6 },
  imageShowcase: { start: 0.6, end: 0.8 },
  model3d: { start: 0.8, end: 0.9 }
};
const SECTIONS = [
  { position: 0.00, name: 'Landing' },
  { position: 0.20, name: 'Timeline Start' },
  { position: 0.50, name: 'Background Info' },
  { position: 0.70, name: 'Image Showcase' },
  { position: 0.85, name: '3D Model' },
  { position: 0.98, name: 'Page End' }
];
const SCROLL_CHECKPOINTS = [
  { position: 0.00, name: 'Landing' },
  { position: 0.20, name: 'Timeline Start' },
  { position: 0.40, name: 'Timeline End' },
  { position: 0.50, name: 'Background Info' },
  { position: 0.70, name: 'Image Showcase' },
  { position: 0.85, name: '3D Model' },
  { position: 0.98, name: 'Page End' }
];

const SCROLL_STEP = 8;
const SCROLL_INTERVAL = 8;
const INACTIVITY_DELAY = 1000;

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

// Store ScrollTrigger instances for cleanup
const scrollTriggers = ref([]);

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

const updateScrollPosition = () => {
  const windowHeight = window.innerHeight;
  const documentHeight = document.documentElement.scrollHeight;
  const scrollTop = window.scrollY;
  
  scrollPosition.value = scrollTop / (documentHeight - windowHeight);
};

const timelineEvents = [
  {
    date: "1862",
    description: "Anton van Wouw's Birth",
    details: "Anton van Wouw was born in Driebergen, Netherlands. He would later become known as the 'father of South African sculpture'.",
    fact: "Van Wouw created both monumental and small-scale bronze sculptures throughout his career."
  },
  {
    date: "Early 1900s",
    description: "Van Wouw's Connection to Boer Nation",
    details: "During his stay in the South African wilderness, van Wouw developed a deep respect for the Boer nation, which significantly influenced his artistic development.",
    fact: "His dedication to the Boer people's tribulations and aspirations was reflected in his sculptures."
  },
  {
    date: "1907",
    description: "Creation of 'Bust of a Zulu'",
    details: "Van Wouw created 'Bust of a Zulu', believed to feature the same model who would later pose for 'Sidwane Tokozile'.",
    fact: "The Bust of a Zulu emanates confidence, showing van Wouw's ability to capture different emotions in his subjects."
  },
  {
    date: "c. 1907",
    description: "'Sidwane Tokozile' (Coffee Drinker)",
    details: "Van Wouw sculpted 'Sidwane Tokozile', depicting a Zulu man with pronounced cheekbones and an angular beard in a slumped position, clasping both hands around a coffee mug.",
    fact: "The sculpture conveys humble resignation, wearing a head cloth and tattered shirt torn on the left side."
  },
  {
    date: "Colonial Era",
    description: "Colonial Context of Van Wouw's Work",
    details: "As a colonial artist, van Wouw often 'romanticized' his subjects, emphasizing white tropes to his primarily white and wealthy audience, reflecting the colonial ideology of the time.",
    fact: "Figures were represented according to how mining barons wanted them to be perceived in line with colonial ideology."
  }
];

onMounted(() => {
  const sections = gsap.utils.toArray('.section');
  
  sections.forEach((section, i) => {
    // Skip the timeline section (index 1) as it has its own ScrollTrigger setup
    if (i === 1) return;
    
    const st = ScrollTrigger.create({
      trigger: section,
      start: 'top 80%',
      end: 'bottom 20%',
      toggleClass: {targets: section, className: 'active'},
      onEnter: () => {
        gsap.to(section, {
          opacity: 1,
          duration: 0.8,
          ease: 'power2.out'
        });
      },
      onLeaveBack: () => {
        gsap.to(section, {
          opacity: 0.8,
          duration: 0.8,
          ease: 'power2.in'
        });
      }
    });
    
    scrollTriggers.value.push(st);
  });

  window.addEventListener('scroll', updateScrollPosition);
  updateScrollPosition();
});

// Cleanup function to be called before route leave
const cleanupAnimations = () => {
  // Kill all ScrollTrigger instances
  scrollTriggers.value.forEach(st => st.kill());
  scrollTriggers.value = [];
  
  // Kill any remaining ScrollTrigger instances
  ScrollTrigger.getAll().forEach(st => st.kill());
  
  // Reset all sections to their initial state
  const sections = gsap.utils.toArray('.section');
  sections.forEach(section => {
    gsap.set(section, { opacity: 0.8 });
  });

  // Reset scroll position to top
  window.scrollTo({
    top: 0,
    behavior: 'instant'
  });
};

// Cleanup before route leave
onBeforeRouteLeave((to, from, next) => {
  cleanupAnimations();
  next();
});

onUnmounted(() => {
  window.removeEventListener('scroll', updateScrollPosition);
  cleanupAnimations();
});

const resetAnimations = () => {
  cleanupAnimations();
};
</script>

<style scoped>
.sidwane-container {
  position: relative;
  width: 100%;
  background-color: #111;
  color: white;
  font-family: 'Raleway', sans-serif;
}

.section {
  min-height: 100vh;
  width: 100%;
  position: relative;
  opacity: 0.8;
  transition: opacity 0.5s ease;
}

.section.active {
  opacity: 1;
}

.font-serif {
  font-family: 'Raleway', sans-serif;
}

img {
  transition: transform 0.5s cubic-bezier(0.4, 0, 0.2, 1);
}

img:hover {
  transform: scale(1.05);
}

html {
  scroll-behavior: smooth;
}
</style>
