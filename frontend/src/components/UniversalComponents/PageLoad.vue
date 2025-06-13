<template>

     <!-- Loading overlay -->
      <div 
        ref="loaderOverlay"
        class="fixed inset-0 z-50 flex items-center justify-center bg-[#111111] transition-opacity duration-1000"
        :class="{ 'opacity-0 pointer-events-none': !isLoading }"
      >
        <div class="flex flex-col items-center">
          <!-- Sleek spinner loader -->
          <div class="relative w-16 h-16 mb-5">
            <div class="absolute inset-0 border-2 border-white/10 rounded-full"></div>
            <div class="absolute inset-0 border-2 border-transparent border-t-white rounded-full animate-spinner"></div>        </div>
          <p class="text-white text-base font-raleway uppercase tracking-widest">Loading<span ref="loadingDots">.</span></p>
        </div>
      </div>
  </template>
  
  <script>
  
  export default {
    name: "PageLoad",
    setup() {
     
    const isLoading = ref(true);
      onMounted(() => {
        isLoading.value = true; // Ensure loading is shown on mount
        setTimeout(() => {
          isLoading.value = false;
        }, 3000); // 3 seconds       
      });

      return {
        isLoading
      };
    },
  };
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
    font-weight: 300;
    src: local('Raleway'),
        url('/fonts/Raleway/static/Raleway-Light.ttf') format('truetype');
    font-display: swap;
  }

    @keyframes spinner {
    to { transform: rotate(360deg); }
    }

    .animate-spinner {
    animation: spinner 1s linear infinite;
    }
  </style>