<script setup lang="ts">
import BackButton from '../UniversalComponents/BackButton.vue';
import ScrollProgress from '../UniversalComponents/ScrollProgress.vue';

import {gsap, ScrollTrigger} from "gsap/all";
import {onMounted, onUnmounted, ref} from "vue";
import ScrollArrow from "../UniversalComponents/ScrollArrow.vue";
import HorizontalTimeline from "../PangolinAndCrocodile/components/HorizontalTimeline.vue";
import Background from "../PangolinAndCrocodile/components/Background.vue";
import ImageTextSection from "./components/ImageTextSection.vue";
gsap.registerPlugin(ScrollTrigger);

const pangolinTimelineItems = [
  {
    date: '1970s',
    description: 'Initial Conservation Concerns',
    details: 'Scientists begin documenting declining pangolin populations across Asia and Africa due to hunting and habitat loss.',
    fact: 'Pangolins are the only mammals in the world covered in scales. '
  },
  {
    date: '2000',
    description: 'CITES Protection',
    details: 'All eight pangolin species are listed on CITES Appendix II, regulating international trade of pangolins and their products.',
    fact:'Pangolins are the most illegally traﬃcked mammal in the world.'
  },
  {
    date: '2007',
    description: 'Zero Export Quotas',
    details: 'CITES establishes zero export quotas for wild-caught Asian pangolins traded for commercial purposes.',
    fact:'Pangolins can consume up to 200,000 ants per day'
  },
  {
    date: '2016',
    description: 'CITES Appendix I Listing',
    details: 'All eight pangolin species are transferred to CITES Appendix I, prohibiting all international commercial trade.',
    fact: 'Pangolin are active and feed at night. '
  },
  {
    date: '2017-2019',
    description: 'Record Seizures',
    details: 'Record-breaking seizures of pangolin scales occur globally, highlighting the severity of the illegal wildlife trade.',
    fact:'They have the ability to curl up into a ball to protect themselves from large predators'
  },
  {
    date: '2020',
    description: 'COVID-19 Connection',
    details: 'Increased awareness about pangolins as potential intermediate hosts in zoonotic disease transmission leads to greater conservation focus.',
    fact:'Worldwide, there are eight pangolin species: four species in Asia and four species in Africa.'
  },
  {
    date: '2021-Present',
    description: 'Conservation Intensification',
    details: 'Global efforts to protect remaining pangolin populations intensify with increased funding, research, and anti-poaching initiatives.',
    fact:'Pangolins can live up to 20'
  }
];
const main = ref();
let ctx: gsap.Context;

onMounted(() => {
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
  ctx.revert();
});

</script>

<template>
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
        <ScrollArrow />
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
.background-video {
z-index: 0;
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
</style>