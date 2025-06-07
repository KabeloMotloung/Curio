<script setup lang="ts">
import {onMounted, onUnmounted, ref} from 'vue'

const activeColor = 'bg-white'
const inactiveColor = 'bg-white/30'

const currentSection = ref(0)

const SECTIONS = [
  { position: 0.00, name: 'Welcome' },
  { position: 0.0824, name: 'Timeline' },
  { position: 0.58, name: 'Background' },
  { position: 0.87, name: 'Display' },
  { position: 0.99, name: 'Next' }
]

const updateCurrentSection = () => {
  const scrollPosition = window.scrollY
  const windowHeight = window.innerHeight
  const maxScroll = document.documentElement.scrollHeight - windowHeight

  let maxVisibility = 0
  let mostVisibleSection = 0

  for (let i = 0; i < SECTIONS.length; i++) {
    const sectionStart = maxScroll * SECTIONS[i].position
    const sectionEnd = i < SECTIONS.length - 1 
      ? maxScroll * SECTIONS[i + 1].position 
      : maxScroll

    const visibleStart = Math.max(sectionStart, scrollPosition)
    const visibleEnd = Math.min(sectionEnd, scrollPosition + windowHeight)
    const visibleAmount = Math.max(0, visibleEnd - visibleStart)

    if (visibleAmount > maxVisibility) {
      maxVisibility = visibleAmount
      mostVisibleSection = i
    }
  }

  currentSection.value = mostVisibleSection
}

const scrollToSection = (index: number) => {
  const maxScroll = document.documentElement.scrollHeight - window.innerHeight
  const targetScroll = maxScroll * SECTIONS[index].position
  window.scrollTo({
    top: targetScroll,
    behavior: 'auto'
  })
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
  <div class="fixed right-8 top-1/2 transform -translate-y-1/2 flex flex-col gap-4 z-50 cursor-default">
    <div 
      class="py-3 px-2 rounded-lg backdrop-blur-sm bg-black/40 flex flex-col items-center gap-3 
      shadow-[0_0_10px_rgba(255,255,255,0.2)] border border-white/20 transition-all duration-300"
    >
      <div
          v-for="(section, index) in SECTIONS"
          :key="index"
          class="w-2.5 h-2.5 rounded-full transition-all duration-500 relative cursor-pointer hover:scale-125"
          :class="currentSection === index ? `${activeColor} scale-125 shadow-[0_0_8px_rgba(255,255,255,0.6)]` : inactiveColor"
          @click="scrollToSection(index)"
          :title="section.name"
      >
        <div 
          v-if="currentSection === index"
          class="absolute inset-0 rounded-full animate-ping opacity-50"
          :class="activeColor"
        ></div>
      </div>
    </div>
  </div>
</template>