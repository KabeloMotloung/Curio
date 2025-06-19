<script setup lang="ts">
import {onMounted, onUnmounted, ref} from 'vue'

interface Section {
  position: number;
  name: string;
}

interface ScrollProgressProps {
  sections: Section[];
  activeColor?: string;
  inactiveColor?: string;
}

// Define props with defaults
const props = withDefaults(defineProps<ScrollProgressProps>(), {
  activeColor: 'bg-white',
  inactiveColor: 'bg-white/30'
})

const currentSection = ref(0)

const updateCurrentSection = () => {
  const scrollHeight = document.documentElement.scrollHeight - window.innerHeight
  const scrollPosition = window.scrollY
  const scrollPercentage = scrollPosition / scrollHeight

  // Find the last section that is before or at the current scroll position
  const index = props.sections.findIndex(section => 
    scrollPercentage <= section.position
  )
  
  // If we're past all sections, use the last section
  currentSection.value = index === -1 ? props.sections.length - 1 : index
}

const scrollToSection = (index: number) => {
 
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
      class="py-3 px-2 rounded-lg backdrop-blur-sm bg-black/40 flex flex-col items-center gap-3 
      shadow-[0_0_10px_rgba(255,255,255,0.2)] border border-white/20 transition-all duration-300"
    >
      <div
          v-for="(section, index) in sections"
          :key="index"
          class="w-2.5 h-2.5 rounded-full transition-all duration-500 relative"
          :class="currentSection === index ? `${activeColor} scale-125 shadow-[0_0_8px_rgba(255,255,255,0.6)]` : inactiveColor"
          @click="scrollToSection(index)"
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