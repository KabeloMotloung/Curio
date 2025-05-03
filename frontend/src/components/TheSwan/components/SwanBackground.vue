<template>
  <div class="fixed inset-0 bg-transition" ref="skyBackground">
    <img 
      :src="backgroundImageUrl"
      class="h-screen w-full object-cover" 
      ref="background" 
      alt="Sky Background"
    />
  </div>
</template>

<script setup>
import { ref, computed } from 'vue';

const skyBackground = ref(null);
const background = ref(null);

const backgroundImageUrl = computed(() => {
  return new URL('../assets/sky-background.jpg', import.meta.url).href;
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
</style>