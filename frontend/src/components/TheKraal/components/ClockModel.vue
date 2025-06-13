<template>
  <div class="clock-container">
    <img src="../assets/clockFace.png" alt="Clock Face" class="clock-face" />
    <div class="clock-hand-wrapper" :style="handStyle">
      <img src="../assets/clockHand.png" alt="Clock Hand" class="clock-hand" />
    </div>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'

// Angle in degrees (0 = 12 o'clock)
const angle = ref(0)

// Example: animate the hand (uncomment to see it move)
// setInterval(() => { angle.value = (angle.value + 6) % 360 }, 1000)

const handStyle = computed(() => ({
  transform: `rotate(${angle.value}deg)`,
  transformOrigin: '50% 100%',
}))
</script>

<style scoped>
.clock-container {
  position: relative;
  width: 300px;
  height: 300px;
  margin: 0 auto;
}
.clock-face {
  width: 100%;
  height: 100%;
  position: absolute;
  left: 0; top: 0;
  z-index: 1;
}
.clock-hand-wrapper {
  position: absolute;
  left: 50%;
  top: 50%;
  width: 20px;      /* adjust to match your hand image width */
  height: 120px;    /* adjust to match your hand image height */
  transform: rotate(0deg);
  transform-origin: 50% 100%; /* bottom center */
  margin-left: -10px;   /* half of width */
  margin-top: -120px;   /* full height, so bottom is at center */
  z-index: 2;
  pointer-events: none;
}
.clock-hand {
  width: 100%;
  height: 100%;
  display: block;
}
</style>