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
          opacity: currentParchmentIndex >= 7 ? 1 : 0
        }">
          <h2 class="text-2xl font-serif text-[#2a1f1f]/90 mb-1">The Swan</h2>
        </div>

        <div class="relative" :style="{ 
          opacity: currentParchmentIndex >= 7 ? 1 : 0
        }">
          <div>
            <h3 class="text-lg font-serif mb-1">Jan Jacob Spohler</h3>
            <p class="text-base mb-0">1849</p>
          </div>
        </div>

        <div class="relative" :style="{ 
          opacity: currentParchmentIndex >= 3 ? 1 : 0,
          transform: `translateY(${
            currentParchmentIndex >= 6 ? 0 : 
            currentParchmentIndex >= 5 ? 0 :
            currentParchmentIndex >= 3.5 ? 110 :
            currentParchmentIndex >= 3 ? 135 : 135
          }px)`,
          transition: 'opacity 0.03s ease-out, transform 0.1s ease-out'
        }">
          <div class="space-y-1 text-[#2a1f1f]/80 mb-4">
            <div>
              <h3 class="text-lg font-serif mb-2">Key Details</h3>
              <p class="text-base">Oil on Canvas by Dutch artist Jan Jacob Spohler. Depicts "Het Zwaantjie" (The Swan), an imagined inn with the St. Dionysius church of Tilburg in the background.</p>
            </div>
          </div>
        </div>

        <div class="relative" :style="{ 
          opacity: currentParchmentIndex >= 5 ? 1 : 0,
          transform: `translateY(${currentParchmentIndex >= 6 ? 0 : 20}px)`,
          transition: 'opacity 0.1s ease-out, transform 0.1s ease-out'
        }">
          <div class="space-y-1 text-[#2a1f1f]/80 mb-4">
            <div>
              <h3 class="text-lg font-serif mb-2">Hidden Symbolism</h3>
              <p class="text-base">Rich with symbols of death and transition: a ghostly figure at the entrance, a swan (carrying souls to the afterlife), a knotted bale of hay, and a black flag. The inn represents a threshold between life and the afterlife.</p>
            </div>
          </div>
        </div>

        <div class="relative" :style="{ 
          opacity: currentParchmentIndex >= 7 ? 1 : 0
        }">
          <div class="space-y-1 text-[#2a1f1f]/80">
            <div>
              <h3 class="text-lg font-serif mb-2">Historical Significance</h3>
              <p class="text-base">Commemorates the death of King Willem II of the Netherlands in Tilburg (1849), symbolized by the Dutch flag, Tilburg church, and death imagery throughout.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue';

const parchmentContainer = ref(null);
const currentParchmentIndex = ref(1);

defineProps({
  parchmentStage: {
    type: Number,
    default: 1
  }
});

const updateParchmentStage = (newStage) => {
  currentParchmentIndex.value = newStage;
};

const currentParchmentImage = computed(() => {
  return new URL(`../assets/parchments/parchment-${currentParchmentIndex.value}.png`, import.meta.url).href;
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