<script setup lang="ts">
import PangolinAndCrocodileNoBackground from "../assets/PangolinAndCrocodile.png";
import PangolinAndCrocodile from "../assets/PangolinAndCrocodile.png";
import PangolinAndCrocodileBottomView from "../assets/PangolinAndCrocodileBottomView.png";
import PangolinAndCrocodileBottomZoomedOut from "../assets/PangolinAndCrocodileBottomZoomedOutView.png";
import PangolinAndCrocodileLeftView from "../assets/PangolinAndCrocodileLeftView.png";
import PangolinAndCrocodileRightView from "../assets/PangolinAndCrocodileRightView.png";

import {gsap, ScrollTrigger} from "gsap/all";
import {onMounted, onUnmounted, ref} from "vue";

gsap.registerPlugin(ScrollTrigger);
const images = [
  {src: PangolinAndCrocodileNoBackground, alt: "Pangolin and Crocodile", title: "The Encounter", description: "This unique sculpture captures the moment of interaction between a pangolin and crocodile, symbolizing the delicate balance of nature."},
  {src: PangolinAndCrocodileBottomView, alt: "Bottom View", title: "The Foundation", description: "From below, we can observe the detailed craftsmanship of the sculpture's base, revealing the artist's attention to the complete form."},
  {src: PangolinAndCrocodileLeftView, alt: "Left View", title: "The Pangolin's Perspective", description: "This angle highlights the pangolin's defensive posture, showcasing its intricate scales and unique anatomy."},
  {src: PangolinAndCrocodileRightView, alt: "Right View", title: "The Crocodile's Domain", description: "From this side, the crocodile's powerful form dominates the composition, emphasizing its predatory nature."},
  {src: PangolinAndCrocodileBottomZoomedOut, alt: "Wide View", title: "The Complete Story", description: "The full composition reveals the narrative tension between these two species and their shared environment."}
];
const main = ref();
let ctx: gsap.Context;

onMounted(() => {
  ctx = gsap.context(() => {
    const cardContainers = gsap.utils.toArray('.card-container') as HTMLElement[];
    
    // Set initial states - all cards start invisible and transformed
    gsap.set(cardContainers, { 
      autoAlpha: 0,
      scale: 0.8,
      rotation: index => index % 2 === 0 ? -5 : 5
    });
    
    // Create animations for each card
    cardContainers.forEach((card, index) => {
      const cardInner = card.querySelector('.card-inner');
      const cardImage = card.querySelector('.card-image');
      const cardContent = card.querySelector('.card-content');
      if (!cardContent) return;
      const cardTitle = cardContent.querySelector('h2');
      const cardDescription = cardContent.querySelector('p');
      
      // Set initial states for inner elements with staggered positions
      gsap.set(cardInner, { 
        y: 100,
        opacity: 0,
        scale: 0.9,
        rotation: index % 2 === 0 ? -10 : 10
      });
      
      gsap.set(cardImage, { 
        x: index % 2 === 0 ? -100 : 100,
        opacity: 0,
        scale: 0.8,
        rotation: index % 2 === 0 ? -15 : 15
      });
      
      gsap.set(cardTitle, { 
        y: 50,
        opacity: 0,
        scale: 0.8
      });
      
      gsap.set(cardDescription, { 
        y: 30,
        opacity: 0,
        scale: 0.9
      });
      
      // Create entrance timeline with enhanced effects
      const tl = gsap.timeline({
        scrollTrigger: {
          trigger: card,
          start: "top 80%",
          end: "bottom 20%",
          toggleActions: "play none none reverse",
          markers: false,
          onEnter: () => {
            gsap.to(card, { 
              autoAlpha: 1,
              scale: 1,
              rotation: 0,
              duration: 0.8,
              ease: "power3.out"
            });
          },
          onLeaveBack: () => {
            gsap.to(card, { 
              autoAlpha: 0,
              scale: 0.8,
              rotation: index % 2 === 0 ? -5 : 5,
              duration: 0.5
            });
          }
        }
      });
      
      // Enhanced animation sequence
      tl.to(cardInner, {
        y: 0,
        opacity: 1,
        scale: 1,
        rotation: 0,
        duration: 1,
        ease: "back.out(1.7)"
      })
      .to(cardImage, {
        x: 0,
        opacity: 1,
        scale: 1,
        rotation: 0,
        duration: 0.8,
        ease: "back.out(1.7)"
      }, "-=0.6")
      .to(cardTitle, {
        y: 0,
        opacity: 1,
        scale: 1,
        duration: 0.6,
        ease: "power2.out"
      }, "-=0.4")
      .to(cardDescription, {
        y: 0,
        opacity: 1,
        scale: 1,
        duration: 0.6,
        ease: "power2.out"
      }, "-=0.3");

      // Add hover effect
      card.addEventListener('mouseenter', () => {
        gsap.to(cardInner, {
          scale: 1.02,
          rotation: index % 2 === 0 ? 2 : -2,
          duration: 0.3,
          ease: "power2.out"
        });
      });

      card.addEventListener('mouseleave', () => {
        gsap.to(cardInner, {
          scale: 1,
          rotation: 0,
          duration: 0.3,
          ease: "power2.out"
        });
      });
    });
    
    // Create page intro animation
    const introTl = gsap.timeline();
    introTl.fromTo(cardContainers[0], 
      { autoAlpha: 0 },
      { autoAlpha: 1, duration: 0.5 }
    );
    
    // Animate first card specially for page load
    const firstCard = cardContainers[0];
    const firstCardInner = firstCard.querySelector('.card-inner');
    const firstCardImage = firstCard.querySelector('.card-image');
    const firstCardContent = firstCard.querySelector('.card-content');
    if (!firstCardContent) return;
    const firstCardTitle = firstCardContent.querySelector('h2');
    const firstCardDescription = firstCardContent.querySelector('p');
    
    introTl
      .fromTo(firstCardInner, 
        { y: 100, opacity: 0, scale: 0.9 },
        { y: 0, opacity: 1, scale: 1, duration: 1.2, ease: "power3.out" },
        "-=0.3"
      )
      .fromTo(firstCardImage, 
        { x: -50, opacity: 0, scale: 0.8, rotation: -10 },
        { x: 0, opacity: 1, scale: 1, rotation: 0, duration: 0.8, ease: "back.out(1.7)" },
        "-=0.8"
      )
      .fromTo(firstCardTitle, 
        { y: 30, opacity: 0 },
        { y: 0, opacity: 1, duration: 0.6, ease: "power2.out" },
        "-=0.4"
      )
      .fromTo(firstCardDescription, 
        { y: 20, opacity: 0 },
        { y: 0, opacity: 1, duration: 0.6, ease: "power2.out" },
        "-=0.3"
      );
  }, main.value);
});

