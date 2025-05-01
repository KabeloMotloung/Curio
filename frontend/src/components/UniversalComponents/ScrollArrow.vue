<script setup lang="ts">
import { onMounted, onUnmounted, ref } from 'vue'
import { gsap } from 'gsap/all'

// Optional props for customization
const props = defineProps({
  text: {
    type: String,
    default: 'Scroll to explore'
  },
  textColor: {
    type: String,
    default: 'text-amber-200/90'
  },
  arrowColor: {
    type: String,
    default: 'text-amber-200/90'
  },
  animationDuration: {
    type: Number,
    default: 1.5
  },
  animationDistance: {
    type: Number,
    default: 20
  }
})

const arrowRef = ref(null)

onMounted(() => {
  if (arrowRef.value) {
    gsap.to(".scroll-arrow", {
      duration: props.animationDuration,
      y: props.animationDistance,
      repeat: -1,
      yoyo: true,
      ease: "sine.inOut",
      scrollTrigger: {
        trigger: "#arrow-container",
        start: "top bottom",
        toggleActions: "play pause play pause",
      }
    })
  }
})

onUnmounted(() => {
  // Clean up any animation if needed
  gsap.killTweensOf(".scroll-arrow")
})
</script>

<template>
  <div id="arrow-container" class="flex flex-col items-center">
    <p :class="textColor">{{ text }}</p>
    <svg
        ref="arrowRef"
        class="scroll-arrow w-5 h-5 animate-bounce opacity-90"
        :class="arrowColor"
        fill="none"
        stroke="currentColor"
        viewBox="0 0 24 24"
    >
      <path
          stroke-linecap="round"
          stroke-linejoin="round"
          stroke-width="1"
          d="M19 13l-7 7-7-7"
      />
    </svg>
  </div>
</template>


<style scoped>
.scroll-arrow {
  padding: 0;
  margin: 0;
  line-height: 0.89;
}
</style>