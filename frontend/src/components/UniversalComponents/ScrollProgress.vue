<script setup lang="ts">
import { onMounted, onUnmounted, ref } from 'vue'

// Destructure props into a variable
const props = defineProps<{
  totalSections: number
}>()

const currentSection = ref(0)

const updateCurrentSection = () => {
  const scrollHeight = document.documentElement.scrollHeight - window.innerHeight
  const scrollPosition = window.scrollY
  const scrollPercentage = scrollPosition / scrollHeight

  const sectionHeight = 1 / props.totalSections
  const sectionIndex = Math.min(
      Math.floor(scrollPercentage / sectionHeight),
      props.totalSections - 1
  )

  currentSection.value = sectionIndex
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
        :class="currentSection === index ? 'bg-amber-500 scale-150' : 'bg-amber-500/30'"
    ></div>
  </div>
</template>