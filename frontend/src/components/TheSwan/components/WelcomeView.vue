<template>
  <div class="fixed inset-0 pointer-events-none" ref="cloudContainer">      
    <div class="absolute top-[10%] left-0 w-full flex items-center justify-center text-white/90 transition-opacity duration-500" ref="titleText">
      <h1 class="text-7xl font-extralight tracking-[0.25em] uppercase">The Swan</h1>
    </div>
    <img 
      :src="cloudImageUrl"
      class="absolute top-[15%] left-[18%] w-[40%] opacity-0 animate-float-slow cloud-monotonous" 
      ref="cloud1" 
      alt="Cloud 1"
    />
    <img 
      :src="cloudImageUrl"
      class="absolute top-[25%] right-[15%] w-[50%] opacity-0 animate-float-medium cloud-monotonous" 
      ref="cloud2" 
      alt="Cloud 2"
    />
    <img 
      :src="cloudImageUrl"
      class="absolute top-[60%] left-[15%] w-[45%] opacity-0 animate-float-fast cloud-monotonous" 
      ref="cloud3" 
      alt="Cloud 3"
    />
  </div>

  <ScrollArrow textColor="text-white/80" arrowColor="text-white/80" />
</template>

<script setup>
import { ref, onMounted, computed } from 'vue';
import gsap from 'gsap';
import cloudImage from '../assets/cloud.png';
import ScrollArrow from '../../UniversalComponents/ScrollArrow.vue';

const cloudContainer = ref(null);
const cloud1 = ref(null);
const cloud2 = ref(null);
const cloud3 = ref(null);
const titleText = ref(null);

const cloudImageUrl = computed(() => {
  return cloudImage;
});

defineProps({
  scrollPosition: {
    type: Number,
    default: 0
  },
  paintingRevealStart: {
    type: Number,
    default: 0.1
  },
  paintingRevealEnd: {
    type: Number,
    default: 0.3
  }
});


onMounted(() => {
  if (cloud1.value && cloud2.value && cloud3.value) {
    gsap.to([cloud1.value, cloud2.value, cloud3.value], {
      opacity: 0.75,
      duration: 1.5,
      ease: "power2.out"
    });
  }
});

defineExpose({
  cloud1,
  cloud2,
  cloud3,
  titleText
});
</script>

<style scoped>
@font-face {
  font-family: 'Raleway';
  font-style: normal;
  font-weight: 200;
  src: local('Raleway'),
       url('/fonts/Raleway/static/Raleway-ExtraLight.ttf') format('truetype');
  font-display: swap;
}

@font-face {
  font-family: 'Raleway';
  font-style: normal;
  font-weight: 400;
  src: local('Raleway'),
       url('/fonts/Raleway/static/Raleway-Regular.ttf') format('truetype');
  font-display: swap;
}

h1 {
  font-family: 'Raleway', sans-serif !important;
  text-shadow: 0 2px 8px rgba(0, 0, 0, 0.3);
  color: #E5E7EB !important;
  font-weight: 200 !important;
}


@keyframes floatSlow {
  0%, 100% { 
    transform: translate(0, 0) rotate(0deg); 
  }
  25% {
    transform: translate(55px, 18px) rotate(2deg);
  }
  75% {
    transform: translate(-35px, -15px) rotate(-2deg);
  }
}

@keyframes floatMedium {
  0%, 100% { 
    transform: translate(0, 0) rotate(0deg); 
  }
  33% {
    transform: translate(-70px, 20px) rotate(-2deg);
  }
  66% {
    transform: translate(50px, -18px) rotate(2deg);
  }
}

@keyframes floatFast {
  0%, 100% { 
    transform: translate(0, 0) rotate(0deg); 
  }
  40% {
    transform: translate(75px, -22px) rotate(2.5deg);
  }
  60% {
    transform: translate(-55px, 18px) rotate(-2deg);
  }
}

.animate-float-slow {
  animation: floatSlow 15s ease-in-out infinite;
  will-change: transform;
}

.animate-float-medium {
  animation: floatMedium 18s ease-in-out infinite;
  will-change: transform;
}

.animate-float-fast {
  animation: floatFast 12s ease-in-out infinite;
  will-change: transform;
}

[ref="cloud1"],
[ref="cloud2"],
[ref="cloud3"] {
  transition: opacity 0.5s ease-in-out, transform 0.5s ease-in-out;
  transform-origin: center center;
}

.cloud-monotonous {
  filter: grayscale(0.2) brightness(0.6);
}
</style>