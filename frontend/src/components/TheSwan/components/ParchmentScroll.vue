<template>
  <div ref="parchmentContainer" class="fixed top-1/2 right-0 w-[35vw] max-w-[500px] transform translate-y-1/2 translate-x-full opacity-0">
    <div class="relative p-6 rounded-lg overflow-hidden bg-transparent">
      <img 
        :src="currentParchmentImage" 
        class="absolute inset-0 w-full h-full object-contain filter contrast-[0.85] brightness-[0.92] saturate-[0.8] sepia-[0.15]"
        alt="Parchment"
      />
      
      <div class="relative z-10 px-12 py-20">
        <div class="relative" :style="{ 
          opacity: currentParchmentIndex >= 7 ? 1 : 0,
          transform: `translateY(${currentParchmentIndex >= 7 ? 0 : -10}px)`,
          transition: currentParchmentIndex >= 7 ? 'opacity 0.3s ease-out, transform 0.4s ease-out' : 'none'
        }">
          <h2 class="text-2xl font-serif text-[#2a1f1f]/90 mb-1" ref="title">In Memoriam</h2>
        </div>

        <div class="relative" :style="{ 
          opacity: currentParchmentIndex >= 7 ? 1 : 0,
          transform: `translateY(${currentParchmentIndex >= 7 ? 0 : -5}px)`,
          transition: currentParchmentIndex >= 7 ? 'opacity 0.4s ease-out, transform 0.5s ease-out' : 'none'
        }">
          <div>
            <h3 class="text-lg font-serif mb-1" ref="subtitle">His Majesty King Willem II</h3>
            <p class="text-base mb-0" ref="years">1792 - 1849</p>
          </div>
        </div>

        <div class="relative" :style="{ 
          opacity: currentParchmentIndex >= 4 ? 1 : 0, 
          transform: `translateY(${
            currentParchmentIndex >= 6 ? 0 : 
            currentParchmentIndex >= 5 ? 0 :
            currentParchmentIndex >= 4 ? 110 : 
            currentParchmentIndex >= 3 ? 135 : 135
          }px)`,
          transition: currentParchmentIndex >= 4 
            ? 'opacity 0.3s ease-out, transform 0.1s ease-out' 
            : 'none'
        }">
          <div class="space-y-1 text-[#2a1f1f]/80 mb-4">
            <div>
              <h3 class="text-lg font-serif mb-2" ref="section1Title">With Profound Sorrow</h3>
              <p class="text-base" ref="section1Text">We mourn the passing of our sovereign, His Majesty King Willem II, departed on March 17, 1849 in Tilburg. Called suddenly by divine providence, his subjects are bereft of his noble guidance.</p>
            </div>
          </div>
        </div>

        <div class="relative" :style="{ 
          opacity: currentParchmentIndex >= 5 ? 1 : 0,
          transform: `translateY(${currentParchmentIndex >= 6 ? 0 : 20}px)`,
          transition: currentParchmentIndex >= 5 
            ? 'opacity 0.4s ease-out, transform 0.1s ease-out' 
            : 'none'
        }">
          <div class="space-y-1 text-[#2a1f1f]/80 mb-4">
            <div>
              <h3 class="text-lg font-serif mb-2" ref="section2Title">A Remarkable Life</h3>
              <p class="text-base" ref="section2Text">His Majesty's nine-year reign was marked by wisdom and vision. A hero of Waterloo and patron of the arts, he established his military headquarters in Tilburg during the Belgian Revolution of 1830, where fate decreed he would draw his final breath.</p>
            </div>
          </div>
        </div>

        <div class="relative" :style="{ 
          opacity: currentParchmentIndex >= 7 ? 1 : 0,
          transform: `translateY(${currentParchmentIndex >= 7 ? 0 : 25}px) 
                     scale(${currentParchmentIndex >= 7 ? 1 : 0.95})`,
          transition: currentParchmentIndex >= 7 ? 'opacity 0.5s ease-out, transform 0.6s ease-out' : 'none'
        }">
          <div class="space-y-1 text-[#2a1f1f]/80">
            <div>
              <h3 class="text-lg font-serif mb-2" ref="section3Title">Eternal Remembrance</h3>
              <p class="text-base" ref="section3Text">As the swan carries his soul to eternity, we shall honor his legacy. The black flag flies in tribute, and St. Dionysius' bells toll for our departed King. May his journey bring him the peace and glory he deserves.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, watch, nextTick, onMounted } from 'vue';
