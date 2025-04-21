<template>
    <div class="toolbox fixed bottom-0 w-full flex justify-center space-x-6 p-4 bg-white shadow-xl">
      <div ref="sculptTool" class="tool">🗿</div>
      <div ref="paintTool" class="tool">🎨</div>
      <div class="tool">🧱</div>
    </div>
  </template>
  
  <script setup>
  import gsap from 'gsap'
  import ScrollTrigger from 'gsap/ScrollTrigger'
  import { onMounted, ref } from 'vue'
  
  gsap.registerPlugin(ScrollTrigger)
  
  const sculptTool = ref()
  const paintTool = ref()
  
  onMounted(() => {
    gsap.fromTo(sculptTool.value, { y: -10 }, {
      y: 0,
      scrollTrigger: {
        trigger: sculptTool.value,
        scrub: true,
        start: "top bottom",
        end: "center center",
      }
    })
  
    gsap.fromTo(paintTool.value, { y: 50 }, {
      y: 0,
      scrollTrigger: {
        trigger: paintTool.value,
        scrub: true,
        start: "top center",
        end: "center center",
      }
    })
  })
  </script>
  
  <style scoped>
  .tool {
    font-size: 2rem;
    transform: translateY(0);
    transition: transform 0.3s ease;
  }
  </style>
  