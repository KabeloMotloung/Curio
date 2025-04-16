<script setup lang="ts">
import PangolinAndCrocodileNoBackground from "../../assets/PangolinAndCrocodile/PangolinAndCrocodile.png";
import PangolinAndCrocodileBottomViewWhiteBackground from "../../assets/PangolinAndCrocodile/PangolinAndCrocodileBottomViewWhiteBackground.jpg";
import PangolinAndCrocodileBottomZoomedOutWhiteBackground from "../../assets/PangolinAndCrocodile/PangolinAndCrocodileBottomZoomedOutViewWhiteBackground.jpg";
import PangolinAndCrocodileLeftViewWhiteBackground from "../../assets/PangolinAndCrocodile/PangolinAndCrocodileLeftViewWhiteBackground.jpg";
import PangolinAndCrocodileRightViewWhiteBackground from "../../assets/PangolinAndCrocodile/PangolinAndCrocodileRightViewWhiteBackground.jpg";
import PangolinAndCrocodileWhiteBackground from "../../assets/PangolinAndCrocodile/PangolinAndCrocodileWhiteBackground.jpg";

import { gsap, ScrollTrigger } from "gsap/all";
import { onMounted, onUnmounted, ref } from "vue";

gsap.registerPlugin(ScrollTrigger);


const images = [
  { src: PangolinAndCrocodileNoBackground, alt: "Pangolin and Crocodile", title: "The Encounter", description: "This unique sculpture captures the moment of interaction between a pangolin and crocodile, symbolizing the delicate balance of nature." },
  { src: PangolinAndCrocodileBottomViewWhiteBackground, alt: "Bottom View", title: "Bottom View", description: "From below, we can see the intricate details of both creatures, showing the craftsmanship involved in creating this piece." },
  { src: PangolinAndCrocodileBottomZoomedOutWhiteBackground, alt: "Bottom Zoomed Out", title: "Panoramic View", description: "Stepping back gives us perspective on the full composition, allowing appreciation of the sculpture's overall form and balance." },
  { src: PangolinAndCrocodileLeftViewWhiteBackground, alt: "Left View", title: "Left Profile", description: "The left view highlights the pangolin's defensive posture, showcasing its scaled armor that has evolved over millions of years." },
  { src: PangolinAndCrocodileRightViewWhiteBackground, alt: "Right View", title: "Right Profile", description: "From the right side, the crocodile's powerful form becomes more prominent, illustrating the strength and resilience of this ancient predator." },
  { src: PangolinAndCrocodileWhiteBackground, alt: "Full White Background", title: "Complete Composition", description: "The final view presents the entire sculpture in its intended form, a testament to the beauty of wildlife and artistic expression." }
];

const main = ref();
let ctx: gsap.Context;

onMounted(() => {
  ctx = gsap.context(() => {
    const imgs = gsap.utils.toArray('.pangolin-image');
    const texts = gsap.utils.toArray('.text-content');
    

    gsap.to(".arrow", {
    duration: 1.5,
    y: 20,
    repeat: -1,
    yoyo: true,
    ease: "sine.inOut",
    scrollTrigger: {
        trigger: "#arrow",
        start: "top bottom",
        toggleActions: "play pause play pause",
    }
    });

      const mainTimeline = gsap.timeline({
        scrollTrigger: {
          trigger: '.header',
          markers: true,
          scrub: 4
        }
    });
    mainTimeline.to('.header', {
    xPercent: 100,
    scrollTrigger: {
      trigger: '.header',
      pin: true,
      start: "top top",
      end: "+=2000",
      scrub: 2,
    },
    ease: "none",
    });
    imgs.forEach((img, index) => {
        const text = texts[index];
        if(img.classList.contains('SpinPango')){
          mainTimeline.to('.SpinPango', {
          scrollTrigger: {
            trigger: '.SpinPango',
            scrub: 3,
          },
          rotation: 360,
          duration: 2,
          ease: "circ.out",
        })
        }
        mainTimeline.to(img, {
          xPercent: -30,
          yPercent: -40,
          duration: 3,
          ease: "power1.inOut",
          scrollTrigger: {
            trigger: img,
            scrub: 2,
            start: "top center",
            end: "bottom center"
          }
        })
        .to(text, {
          xPercent: -30,
          yPercent: -40,
          duration: 3,
          ease: "power1.inOut",
          scrollTrigger: {
            trigger: text,
            scrub: 2,
            start: "top center",
            end: "bottom center"
          }
        })
        .to(img, {
          xPercent: -100,
          yPercent: -100,
          duration: 3,
          ease: "power1.inOut",
          scrollTrigger: {
            trigger: img,
            scrub: 2,
            start: "top center",
            end: "bottom center"
          }
        })
        .to(text, {
          xPercent: -100,
          yPercent: -100,
          duration: 3,
          ease: "power1.inOut",
          scrollTrigger: {
            trigger: text,
            scrub: 2,
            start: "top center",
            end: "bottom center"
          }
        });
      }
    )
    
  }, main.value);
});

onUnmounted(() => {
  ctx.revert();
});

</script>

<template>
  <div class="bg-gray-200  h-full w-full " style="overflow-x: hidden;">
    <div id="smooth-content">
      <header class="header h-screen flex flex-col justify-center items-center text-center p-8">
        <video autoplay muted loop playsinline class="background-video">
          <source src="../../assets/Pangolin.mov" type="video/mp4" />
         Your browser does not support the video tag.
      </video>
      <div class="header-content">
        <h1 class="text-5xl font-bold text-gray-800 mb-4">Pangolin and Crocodile Gallery</h1>
        <p class="text-xl text-gray-600">Scroll to explore</p>
        <p class="arrow">|</p>
        <p class="arrow">&#8595;</p>
      </div>
      </header>

      <section v-for="(image, index) in images" :key="index" class="h-screen flex flex-col md:flex-row items-center justify-between px-16 py-8 space-y-8 md:space-y-0" :class="{'md:flex-row-reverse': index % 2 !== 0}">
        <div class="flex-1 flex justify-center">
          <img
              :src="image.src"
              :alt="image.alt"
              :class="['pangolin-image', 'rounded-2xl', 'max-w-full', 'max-h-[60vh]', 'object-contain', index === 0 ? 'SpinPango' : '']"
          />
        </div>
        <div class="text-content flex-1 p-6">
          <h2 class="text-4xl font-semibold text-gray-800 mb-4">{{ image.title }}</h2>
          <p class="text-lg text-gray-600">{{ image.description }}</p>
        </div>
      </section>
    </div>
  </div>
</template>

<style scoped>

  .arrow{
    padding:0;
    margin:0;
    line-height: 0.89;
  }
  .background-video {
  z-index: 0;
  position: absolute;
  object-fit: cover;
}
.header-content {
  position: relative;
  z-index: 1;
  color: white; /* Make text visible over video */
  text-align: center;
  padding-top: 100px;
}
</style>