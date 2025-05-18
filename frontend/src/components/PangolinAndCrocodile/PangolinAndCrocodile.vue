<script setup lang="ts">
import BackButton from '../UniversalComponents/BackButton.vue';
import ScrollProgress from '../UniversalComponents/ScrollProgress.vue';

import {gsap, ScrollTrigger} from "gsap/all";
import {onMounted, onUnmounted, ref} from "vue";
import ScrollArrow from "../UniversalComponents/ScrollArrow.vue";
import HorizontalTimeline from "../PangolinAndCrocodile/components/HorizontalTimeline.vue";
import Background from "../PangolinAndCrocodile/components/Background.vue";
import ImageTextSection from "./components/ImageTextSection.vue";
import Model from "../PangolinAndCrocodile/components/3dModel.vue";
gsap.registerPlugin(ScrollTrigger);

const pangolinTimelineItems = [
  {
    date: '1970s',
    description: 'The First Red Flags',
    details: 'Scientists began raising alarms as pangolin populations in Asia and Africa started to dwindle. The culprits? Intense hunting and shrinking habitats.',
    fact: 'Pangolins are the only mammals on Earth with scales made of keratin—the same stuff as human fingernails!'
  },
  {
    date: '2000',
    description: 'A Step Toward Protection',
    details: 'All eight species of pangolins were added to CITES Appendix II, putting international trade under regulation for the first time.',
    fact: 'Pangolins hold the unfortunate title of the world’s most trafficked mammal.'
  },
  {
    date: '2007',
    description: 'Closing the Loopholes',
    details: 'CITES took it a step further by banning commercial exports of wild-caught Asian pangolins, aiming to cut off the trade at its source.',
    fact: 'A single pangolin can gobble up to 200,000 ants and termites in one day!'
  },
  {
    date: '2016',
    description: 'Full Protection Achieved',
    details: 'In a major conservation win, all pangolin species were moved to CITES Appendix I, banning international trade altogether.',
    fact: 'Pangolins are nocturnal, meaning they come alive when the sun goes down.'
  },
  {
    date: '2017–2019',
    description: 'Seizures Shine a Spotlight',
    details: 'Massive busts of pangolin scale shipments made global headlines, putting a spotlight on just how dire the trafficking crisis had become.',
    fact: 'To defend themselves, pangolins curl up into a tight, scaly ball that’s tough for predators to crack.'
  },
  {
    date: '2020',
    description: 'Pandemic Puts Pangolins in the News',
    details: 'As scientists explored the roots of COVID-19, pangolins became a focus, pushing the world to rethink wildlife trade and conservation.',
    fact: 'There are eight pangolin species in total—four in Asia and four in Africa.'
  },
  {
    date: '2021–Present',
    description: 'A Global Push to Save Them',
    details: 'The fight to save pangolins has gained momentum, with more countries funding anti-poaching teams, investing in research, and cracking down on illegal trade.',
    fact: 'In the wild, pangolins can live up to 20 years—if we give them the chance.'
  }
];
const main = ref();
let ctx: gsap.Context;
const isLoading = ref(true);
const loadingDots = ref(null);
let loadingDotsInterval: number | null = null;
onMounted(() => {
  document.body.style.overflow = 'hidden';
  animateLoadingDots();

  const imagesToPreload = [
    './assets/Pangolin.mov',
  ];

  const preloadPromises = imagesToPreload.map(src => {
    return new Promise<void>((resolve) => {
      const img = new Image();
      img.onload = () => resolve();
      img.onerror = () => resolve();
      img.src = src;
    });
  });

  Promise.all(preloadPromises).then(handleAssetsLoaded);
  ctx = gsap.context(() => {

    const mainTimeline = gsap.timeline({
      scrollTrigger: {
        trigger: '.header',
        start: "top 80%",
        end: "bottom centre",
        scrub: 4,
      }
    })
    mainTimeline.fromTo(
        ".header",
        {
          xPercent: 0,
          scale: 1,
          filter: "blur(0px) brightness(1)",
          opacity: 1,
        },
        {
          xPercent: 100,
          scale: 0.8,
          filter: "blur(8px) brightness(1.2)",
          opacity: 0.4,
          scrollTrigger: {
            trigger: ".header",
            pin: true,
            start: "top top",
            end: "+=1000",
            scrub: 2,
            anticipatePin: 1,
          },
          ease: "power3.inOut",
        }
    );
  }, main.value);
});

onUnmounted(() => {
  if (loadingDotsInterval) clearInterval(loadingDotsInterval);
  document.body.style.overflow = '';
  ctx.revert();
});
const animateLoadingDots = () => {
  if (!loadingDots.value) return;

  const dotPatterns = ['.', '..', '...', '.', '..', '...'];
  let currentIndex = 0;

  loadingDotsInterval = setInterval(() => {
    loadingDots.value.textContent = dotPatterns[currentIndex];
    currentIndex = (currentIndex + 1) % dotPatterns.length;
  }, 400);
};

