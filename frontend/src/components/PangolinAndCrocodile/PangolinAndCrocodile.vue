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
    // const tl=gsap.timeline();
    // tl.from(".PangoChowing",{xPercent:-100}).from("PangoGettingCarried",{xPercent:100}).from("PangoCrocInspiration",{yPercent:-100})
    // ScrollTrigger.create({
    //   animation:tl,
    //   trigger:".container",
    //   start:"top top",
    //   end: "+=4000",
    //   scrub: true,
    //   pin:true,
    //   anticipatePin:1
    // })

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
      <header class="header h-screen flex flex-col justify-center items-center text-center p-8">
        <video autoplay muted loop playsinline class="background-video">

          <source src="./assets/Pangolin.mov" type="video/mp4"/>
          Your browser does not support the video tag.
        </video>
        <div class="behind-video">

          <h2 class="text-white text-6xl font-bold opacity-0" id="backgroundTitle">
            Wildlife in Focus
          </h2>
        </div>
        <div class="header-content">
          <h1 class="text-5xl font-bold text-amber-100 mb-4 drop-shadow-lg">Pangolin and Crocodile Gallery</h1>
          <ScrollArrow />
        </div>
      </header>
<!--      <div class="relative w-screen h-screen container">-->
<!--        <div class="absolute inset-0">-->
<!--          <img :src="PangoCrocInspiration" alt="Pangolin Eating" class="absolute inset-0 w-full h-full object-cover" />-->
<!--        </div>-->
<!--        <div class="absolute inset-0">-->
<!--          <img :src="PangoCrocInspiration" alt="Pangolin and Crocodile" class="absolute inset-0 w-full h-full object-cover" />-->
<!--        </div>-->
<!--        <div class="absolute inset-0">-->
<!--          <img :src="PangoGettingCarried" alt="Pangolin Being Carried" class="absolute inset-0 w-full h-full object-cover" />-->
<!--        </div>-->
<!--      </div>-->
      <div>
        <Background/>
        <HorizontalTimeline :events="pangolinTimelineItems"/>
        <div style="border: 5px solid blue;">
          <ImageTextSection/>
        </div>
      </div>
    </div>
</template>

<style scoped>
.background-video {
  z-index: 0;
  position: absolute;
  object-fit: cover;
}

.header-content {
  position: relative;
  z-index: 1;
  text-align: center;
}

.behind-video {
  position: absolute;
  object-fit: cover;
  width: 100%;
  height: 100%;
  z-index: -1;
  background-color: #000;
}
</style>