onUnmounted(() => {
  // Clean up all GSAP animations when component is unmounted
  ctx.revert();
});
</script>

<template>
  <div ref="main" class="main-container">
    <section 
      v-for="(image, index) in images" 
      :key="index" 
      class="card-container h-screen w-screen flex items-center justify-center relative"
    >
      <div class="card-inner w-full h-full flex flex-col md:flex-row items-center p-8 bg-white bg-opacity-90 rounded-xl shadow-2xl"
           :class="{'md:flex-row-reverse': index % 2 !== 0}">
        <div class="card-image-container md:w-1/2 flex justify-center items-center p-4">
          <img
            :src="image.src"
            :alt="image.alt"
            :class="['card-image', 'rounded-xl', 'max-h-[80vh]', 'object-contain', 'transition-all', 'duration-500']"
          />
        </div>
        <div class="card-content md:w-1/2 p-8 flex flex-col justify-center">
          <h2 class="text-4xl md:text-5xl font-bold text-gray-800 mb-6">{{ image.title }}</h2>
          <p class="text-xl text-gray-600 leading-relaxed">{{ image.description }}</p>
        </div>
      </div>
    </section>
  </div>
</template>

<style scoped>
.main-container {
  position: relative;
  width: 100%;
  height: 100%;
  background-color: #f8f5f0;
  overflow-x: hidden;
}

.card-container {
  position: relative;
  width: 100vw;
  height: 100vh;
  background-size: cover;
  background-position: center;
  opacity: 0;
}

.card-inner {
  width: 100%;
  height: 100%;
  backdrop-filter: blur(8px);
  transition: transform 0.5s ease;
  box-shadow: 0 10px 30px rgba(0,0,0,0.1), 0 1px 8px rgba(0,0,0,0.05);
  background: linear-gradient(135deg, rgba(255,255,255,0.95), rgba(255,255,255,0.8));
  border: 1px solid rgba(255,255,255,0.3);
}

.card-image {
  filter: drop-shadow(0 10px 15px rgba(0,0,0,0.2));
  max-width: 100%;
  height: auto;
  will-change: transform;
}

.card-content {
  position: relative;
  z-index: 2;
}

.card-content h2 {
  background: linear-gradient(45deg, #2a3f5f, #2e7d32);
  -webkit-background-clip: text;
  background-clip: text;
  color: transparent;
  font-weight: 700;
  letter-spacing: -0.5px;
}

.card-content p {
  text-shadow: 0 1px 2px rgba(255,255,255,0.8);
}

/* Particle effects for enhanced visual experience */
@keyframes float {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(-10px); }
}

.card-container:before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: 
    radial-gradient(circle at 20% 30%, rgba(255,215,0,0.05) 0%, transparent 40%),
    radial-gradient(circle at 80% 70%, rgba(46,125,50,0.05) 0%, transparent 40%);
  z-index: -1;
}
</style>