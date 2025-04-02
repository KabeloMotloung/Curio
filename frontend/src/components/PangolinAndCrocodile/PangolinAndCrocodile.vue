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

    imgs.forEach((img, index) => {
      const text = texts[index];

      if (text) {
        const tl = gsap.timeline({
          scrollTrigger: {
            trigger: img,
            start: "top 85%",
            end: "top 30%",
            scrub: true
          }
        });
        tl.to('.SpinPango', {
          rotation: 360,
          duration: 1,
          ease: "circ.out",
          scrollTrigger: {
            trigger: '.SpinPango',
            scrub: true
          }
        });
        tl.from(img, {
          opacity: 0,
          scale: 0.8,
          x: index % 2 === 0 ? -200 : 200, // Alternate image slide directions
          rotation: -10,
          duration: 1.5,
          ease: "slow(0.7,0.7,false)"
        })
            .to(img, { rotation: 0, ease: "slow(0.7,0.7,false)", duration: 1.2 }, "-=1")
            .from(text, {
              opacity: 0,
              x: index % 2 !== 0 ? -150 : 150, // Alternate text slide direction
              duration: 1.5,
              ease: "slow(0.7,0.7,false)"
            }, "-=1") // Start text animation slightly earlier
            .to(text, { y: -20, duration: 1, ease: "slow(0.7,0.7,false)" }, "-=0.5");
      }
    });
  }, main.value);
});

onUnmounted(() => {
  ctx.revert();
});

</script>

<template>
  <div class="bg-gray-200  h-full w-full ">
    <div id="smooth-content">
      <header class="h-screen flex flex-col justify-center items-center text-center p-8">
        <h1 class="text-5xl font-bold text-gray-800 mb-4">Pangolin and Crocodile Gallery</h1>
        <p class="text-xl text-gray-600">Scroll down to explore the collection</p>
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

</style>