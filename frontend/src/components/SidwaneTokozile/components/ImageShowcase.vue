<template>
  <div class="image-showcase">
    <div class="carousel-container">
      <div class="carousel">
        <div 
          v-for="(image, index) in images" 
          :key="index" 
          class="carousel-item"
          :class="{ 'active': index === currentIndex }"
          @click="setActive(index)"
          :style="{
            transform: getItemTransform(index),
            opacity: getOpacity(index)
          }"
        >
          <img :src="image" alt="Sculpture view" />
        </div>
      </div>
    </div>
    <div class="carousel-controls">
      <button @click="prevImage" class="control-btn">
        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M15 18L9 12L15 6" stroke="#33261e" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
      </button>
      <div class="carousel-indicators">
        <span 
          v-for="(image, index) in images" 
          :key="index"
          @click="setActive(index)"
          class="indicator"
          :class="{ 'active': index === currentIndex }"
        ></span>
      </div>
      <button @click="nextImage" class="control-btn">
        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M9 6L15 12L9 18" stroke="#33261e" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
      </button>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue';
import sculptureFront from '../assets/sculpture-front.png';
import sculptureSide from '../assets/sculpture-side.png';
import sculptureCloseup from '../assets/sculpture-closeup.png';
import sculptureSideCloseup from '../assets/sculpture-side-closeup.png';
import sculpture1 from '../assets/sculpture-1.png';
import sculpture2 from '../assets/sculpture-2.png';

const images = [
  sculptureFront,
  sculptureSide,
  sculptureCloseup,
  sculptureSideCloseup,
  sculpture1,
  sculpture2,
];

const currentIndex = ref(0);
const isAnimating = ref(false);

const nextImage = () => {
  if (isAnimating.value) return;
  isAnimating.value = true;
  currentIndex.value = (currentIndex.value + 1) % images.length;
  setTimeout(() => {
    isAnimating.value = false;
  }, 600);
};

const prevImage = () => {
  if (isAnimating.value) return;
  isAnimating.value = true;
  currentIndex.value = (currentIndex.value - 1 + images.length) % images.length;
  setTimeout(() => {
    isAnimating.value = false;
  }, 600);
};

const setActive = (index: number) => {
  if (isAnimating.value) return;
  isAnimating.value = true;
  currentIndex.value = index;
  setTimeout(() => {
    isAnimating.value = false;
  }, 600); 
};

const getItemTransform = (index: number) => {
  const totalItems = images.length;
  const angleIncrement = 360 / totalItems;
  
  let distance = index - currentIndex.value;
  
  if (distance > totalItems / 2) distance -= totalItems;
  if (distance < -totalItems / 2) distance += totalItems;
  
  const angle = distance * angleIncrement;
  
  const radius = 280;
  
  const z = radius * Math.cos(angle * Math.PI / 180);
  const x = radius * Math.sin(angle * Math.PI / 180);
  
  if (index === currentIndex.value) {
    return `translateX(0) translateZ(${radius}px) scale(1.05)`;
  }
  
  return `translateX(${x}px) translateZ(${z}px)`;
};

const getOpacity = (index: number) => {
  if (index === currentIndex.value) return 1;
  
  let distance = Math.abs(index - currentIndex.value);
  
  distance = Math.min(
    distance,
    Math.abs(distance - images.length)
  );
  
  return Math.max(0.1, 1 - (distance * 0.4));
};
</script>

<style scoped>
.image-showcase {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  width: 100%;
  height: 100vh;
  margin: 0;
  background: linear-gradient(to bottom, #e6d7c3, #d1bea0);
  color: #33261e;
  padding: 2rem 0;
}

.carousel-container {
  position: relative;
  width: 100%;
  height: 500px;
  perspective: 1500px; 
  display: flex;
  justify-content: center;
  align-items: center;
  overflow: hidden;
}

.carousel {
  width: 100%;
  height: 100%;
  position: absolute;
  transform-style: preserve-3d;
  transition: transform 0.8s ease;
}

.carousel-item {
  position: absolute;
  width: 320px;
  height: 380px;
  top: 50%;
  left: 50%;
  margin-left: -160px; 
  margin-top: -190px;
  cursor: pointer;
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 5px 15px rgba(51, 38, 30, 0.2);
  transition: transform 600ms cubic-bezier(0.4, 0.0, 0.2, 1), opacity 600ms ease;
  backface-visibility: hidden; 
  transform-origin: center center;
  will-change: transform, opacity; 
}

.carousel-item img {
  width: 100%;
  height: 100%;
  object-fit: contain;
  transition: transform 0.3s ease;
  background-color: transparent;
  padding: 0;
}

.carousel-item.active {
  z-index: 10;
  box-shadow: 0 8px 25px rgba(51, 38, 30, 0.5);
}

.carousel-item:hover img {
  transform: scale(1.02);
}

.carousel-controls {
  margin-top: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 25px;
  padding: 12px 25px;
}

.control-btn {
  background: none;
  border: none;
  cursor: pointer;
  padding: 8px;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: all 0.3s;
}

.control-btn:hover svg path {
  stroke: #5d3a22;
  stroke-width: 2.5;
}

.control-btn:active {
  transform: translateY(1px);
}

.carousel-indicators {
  display: flex;
  gap: 12px;
  align-items: center;
  min-width: 150px;
  justify-content: center;
}

.indicator {
  width: 10px;
  height: 10px;
  border-radius: 50%;
  background-color: rgba(51, 38, 30, 0.3);
  cursor: pointer;
  transition: all 0.3s;
}

.indicator:hover {
  background-color: rgba(93, 58, 34, 0.6);
  transform: scale(1.1);
}

.indicator.active {
  width: 12px;
  height: 12px;
  background-color: #5d3a22;
  transform: scale(1.2);
  box-shadow: 0 0 8px rgba(93, 58, 34, 0.4);
}
</style>