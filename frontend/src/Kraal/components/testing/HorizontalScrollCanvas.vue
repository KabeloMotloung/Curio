<template>
    <div ref="scrollWrapper" class="horizontal-scroll h-screen flex">
      <section class="panel w-screen flex-shrink-0 bg-white flex items-center justify-center">
        <div class="canvas-block" ref="firstCanvas">Canvas 1</div>
      </section>
      <section class="panel w-screen flex-shrink-0 bg-gray-200 flex items-center justify-center">
        <div class="canvas-block" ref="secondCanvas">Canvas 2</div>
      </section>
    </div>
  </template>
  
  <script setup>
  import gsap from 'gsap'
  import ScrollTrigger from 'gsap/ScrollTrigger'
  import { onMounted, ref } from 'vue'
  
  gsap.registerPlugin(ScrollTrigger)
  
  const scrollWrapper = ref()
  const firstCanvas = ref()
  const secondCanvas = ref()
  
  onMounted(() => {
    gsap.to(scrollWrapper.value, {
      xPercent: -100,
      ease: "none",
      scrollTrigger: {
        trigger: scrollWrapper.value,
        pin: true,
        scrub: 1,
        end: () => `+=${scrollWrapper.value.offsetWidth}`,
      }
    })
  
    // Animate canvas blocks
    gsap.fromTo(firstCanvas.value, { y: 0 }, {
      y: 200,
      scrollTrigger: {
        trigger: scrollWrapper.value,
        scrub: true,
        start: 'top top',
        end: 'bottom bottom'
      }
    })
  
    gsap.fromTo(secondCanvas.value, { y: -200 }, {
      y: 0,
      scrollTrigger: {
        trigger: scrollWrapper.value,
        scrub: true,
        start: 'top top',
        end: 'bottom bottom',
        onEnter: () => {
          // Trigger canvas popup and painting
          console.log("Canvas Centered: Let's paint something.")
        }
      }
    })
  })
  </script>
  
  <style scoped>
  .panel {
    height: 100vh;
  }
  .canvas-block {
    width: 300px;
    height: 300px;
    background: #ccc;
    border-radius: 10px;
  }
  </style>
  