const handleAssetsLoaded = () => {
  setTimeout(() => {
    isLoading.value = false;
    if (loadingDotsInterval) clearInterval(loadingDotsInterval);
    document.body.style.overflow = '';
  }, 1500);
};
</script>

<template>
  <!-- <section class="section">
      <Model />
  </section> -->
  <!-- Loading overlay -->
<div 
  ref="loaderOverlay"
  class="fixed inset-0 z-50 flex items-center justify-center bg-[#111111] transition-opacity duration-1000"
  :class="{ 'opacity-0 pointer-events-none': !isLoading }"
>
  <div class="flex flex-col items-center">
    <div class="relative w-16 h-16 mb-5">
      <div class="absolute inset-0 border-2 border-white/10 rounded-full"></div>
      <div class="absolute inset-0 border-2 border-transparent border-t-white rounded-full animate-spinner"></div>
    </div>
    <p class="text-white text-base font-raleway uppercase tracking-widest">Loading<span ref="loadingDots">.</span></p>
  </div>
</div>
  <BackButton />
  <ScrollProgress :totalSections="4" />
  <div id="smooth-content">
    <header class="header h-screen flex flex-col justify-center items-center text-center p-8 relative">
      <video autoplay muted loop playsinline class="background-video w-full h-full object-cover absolute top-0 left-0">
        <source src="./assets/Pangolin.mov" type="video/mp4"/>
        Your browser does not support the video tag.
      </video>
      
      <!-- Gradient overlay similar to card styling -->
      <div class="header-overlay absolute top-0 left-0 w-full h-full"></div>
      
      <div class="behind-video absolute top-0 left-0 w-full h-full bg-black z-[-1]">
        <h2 class="text-white text-6xl font-bold opacity-0" id="backgroundTitle">
          Wildlife in Focus
        </h2>
      </div>
      
      <!-- Header content with card-like styling -->
      <div class="header-content relative z-10 w-full max-w-4xl bg-white/40 rounded-xl shadow-2xl p-12 backdrop-blur-md transform transition-all duration-500">
        <h1 class="styled-heading text-5xl md:text-6xl font-bold mb-8">Pangolin and Crocodile Gallery</h1>
        <p class="text-xl text-gray-600 leading-relaxed mb-8">Explore the extraordinary world of these unique reptiles and mammals, their habitats, behaviors, and conservation challenges.</p>
        <div style="margin-top: 100px;">
          <ScrollArrow />
        </div>
      </div>
    </header>
    <div>
      <HorizontalTimeline :events="pangolinTimelineItems"/>
      <Background/>
      <div>
          <ImageTextSection/>
      </div>
    </div>
  </div>
</template>

<style scoped>
#smooth-content {
  background: linear-gradient(to bottom, #f8f9fa, #e9ecef);
  min-height: 100vh;
}
.background-video {
z-index: 0;
}
.font-raleway {
  font-family: 'Raleway', sans-serif;
  font-weight: 300;
  letter-spacing: 0.15em;
}
.section {
  min-height: 100vh;
  width: 100%;
  position: relative;
  opacity: 0.8;
  transition: opacity 0.5s ease;
}
.header {
overflow: hidden;
position: relative;
}

.header-overlay {
background: 
  radial-gradient(circle at 20% 30%, rgba(255,215,0,0.15) 0%, transparent 50%),
  radial-gradient(circle at 80% 70%, rgba(46,125,50,0.15) 0%, transparent 50%);
z-index: 1;
}

.header-content {
box-shadow: 0 10px 30px rgba(0,0,0,0.15), 0 1px 8px rgba(0,0,0,0.08);
background: linear-gradient(135deg, rgba(255,255,255,0.4), rgba(255,255,255,0.3));
border: 1px solid rgba(255,255,255,0.3);
}

.styled-heading {
background: linear-gradient(45deg, #2a3f5f, #2e7d32);
-webkit-background-clip: text;
background-clip: text;
color: transparent;
font-weight: 700;
letter-spacing: -0.5px;
position: relative;
}

.styled-heading::after {
content: '';
position: absolute;
bottom: -5px;
left: 0;
width: 100%;
height: 3px;
background: linear-gradient(45deg, #2a3f5f, #2e7d32);
transform: scaleX(1);
transform-origin: left;
transition: transform 0.5s ease;
}

/* Animation for the header content */
@keyframes float {
0%, 100% { transform: translateY(0); }
50% { transform: translateY(-10px); }
}
@keyframes spinner {
  to { transform: rotate(360deg); }
}
.animate-spinner {
  animation: spinner 1s linear infinite;
}
</style>