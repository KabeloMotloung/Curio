<script setup>
import { onMounted, onBeforeUnmount, ref } from 'vue'
import { gsap } from 'gsap'
import { ScrollTrigger } from 'gsap/ScrollTrigger'
import imgUrl from '../../assets/LandingPage/ImageOfMuseum.jpeg'
import TheDiscoveryCard from '../Cards/TheDiscoveryCard.vue'
import TheSwanCard from '../Cards/TheSwanCard.vue'
import PangolinAndCrocodileCard from '../Cards/PangolinAndCrocodileCard.vue'
import SpindleWhorlCard from '../Cards/SpindleWhorlCard.vue'
import TheKraalCard from '../Cards/TheKraalCard.vue'

gsap.registerPlugin(ScrollTrigger)

const scrollContainer = ref(null)
const cardContainer = ref(null)
const welcomeMessage = ref(null)
const scrollHint = ref(null)

onMounted(() => {
  const sections = cardContainer.value.querySelectorAll('.card')

  // Fade out welcome message and scroll hint
  gsap.to([welcomeMessage.value, scrollHint.value], {
    opacity: 0,
    scale: 0.95,
    duration: 1,
    ease: 'power2.out',
    scrollTrigger: {
      trigger: scrollContainer.value,
      start: 'top top',
      end: '+=100',
      scrub: true,
    }
  })

  // Fade in cards container
  gsap.fromTo(cardContainer.value, 
    { opacity: 0 }, 
    {
      opacity: 1,
      duration: 1,
      ease: 'power2.out',
      scrollTrigger: {
        trigger: scrollContainer.value,
        start: 'top top',
        end: '+=100',
        scrub: true,
      }
    }
  )

  // Horizontal scroll for cards
  gsap.to(sections, {
    xPercent: -100 * (sections.length - 1),
    ease: 'none',
    scrollTrigger: {
      trigger: scrollContainer.value,
      pin: true,
      scrub: 1,
      start: 'top top',
      end: () => "+=" + scrollContainer.value.offsetWidth,
    }
  })
})

onBeforeUnmount(() => {

  ScrollTrigger.getAll().forEach(trigger => trigger.kill())

  gsap.globalTimeline.clear()
})
</script>


<template>
    <!-- Blurred Background -->
    <div class="background-blur"></div>
  
    <!-- Welcome Message -->
<div class="welcome-message" ref="welcomeMessage">
  <h1>Welcome to the UP Museum</h1>
</div>

<!-- Scroll Hint Message -->
<div class="scroll-hint" ref="scrollHint">
  <p>Scroll to explore</p>
</div>
  
    <!-- Cards Wrapper -->
    <div ref="scrollContainer" class="card-container-wrapper">
      <div ref="cardContainer" class="card-container">
        <TheSwanCard class="card" />
        <PangolinAndCrocodileCard class="card" />
        <SpindleWhorlCard class="card" />
        <TheKraalCard class="card" />
        <TheDiscoveryCard class="card" />
        <!-- Add more as needed -->
      </div>
    </div>
  </template>
  

<style>

.welcome-message {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 2;
  color: white;
  text-align: center;
  font-size: 3rem;
  /* font-weight: bold; */
  pointer-events: none;
  transition: opacity 0.3s ease;
}

.card-container {
  display: flex;
  flex-wrap: nowrap;
  gap: 250px;
  z-index: 1;
  position: relative;
  width: max-content;
  height: 100vh;
  align-items: center;
}

.card {
  min-width: 50vw;
  height: 100vh;
  flex-shrink: 0;
}

body {
  margin: 0;
  height: 100vh;
  overflow-x: hidden;
  overflow-y: auto;
}

.background-blur {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-image: url('../../assets/LandingPage/ImageOfMuseum.jpeg');
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  filter: blur(10px);
  z-index: 0;
}

.scroll-hint {
  position: fixed;
  bottom: 30px;
  width: 100%;
  text-align: center;
  font-size: 1.5rem;
  color: white;
  z-index: 2;
  pointer-events: none;
  transition: opacity 0.3s ease;
}

</style>
