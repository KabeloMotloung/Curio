<template>
    <div class="relative w-full h-screen flex overflow-hidden bg-gray-900">
      <!-- Outer Background -->
      <div class="absolute inset-0 bg-gradient-to-r from-[#333333] to-[#1e1e1e] z-0 animate-bg-gradient"></div>
  
      <!-- Left Side: Image Section -->
      <div class="flex-1 relative overflow-hidden z-10">
        <!-- Background Image -->
        <div
          class="absolute inset-0 bg-cover bg-center transition-all duration-1500 ease-in-out transform scale-125"
          :style="{ backgroundImage: 'url(' + artworkImage + ')' }"
          ref="bgImage"
        ></div>
  
        <!-- Gradient Overlay -->
        <div
          class="absolute inset-0 bg-gradient-to-b from-transparent to-black/60 transition-all duration-500"
        ></div>
  
        <!-- Title -->
        <div
          class="absolute inset-0 flex items-center justify-center z-10 text-center opacity-0"
          ref="title"
        >
          <h1
            class="text-7xl font-extrabold text-white tracking-widest drop-shadow-2xl"
          >
            Battle of Torquay
          </h1>
        </div>
  
        <!-- Artist Info -->
        <div
          class="absolute top-8 right-8 z-20 text-white font-thin opacity-0"
          ref="artistInfo"
        >
          <span class="text-lg">Abraham Storck</span>
          <span class="block text-sm opacity-60">1680</span>
        </div>
      </div>
  
      <!-- Right Side: Description Panel -->
      <div
        class="w-[40%] bg-gradient-to-t from-black to-transparent text-white flex flex-col justify-start items-start overflow-hidden p-12 pt-32 z-10"
        ref="descriptionPanel"
      >
        <h2 class="text-4xl font-semibold mb-10 opacity-0" ref="descriptionTitle">
          About the Artwork
        </h2>
        <p class="text-base mb-8 leading-relaxed opacity-0" ref="descText1">
          The "Battle of Torquay" is a historical painting by the Dutch master
          Abraham Storck, known for his exquisite naval battle scenes. The piece
          captures the drama and violence of a fierce naval confrontation, with
          turbulent seas and dynamic ship movements.
        </p>
        <p class="text-base mb-8 leading-relaxed opacity-0" ref="descText2">
          Storck masterfully uses light and shadow to heighten the intensity of
          the scene, with menacing waves and billowing smoke. The artwork brings
          to life the chaos of 17th-century naval warfare, filled with intricate
          details that reflect both the power of the ships and the nature of the
          battle.
        </p>
      </div>
    </div>
  </template>
  
  <script setup lang="ts">
  import { ref, onMounted } from "vue";
  import { gsap } from "gsap";
  
  // Reference to the elements
  const bgImage = ref<HTMLElement | null>(null);
  const title = ref<HTMLElement | null>(null);
  const artistInfo = ref<HTMLElement | null>(null);
  const descriptionTitle = ref<HTMLElement | null>(null);
  const descText1 = ref<HTMLElement | null>(null);
  const descText2 = ref<HTMLElement | null>(null);
  const metaInfo = ref<HTMLElement | null>(null);
  
  // Path to the artwork image
  const artworkImage = "/7.jpg"; // Replace with your image URL
  
  // Animation on page load
  onMounted(() => {
    gsap.fromTo(
      title.value,
      { opacity: 0, y: -100 },
      { opacity: 1, y: 0, duration: 1.5, delay: 0.5, ease: "power4.out" }
    );
  
    gsap.fromTo(
      artistInfo.value,
      { opacity: 0, x: 50 },
      { opacity: 1, x: 0, duration: 1, delay: 1.5, ease: "power3.out" }
    );
  
    gsap.fromTo(
      descriptionTitle.value,
      { opacity: 0, y: 30 },
      { opacity: 1, y: 0, duration: 1.5, delay: 2, ease: "power4.out" }
    );
  
    gsap.fromTo(
      descText1.value,
      { opacity: 0, y: 20 },
      { opacity: 1, y: 0, duration: 1, delay: 2.5, ease: "power4.out" }
    );
  
    gsap.fromTo(
      descText2.value,
      { opacity: 0, y: 20 },
      { opacity: 1, y: 0, duration: 1, delay: 3, ease: "power4.out" }
    );
  
    gsap.fromTo(
      metaInfo.value,
      { opacity: 0, y: 20 },
      { opacity: 1, y: 0, duration: 1, delay: 3.5, ease: "power4.out" }
    );
  
    // Smoothly scale the background image in for a cinematic effect
    gsap.fromTo(
      bgImage.value,
      { scale: 1.1 },
      { scale: 1, duration: 2, ease: "power4.out" }
    );
  });
  </script>
  
  <style scoped>
  body {
    margin: 0;
    overflow-x: hidden;
  }
  
  h1,
  h2,
  p {
    font-family: "Georgia", serif;
    color: #ffffff;
  }
  
  .left {
    background-color: #111;
  }
  
  .left img {
    object-fit: cover;
  }
  
  .right {
    background-color: #111;
    background-image: linear-gradient(to top, rgba(17, 17, 17, 0.9) 0%, rgba(0, 0, 0, 0.7) 100%);
    color: white;
    padding-top: 80px;
  }
  
  .right .text-white {
    font-weight: lighter;
  }
  
  .text-shadow {
    text-shadow: 4px 4px 10px rgba(0, 0, 0, 0.6);
  }
  
  .bg-cover {
    background-size: cover;
  }
  
  .bg-center {
    background-position: center;
  }
  
  /* Outer Background Gradient Animation */
  @keyframes bgGradient {
    0% {
      background-position: 0% 50%;
    }
    50% {
      background-position: 100% 50%;
    }
    100% {
      background-position: 0% 50%;
    }
  }
  
  .animate-bg-gradient {
    background-size: 200% 200%;
    animation: bgGradient 10s ease infinite;
  }
  </style>
  