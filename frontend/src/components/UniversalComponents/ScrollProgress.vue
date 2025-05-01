<script setup lang="ts">
import {onMounted, onUnmounted, ref} from 'vue'

interface ScrollProgressProps {
  totalSections: number;
  activeColor?: string;
  inactiveColor?: string;
}

// Define props with defaults
const props = withDefaults(defineProps<ScrollProgressProps>(), {
  activeColor: 'bg-blue-500',
  inactiveColor: 'bg-blue-200'
})

const currentSection = ref(0)

const updateCurrentSection = () => {
  const scrollHeight = document.documentElement.scrollHeight - window.innerHeight
  const scrollPosition = window.scrollY
  const scrollPercentage = scrollPosition / scrollHeight

  const sectionHeight = 1 / props.totalSections
  currentSection.value = Math.min(
      Math.floor(scrollPercentage / sectionHeight),
      props.totalSections - 1
  )
}

onMounted(() => {
  window.addEventListener('scroll', updateCurrentSection)
  updateCurrentSection()
})

onUnmounted(() => {
  window.removeEventListener('scroll', updateCurrentSection)
})
</script>

<template>
  <div class="fixed right-8 top-1/2 transform -translate-y-1/2 flex flex-col gap-4 z-50">
    <div
        v-for="(_, index) in totalSections"
        :key="index"
        class="w-2 h-2 rounded-full transition-all duration-300"
        :class="currentSection === index ? `${activeColor} scale-150` : inactiveColor"
    ></div>
  </div>
</template>