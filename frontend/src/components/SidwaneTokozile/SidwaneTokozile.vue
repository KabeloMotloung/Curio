<template>
  <div class="sidwane-container">
    <BackButton />
    <ScrollProgress :totalSections="4" />
    
    <section class="section">
      <LandingPage />
    </section>
    
    <section class="section">
      <BackgroundInformation />
    </section>
    
    <section class="section">
    </section>
  </div>
</template>

<script setup>
import { onMounted, ref } from 'vue';
import { gsap } from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';

import BackButton from '../UniversalComponents/BackButton.vue';
import ScrollProgress from '../UniversalComponents/ScrollProgress.vue';
import LandingPage from './components/LandingPage.vue';
import BackgroundInformation from './components/BackgroundInformation.vue';

gsap.registerPlugin(ScrollTrigger);

onMounted(() => {
  // Initialize any global animations or ScrollTrigger instances here
  
  // Setup smooth scrolling between sections
  const sections = gsap.utils.toArray('.section');
  
  sections.forEach((section, i) => {
    ScrollTrigger.create({
      trigger: section,
      start: 'top 80%',
      end: 'bottom 20%',
      toggleClass: {targets: section, className: 'active'},
      once: false
    });
  });
});
</script>

<style scoped>
.sidwane-container {
  position: relative;
  width: 100%;
  background-color: #111;
  color: white;
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
  font-family: 'Playfair Display', serif;
}

/* Enhanced transitions */
img {
  transition: transform 0.5s cubic-bezier(0.4, 0, 0.2, 1);
}

img:hover {
  transform: scale(1.05);
}

/* Smooth scroll behavior */
html {
  scroll-behavior: smooth;
}
</style>
