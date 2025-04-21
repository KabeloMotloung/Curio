<template>
  <div>
    <!-- 🧶 PNG Thread Spool -->
    <img
      ref="spoolImage"
      src="../assets/thread.png"
      alt="Thread Spool"
      class="spool-image"
    />
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { gsap } from 'gsap'
import { ScrollTrigger } from 'gsap/ScrollTrigger'

gsap.registerPlugin(ScrollTrigger)

const spoolImage = ref(null)

onMounted(() => {
  // Animate the thread spool image as the user scrolls
  gsap.to(spoolImage.value, {
    y: '80vh', // Move the image down to the bottom-left corner
    ease: 'none',
    scrollTrigger: {
      trigger: '.panel1', // Start animation in Panel 1
      start: 'top top',
      endTrigger: '.panel3a', // End animation in Panel 3A
      end: 'top top',
      scrub: true,
    },
  })

  // Ensure the thread image is hidden before Panel 1
  ScrollTrigger.create({
    trigger: '.panel1',
    start: 'top bottom', // Image becomes visible when Panel 1 enters the viewport
    onEnter: () => {
      gsap.to(spoolImage.value, { opacity: 1, duration: 0.5 }) // Fade in
    },
    onLeaveBack: () => {
      gsap.to(spoolImage.value, { opacity: 0, duration: 0.5 }) // Fade out
    },
  })

  // Hide the thread image after Panel 3A
  ScrollTrigger.create({
    trigger: '.panel3a',
    start: 'top top',
    onEnter: () => {
      gsap.to(spoolImage.value, { opacity: 0, duration: 0.5 }) // Fade out
    },
    onLeaveBack: () => {
      gsap.to(spoolImage.value, { opacity: 1, duration: 0.5 }) // Fade back in
    },
  })
})
</script>

<style scoped>
/* 🧶 Thread Spool PNG Positioning */
.spool-image {
  position: absolute;
  top: 0;
  left: 20px;
  width: 120px;
  height: auto;
  z-index: 10;
  pointer-events: none;
  opacity: 0; /* Initially hidden */
}
</style>