import { gsap } from 'gsap';
import parchment1 from '../assets/parchments/parchment-1-min.png';
import parchment2 from '../assets/parchments/parchment-2-min.png';
import parchment3 from '../assets/parchments/parchment-3-min.png';
import parchment4 from '../assets/parchments/parchment-4-min.png';
import parchment5 from '../assets/parchments/parchment-5-min.png';
import parchment6 from '../assets/parchments/parchment-6-min.png';
import parchment7 from '../assets/parchments/parchment-7-min.png';

const parchmentContainer = ref(null);
const currentParchmentIndex = ref(1);

const title = ref(null);
const subtitle = ref(null);
const years = ref(null);
const section1Title = ref(null);
const section1Text = ref(null);
const section2Title = ref(null);
const section2Text = ref(null);
const section3Title = ref(null);
const section3Text = ref(null);

const parchmentImages = {
  1: parchment1,
  2: parchment2,
  3: parchment3,
  4: parchment4,
  5: parchment5,
  6: parchment6,
  7: parchment7
};

defineProps({
  parchmentStage: {
    type: Number,
    default: 1
  }
});

const animateElement = (element, delay = 0) => {
  if (!element) return;
  
  element.style.opacity = '0';
  
  gsap.to(element, {
    opacity: 1,
    duration: 0.4,
    delay: delay,
    ease: "power2.out"
  });
};

watch(currentParchmentIndex, (newIndex, oldIndex) => {
  nextTick(() => {
    if (newIndex >= 4 && oldIndex < 4) {
      animateElement(section1Title.value, 0.1);
      animateElement(section1Text.value, 0.3);
    }
    
    if (newIndex >= 5 && oldIndex < 5) {
      animateElement(section2Title.value, 0.1);
      animateElement(section2Text.value, 0.3);
    }
    
    if (newIndex >= 7 && oldIndex < 7) {
      animateElement(title.value, 0.1);
      animateElement(subtitle.value, 0.3);
      animateElement(years.value, 0.4);
      animateElement(section3Title.value, 0.5);
      animateElement(section3Text.value, 0.7);
    }
  });
}, { immediate: false });

const updateParchmentStage = (newStage) => {
  currentParchmentIndex.value = newStage;
};

const currentParchmentImage = computed(() => {
  return parchmentImages[currentParchmentIndex.value];
});

const preloadImages = () => {
  const imagesToPreload = Object.values(parchmentImages);
  
  imagesToPreload.forEach(src => {
    const img = new Image();
    img.src = src;
  });
};

onMounted(() => {
  preloadImages();
});

defineExpose({
  parchmentContainer,
  currentParchmentIndex,
  updateParchmentStage
});
</script>

<style scoped>
@font-face {
  font-family: 'Dancing Script';
  font-style: normal;
  font-weight: 400;
  src: local('Dancing Script'),
       url('/fonts/Dancing_Script/static/DancingScript-Regular.ttf') format('truetype');
  font-display: swap;
}

p {
  line-height: 1.6;
  margin-bottom: 0.25rem;
  font-family: 'Dancing Script', cursive;
  font-size: 1.2rem;
  font-weight: 800;
  color: #2a1f1f;
  text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.05);
  filter: contrast(0.95) brightness(0.98);
}

h2, h3 {
  font-family: 'Dancing Script', cursive;
  font-weight: 800;
  letter-spacing: 0.05em;
  color: #2a1f1f;
  text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.05);
  filter: contrast(0.95) brightness(0.98);
}
</style>