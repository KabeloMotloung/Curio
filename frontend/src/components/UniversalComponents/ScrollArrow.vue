<script setup lang="ts">
import { onMounted, onUnmounted, ref } from 'vue'

defineProps({
  textColor: {
    type: String,
    default: 'text-[#1F2937]'
  },
  arrowColor: {
    type: String,
    default: 'text-[#1F2937]'
  }
})

const scrollIndicator = ref(null)

onMounted(() => {
  window.addEventListener('scroll', handleScroll)
  scrollIndicator.value.style.opacity = 1
})

onUnmounted(() => {
  window.removeEventListener('scroll', handleScroll)
})

const handleScroll = () => {
  const scrollY = window.scrollY
  const viewportHeight = window.innerHeight
  const fadeThreshold = viewportHeight * 0.1
  
  if (scrollY <= fadeThreshold) {
    scrollIndicator.value.style.opacity = 1
  } else {
    const opacity = Math.max(0, 1 - ((scrollY - fadeThreshold) / (viewportHeight * 0.1)))
    scrollIndicator.value.style.opacity = opacity
  }
}
</script>

<template>
  <div ref="scrollIndicator" class="fixed bottom-12 left-1/2 -translate-x-1/2 flex flex-col items-center gap-3 transition-opacity duration-500">
    <span :class="`text-sm font-light tracking-[0.25em] uppercase font-['Raleway'] ${textColor}`">Scroll to explore</span>
    <svg 
      class="w-5 h-5 animate-bounce opacity-90" 
      :class="arrowColor"
      fill="none" 
      stroke="currentColor" 
      viewBox="0 0 24 24"
    >
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1" d="M19 13l-7 7-7-7"></path>
    </svg>
  </div>
</template>

<style scoped>
@font-face {
  font-family: 'Raleway';
  font-style: normal;
  font-weight: 200;
  src: local('Raleway'),
       url('/fonts/Raleway/static/Raleway-ExtraLight.ttf') format('truetype');
  font-display: swap;
}

@font-face {
  font-family: 'Raleway';
  font-style: normal;
  font-weight: 300;
  src: local('Raleway'),
       url('/fonts/Raleway/static/Raleway-Light.ttf') format('truetype');
  font-display: swap;
}
</style>