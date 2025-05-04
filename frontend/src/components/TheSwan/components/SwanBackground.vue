<template>
  <div class="fixed inset-0 bg-transition" ref="skyBackground">
    <img 
      :src="backgroundImageUrl"
      class="h-screen w-full object-cover gloomy-filter" 
      ref="background" 
      alt="Sky Background"
    />
  </div>
</template>

<script setup>
import { ref, computed } from 'vue';
import skyBackgroundImage from '../assets/sky-background.jpg';

const skyBackground = ref(null);
const background = ref(null);

const backgroundImageUrl = computed(() => {
  return skyBackgroundImage;
});

defineExpose({
  skyBackground,
  background
});
</script>

<style scoped>
.bg-transition {
  transition: background-color 0.5s ease, background-image 0.5s ease;
}

.gloomy-filter {
  filter: brightness(0.6) grayscale(0.4) contrast(1.15) saturate(0.75);
  transition: filter 0.5s ease;
}
</style>