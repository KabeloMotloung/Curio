<template>
  <div>
    <img ref="badge" class="spin-badge" :src="myImage" alt="Artist's Bag" />
  </div>
</template>

<script setup>
import { ref, defineExpose } from 'vue'
  import myImage from '../../../assets/ArtistsBag.png'
const badge = ref(null)
defineExpose({ badge })
</script>

<style scoped>
.spin-badge {
  position: fixed;
  bottom: 20px;
  right: 20px;
  width: 80px;
  height: 80px;
  /* background-color: #8e44ad; */
  border-radius: 50%;
  z-index: 1000;
}
</style>
