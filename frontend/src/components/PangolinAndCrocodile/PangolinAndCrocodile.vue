<script setup lang="ts">
import PangolinAndCrocodileNoBackground from "./assets/PangolinAndCrocodile.png";
import PangolinAndCrocodile from "./assets/PangolinAndCrocodile.png";
import PangolinAndCrocodileBottomView from "./assets/PangolinAndCrocodileBottomView.png";
import PangolinAndCrocodileBottomZoomedOut from "./assets/PangolinAndCrocodileBottomZoomedOutView.png";
import PangolinAndCrocodileLeftView from "./assets/PangolinAndCrocodileLeftView.png";
import PangolinAndCrocodileRightView from "./assets/PangolinAndCrocodileRightView.png";

import {gsap, ScrollTrigger} from "gsap/all";
import {onMounted, onUnmounted, ref} from "vue";

gsap.registerPlugin(ScrollTrigger);


const images = [
  {src: PangolinAndCrocodileNoBackground, alt: "Pangolin and Crocodile", title: "The Encounter", description: "This unique sculpture captures the moment of interaction between a pangolin and crocodile, symbolizing the delicate balance of nature."},
  {src: PangolinAndCrocodileBottomView, alt: "Bottom View", title: "Bottom View", description: "From below, we can see the intricate details of both creatures, showing the craftsmanship involved in creating this piece."},
  {src: PangolinAndCrocodileBottomZoomedOut, alt: "Bottom Zoomed Out", title: "Panoramic View", description: "Stepping back gives us perspective on the full composition, allowing appreciation of the sculpture's overall form and balance."},
  {src: PangolinAndCrocodileLeftView, alt: "Left View", title: "Left Profile", description: "The left view highlights the pangolin's defensive posture, showcasing its scaled armor that has evolved over millions of years."},
  {src: PangolinAndCrocodileRightView, alt: "Right View", title: "Right Profile", description: "From the right side, the crocodile's powerful form becomes more prominent, illustrating the strength and resilience of this ancient predator."},
  {src: PangolinAndCrocodile, alt: "Full White Background", title: "Complete Composition", description: "The final view presents the entire sculpture in its intended form, a testament to the beauty of wildlife and artistic expression."}
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

    imgs.forEach((img, index) => {
      const text = texts[index];

      const ImgTimeline = gsap.timeline({
        scrollTrigger: {
          trigger: img,
          start: "top 100%",
          end: "top 10%",
          scrub: 2,
        }
      });
      const TextTimeline = gsap.timeline({
        scrollTrigger: {
          trigger: img,
          start: "top 100%",
          end: "top 10%",
          scrub: 2,
        }
      });

      if (img.classList.contains('SpinPango')) {
        gsap.to('.SpinPango', {
          rotation: 360,
          duration: 2,
          repeat: -1,
          repeatDelay: 0.5,
          yoyo: true,
          yoyoEase: true,
          ease: "circ.out",
          scrollTrigger: {
            trigger:'.SpinPango',
            scrub: false,
          }
        });
      }

      ImgTimeline.from(img, {
        opacity: 0,
        scale: 0.8,
        x: index % 2 === 0 ? -200 : 200,
        rotation: -10,
        duration: 1.5,
        ease: "slow(0.7,0.7,false)"
      }).to(img,
          {
            y:-200,
            rotation: 0,
            ease: "slow(0.7,0.7,false)",
            duration: 1.2
          },
          "-=1").to(img, {
            x: index % 2 === 0 ? -1500 : 1500,
            y: -1500,
            opacity: 0,
            filter: "blur(10px)",
            scale: 0.9,
            duration: 3,
            ease: "slow(0.7,0.7,false)"
          });

      TextTimeline.from(text, {
            opacity: 0,
            x: index % 2 !== 0 ? -150 : 150,
            duration: 1.5,
            ease: "slow(0.7,0.7,false)"
          },
          "-=1").to(text,
          {y: -340,
            duration: 1,
            ease: "slow(0.7,0.7,false)"
          }
          , "-=0.5").to(text,{
            x:index % 2 !== 0 ? -1500 : 1500,
            y:-1500,
            opacity: 0,
            filter: "blur(10px)",
            scale: 0.9,
            duration:3,
          ease: "slow(0.7,0.7,false)"
      });
      });

  }, main.value);
});

onUnmounted(() => {
  ctx.revert();
});

</script>

<template>
  <div class="bg-gradient-to-tl from-slate-200 to-slate-50 h-full w-full" style="overflow-x: hidden;">
    <div class="fixed top-8 left-8 z-50">
      <button
          @click="$router.back()"
          class="text-white/40 hover:text-white/80 transition-all duration-300 flex items-center gap-2 group backdrop-blur-sm bg-white/5 px-4 py-2 rounded-lg hover:shadow-[0_0_15px_rgba(255,255,255,0.3)] hover:border hover:border-white/30"
      >
        <svg
            class="w-6 h-6 transform group-hover:-translate-x-1 transition-transform duration-300"
            fill="none"
            stroke="currentColor"
            viewBox="0 0 24 24"
        >
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M15 19l-7-7 7-7" />
        </svg>
        <span class="text-sm font-light tracking-[0.25em] uppercase font-['Raleway'] leading-none">Back</span>
      </button>
    </div>
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
          <p class="text-xl text-amber-200/90 drop-shadow-lg">Scroll to explore</p>
          <p class="arrow text-amber-200/90">|</p>
          <p class="arrow text-amber-200/90">&#8595;</p>
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
      <section v-for="(image, index) in images" :key="index" class="h-screen flex flex-col md:flex-row items-center justify-between px-16 py-8 space-y-8 md:space-y-0" :class="{'md:flex-row-reverse': index % 2 !== 0}">

        <div class="flex-1 flex justify-center">
          <img
              :alt="image.alt"
              :class="['pangolin-image', 'rounded-2xl', 'max-w-full', 'max-h-[60vh]', 'object-contain', index === 0 ? 'SpinPango' : '']"
              :src="image.src"
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
.container{
  overflow: hidden;
}

.arrow {
  padding: 0;
  margin: 0;
  line-height: 0.89;
}

.arrow {
  padding: 0;
  margin: 0;
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