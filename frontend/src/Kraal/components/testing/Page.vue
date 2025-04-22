<template>
    <div class="scroll-wrapper">
      <!-- Horizontal scroller inside a pinned section -->
      <div ref="horizontalSection" class="horizontal-section">
        <div class="horizontal-inner" ref="inner">
          <section class="panel" style="background-color: #e74c3c;">Section 1</section>
          <section class="panel" style="background-color: #2ecc71;">Section 2</section>
          <section class="panel" style="background-color: #3498db;">Section 3</section>
          <section class="panel" style="background-color: #f39c12;">Section 4</section>
        </div>
      </div>
  
      <!-- Your fixed spinning badge -->
      <ArtistsBag ref="spinBadge" />

    </div>
  </template>
  
  <script setup>
    

  import { onMounted, ref } from 'vue'
  import { gsap } from 'gsap'
  import { ScrollTrigger } from 'gsap/ScrollTrigger'

  import ArtistsBag from './ArtistsBag.vue'

  gsap.registerPlugin(ScrollTrigger)
  
  const horizontalSection = ref(null)
  const inner = ref(null)
    
  const spinBadge = ref(null)

  
  onMounted(() => {
  const panels = inner.value.children
  const totalPanels = panels.length

  gsap.to(inner.value, {
    xPercent: -100 * (totalPanels - 1),
    ease: 'none',
    scrollTrigger: {
      trigger: horizontalSection.value,
      start: 'top top',
      end: () => `+=${inner.value.scrollWidth}`,
      scrub: true,
      pin: true,
      anticipatePin: 1,
    },
  })

  // 💡 Now access the exposed ref inside ArtistsBag:
  gsap.to(spinBadge.value.badge, {
    rotation: 360,
    scrollTrigger: {
      trigger: horizontalSection.value,
      start: 'top top',
      end: () => `+=${inner.value.scrollWidth}`,
      scrub: true,
    },
    ease: 'none',
  })
})

  </script>
  
  <style scoped>
  .scroll-wrapper {
    width: 100%;
    overflow-x: hidden;
  }
  
  .horizontal-section {
    height: 100vh;
    width: 100%;
    position: relative;
    overflow: hidden;
  }
  
  .horizontal-inner {
    display: flex;
    height: 100vh;
  }
  
  .panel {
    min-width: 100vw;
    height: 100vh;
    width:100vw;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 4rem;
    color: white;
  }
  </style>
  