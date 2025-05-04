<template>
  <div class="sidwane-container">
    <BackButton />
    <ScrollProgress :totalSections="5" />
    
    <section class="section">
      <LandingPage />
    </section>

    <section class="section">
      <TimelineScroll :events="timelineEvents" />
    </section >

    <!-- <section class="section">
      <BackgroundInformation />
    </section> -->
    
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
import TimelineScroll from './components/HorizontalTimeline.vue';

gsap.registerPlugin(ScrollTrigger);

// Timeline events for Sidwane Tokozile sculpture and Anton van Wouw
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
