<!-- RopeAnimation.vue -->
<template>
  <div class="rope-container" ref="container">

    <div class="title" ref="title">
      The Life of Shaka
    </div>

    <div
      class="fixed bottom-12 left-1/2 -translate-x-1/2 text-[#1F2937] flex flex-col items-center gap-3 transition-opacity duration-500 scrollIndicator"
      ref="scrollIndicator"
    >
      <span
        class="text-sm font-light tracking-[0.25em] uppercase font-['Raleway']"
        >Scroll to explore</span
      >
      <svg
        class="w-5 h-5 animate-bounce opacity-90"
        fill="none"
        stroke="currentColor"
        viewBox="0 0 24 24"
      >
        <path
          stroke-linecap="round"
          stroke-linejoin="round"
          stroke-width="1"
          d="M19 13l-7 7-7-7"
        ></path>
      </svg>
    </div>

    <div 
      v-for="(rope, i) in ropes" 
      :key="i" class="rope" 
      :class="rope.direction"
      :style="{ top: `${ i }%` , width:'2250px'}"
    />
    <div 
      v-for="(rope, i) in ropes" 
      :key="i" class="rope" 
      :class="rope.direction"
      :style="{ top: `${10 + i }%`, width:'2100px' }"
    />
    <div 
      v-for="(rope, i) in ropes" 
      :key="i" class="rope" 
      :class="rope.direction"
      :style="{ top: `${25 + i }%`, width:'2050px' }"
    />
    <div 
      v-for="(rope, i) in ropes" 
      :key="i" class="rope" 
      :class="rope.direction"
      :style="{ top: `${35 + i * 2}%`, width:'2000px' }"
    />
    <div 
      v-for="(rope, i) in ropes" 
      :key="i" class="rope" 
      :class="rope.direction"
      :style="{ top: `${45 + i * 2}%` , width:'1950px'}"
    />
    <div 
      v-for="(rope, i) in ropes" 
      :key="i" class="rope" 
      :class="rope.direction"
      :style="{ top: `${40 + i}%`, width:'2000px' }"
    />
    <div 
      v-for="(rope, i) in ropes" 
      :key="i" class="rope" 
      :class="rope.direction"
      :style="{ top: `${60 + i}%`, width:'2050px' }"
    />
    <div 
      v-for="(rope, i) in ropes" 
      :key="i" class="rope" 
      :class="rope.direction"
      :style="{ top: `${70 + i}%`, width:'2100px' }"
    />
    <div 
      v-for="(rope, i) in ropes" 
      :key="i" class="rope" 
      :class="rope.direction"
      :style="{ top: `${80 + i}%`, width:'2250px' }"
    />
  </div>
</template>

<script setup>
import { onMounted, ref } from 'vue'
import { gsap } from 'gsap'
import { ScrollTrigger } from 'gsap/ScrollTrigger'

gsap.registerPlugin(ScrollTrigger)

const container = ref(null)

const ropes = [
  { direction: 'left-to-right' },
  { direction: 'right-to-left' },
  { direction: 'left-to-right' },
  { direction: 'right-to-left' },
  { direction: 'left-to-right' },
  { direction: 'right-to-left' },
  { direction: 'left-to-right' },
  { direction: 'right-to-left' },
  { direction: 'left-to-right' },
  { direction: 'right-to-left' },
  { direction: 'left-to-right' },
  { direction: 'right-to-left' },
  { direction: 'left-to-right' },
  { direction: 'right-to-left' },
  { direction: 'left-to-right' },
  { direction: 'right-to-left' },
  { direction: 'left-to-right' },
  { direction: 'right-to-left' },
  { direction: 'left-to-right' },
  { direction: 'right-to-left' },
  { direction: 'left-to-right' },
  { direction: 'right-to-left' },
  { direction: 'left-to-right' },
  { direction: 'right-to-left' },
  // Add more ropes as needed
]

onMounted(() => {
  const ropeEls = container.value.querySelectorAll('.rope')
  const title = container.value.querySelector('.title');
  const scrollIndicator = container.value.querySelector('.scrollIndicator');


  ropeEls.forEach((rope, index) => {
    const isLeftToRight = rope.classList.contains('left-to-right')
    const xFrom = isLeftToRight ? '-600%' : '600%'
    const xTo = isLeftToRight ? '600%' : '-600%'

    gsap.fromTo(
      rope,
      { x: xFrom },
      {
        x: xTo,
        scrollTrigger: {
          trigger: container.value,
          start: 'top bottom',
          end: 'bottom top',
          scrub: 1,
        },
        duration: 2,
        ease: 'none',
        delay: index * 0.2,
      }
    )
  })

  ScrollTrigger.create({
    trigger: container.value,
    start: 'top top',
    end: 'bottom top',
    scrub: true,
    onUpdate: (self) => {
      const opacity = 1 - self.progress * 4; // Adjust the multiplier (4) to control fade speed
      gsap.to(title, { opacity: Math.max(0, Math.min(1, opacity)), duration: 0.1, overwrite: true });
      gsap.to(scrollIndicator, { opacity: Math.max(0, Math.min(1, opacity)), duration: 0.1, overwrite: true });
    },
  });

  // Pin the container while ropes animate
  ScrollTrigger.create({
    trigger: container.value,
    start: 'top top',
    end: '+=50%', // Adjust this value to control how long the container stays pinned
    pin: true, // Pin the entire container
    scrub: true,
  })
})
</script>

<style scoped>
.rope-container {
  position: relative;
  width: 100%;
  height: 100vh;
  overflow: hidden;
  pointer-events: none;
  display: flex;
  flex-direction: column;
  justify-content: space-evenly;
  background-color:#F9F5F2;
}

.title{
  display:flex;
  justify-content: center;
  align-items: center;
  width:100vw;
  height: 100vh;
  font-size: 10rem;
  color:#4E513E;
  opacity: 1; /* Ensure the title starts fully visible */
  transition: opacity 0.5s ease;
}

.rope {
  position: absolute;
  /* top: 50%; */
  height: 2px;
  background: #99724B;
  opacity:50%;
  width: 500px;
  transform: translateY(-50%);
  margin: 0 auto;
}

.left-to-right {
  left: -125%;
}

.right-to-left {
  right: -125%;
}

</style>
