<template>
  <div
    class="relative w-full h-full flex items-center justify-center pointer-events-none"
  >
    <div
      class="w-full max-w-2xl px-4 transform transition-all duration-300"
      :class="{
        'opacity-0 translate-y-20': !isVisible,
        'opacity-100 translate-y-0': isVisible,
      }"
    >
      <div
        class="relative group cursor-pointer pointer-events-auto"
        @click="navigateToNext"
      >
        <div
          class="relative p-12 rounded-lg transition-all duration-300 overflow-hidden backdrop-blur-sm bg-black/60 border border-white/20 shadow-[0_0_10px_rgba(255,255,255,0.2)] group-hover:shadow-[0_0_20px_rgba(255,255,255,0.5)] group-hover:border-white/50 h-full min-h-[700px]"
        >
          <div class="flex flex-col h-full items-center justify-center">
            <div
              class="w-96 h-96 rounded-lg overflow-hidden transform transition-transform duration-300 group-hover:scale-105 flex items-center justify-center mb-12"
            >
              <img
                :src="artifactImage"
                :alt="nextArtifactTitle"
                class="w-full h-full object-contain"
              />
            </div>
            <div class="flex flex-col items-center text-center mb-8">
              <h3
                class="text-2xl font-raleway font-light tracking-[0.25em] uppercase mb-3 text-white/80 group-hover:text-white transition-colors duration-300"
              >
                Next Artifact
              </h3>
              <p
                class="text-xl font-raleway font-light tracking-[0.15em] text-white/90 group-hover:text-white transition-colors duration-300"
              >
                {{ nextArtifactTitle }}
              </p>
            </div>
            <div class="flex items-center justify-center">
              <span
                class="text-sm font-raleway font-light tracking-[0.25em] uppercase text-white/60 group-hover:text-white/80 transition-colors duration-300"
                >Click to explore</span
              >
              <svg
                class="w-5 h-5 ml-2 text-white/60 group-hover:text-white/80 transition-colors duration-300 transform transition-transform duration-300 group-hover:translate-x-1"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="1.5"
                  d="M9 5l7 7-7 7"
                />
              </svg>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { computed } from "vue";
import { useRouter } from "vue-router";

import theSwanImage from "../../Cards/assets/TheSwanImage.png";
import theKraalImage from "../../Cards/assets/TheKraalImage.jpg";
import theDiscoverImage from "../../Cards/assets/TheDiscoverImage.jpg";
import spindleWhorlImage from "../../Cards/assets/SpindleWhorlImage.jpg";
import sidwaneTokozileImage from "../../Cards/assets/SidwaneTokozileImage.png";
import battleOfTorquayImage from "../../Cards/assets/BattleOfTorquayImage.png";
import pangolinAndCrocodileImage from "../../Cards/assets/PangolinAndCrocodileImage.png";

const props = defineProps({
  nextArtifactTitle: {
    type: String,
    required: true,
  },
  nextArtifactPath: {
    type: String,
    required: true,
  },
  bgColor: {
    type: String,
    default: "#ffffff",
  },
  textColor: {
    type: String,
    default: "#000000",
  },
  isVisible: {
    type: Boolean,
    default: false,
  },
});

const router = useRouter();

const emit = defineEmits(["resetAnimations"]);

const artifactImageMap = {
  "The Swan": theSwanImage,
  "The Kraal": theKraalImage,
  "The Discover": theDiscoverImage,
  "Spindle Whorl": spindleWhorlImage,
  "Sidwane Tokozile": sidwaneTokozileImage,
  "Battle of Torquay": battleOfTorquayImage,
  "Pangolin and Crocodile": pangolinAndCrocodileImage,
};

const artifactImage = computed(() => {
  return artifactImageMap[props.nextArtifactTitle] || theSwanImage;
});

const navigateToNext = () => {
  emit("resetAnimations");
  router.replace(props.nextArtifactPath);
};
</script>

<style scoped>
@font-face {
  font-family: "Raleway";
  font-style: normal;
  font-weight: 200;
  src:
    local("Raleway"),
    url("/fonts/Raleway/static/Raleway-ExtraLight.ttf") format("truetype");
  font-display: swap;
}

@font-face {
  font-family: "Raleway";
  font-style: normal;
  font-weight: 400;
  src:
    local("Raleway"),
    url("/fonts/Raleway/static/Raleway-Regular.ttf") format("truetype");
  font-display: swap;
}

.font-raleway {
  font-family: "Raleway", sans-serif;
  text-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
}
</style>
