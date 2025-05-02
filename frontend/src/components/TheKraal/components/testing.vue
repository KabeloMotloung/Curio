<template>
    <div class="tapestry-container">
      <!-- Landing Screen -->
      <section class="landing-screen" ref="landingScreen">
        <h1 class="artifact-name">The Kraal</h1>
        <div class="lines-container">
          <div class="line" v-for="n in 10" :key="n"></div>
        </div>
      </section>
  
      <!-- Map Section -->
      <div class="map-section" ref="mapSection">
        <div class="dots-container" ref="dotsContainer">
          <div 
            v-for="(dot, index) in dots" 
            :key="index" 
            :class="['dot', 'dot-' + (index + 1)]"
          ></div>
        </div>
      </div>
  
      <!-- Text Section for Each Dot -->
      <section
        class="dot-details"
        v-for="(dot, index) in dots"
        :key="'details-' + index"
        ref="dotDetails"
      >
        <div class="dot-center"></div>
        <div class="text">
          <p v-for="(sentence, i) in dot.text" :key="'sentence-' + i">{{ sentence }}</p>
        </div>
      </section>
    </div>
  </template>
  
  <script>
  import { ref, onMounted } from "vue";
  import { gsap } from "gsap";
  import { ScrollTrigger } from "gsap/ScrollTrigger";
  
  gsap.registerPlugin(ScrollTrigger);
  
  export default {
    name: "Tapestry",
    setup() {
      const landingScreen = ref(null);
      const mapSection = ref(null);
      const dotsContainer = ref(null);
      const dotDetails = ref([]);
      const dots = [
        { text: ["This is the first dot.", "It represents the beginning.", "A story starts here."] },
        { text: ["This is the second dot.", "It represents growth.", "A journey continues."] },
        { text: ["This is the third dot.", "It represents challenges.", "A story unfolds."] },
        { text: ["This is the fourth dot.", "It represents triumph.", "A story concludes."] },
      ];
  
      onMounted(() => {
        // Landing Screen Animation
        const lines = landingScreen.value.querySelectorAll(".line");
        gsap.fromTo(
          lines,
          { scaleX: 0 },
          {
            scaleX: 1,
            stagger: 0.1,
            scrollTrigger: {
              trigger: landingScreen.value,
              start: "top top",
              end: "bottom top",
              scrub: true,
              pin: true,
            },
          }
        );
  
        gsap.to(".artifact-name", {
          opacity: 0,
          scrollTrigger: {
            trigger: landingScreen.value,
            start: "top top",
            end: "bottom top",
            scrub: true,
          },
        });
  
        // Create main timeline for dot animations
        const mainTimeline = gsap.timeline({
          scrollTrigger: {
            trigger: ".map-section",
            start: "top top",
            end: "+=400%", // Adjust based on number of dots and final zoom out
            scrub: 1,
            pin: true,
            anticipatePin: 1,
          },
        });
  
        // Store original positions of dots
        const dotElements = document.querySelectorAll('.dot');
        const dotPositions = [];
        dotElements.forEach(dot => {
          const rect = dot.getBoundingClientRect();
          dotPositions.push({
            x: rect.left + rect.width / 2,
            y: rect.top + rect.height / 2
          });
        });
  
        // Center point of the viewport
        const centerX = window.innerWidth / 2;
        const centerY = window.innerHeight / 2;
  
        // Add animations for each dot
        dots.forEach((_, index) => {
          const dotClass = `.dot-${index + 1}`;
          
          // Calculate movement to center
          const moveX = centerX - dotPositions[index].x;
          const moveY = centerY - dotPositions[index].y;
  
          // Zoom into current dot
          mainTimeline
            .to(dotClass, {
              scale: 20,
              duration: 2,
              x: moveX,
              y: moveY,
              zIndex: 10,
            })
            // Zoom out current dot
            .to(dotClass, {
              scale: 1,
              duration: 2,
              x: 0,
              y: 0,
              zIndex: 1,
            });
        });
  
        // Final zoom out to show all dots
        mainTimeline.to(".dots-container", {
          scale: 1,
          duration: 2,
        });
      });
  
      return {
        landingScreen,
        mapSection,
        dotsContainer,
        dotDetails,
        dots,
      };
    },
  };
  </script>
  
  <style scoped>
  /* General Styles */
  .tapestry-container {
    font-family: Arial, sans-serif;
    overflow-x: hidden;
  }
  
  /* Landing Screen */
  .landing-screen {
    height: 100vh;
    background: #f9f5f2;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    position: relative;
  }
  
  .artifact-name {
    font-size: 4rem;
    font-weight: bold;
    color: #333;
    z-index: 2;
  }
  
  .lines-container {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
  }
  
  .line {
    height: 2px;
    background: #333;
    transform-origin: left;
    transform: scaleX(0);
  }
  
  /* Map Section */
  .map-section {
    height: 100vh;
    background: #222;
    position: relative;
    overflow: hidden;
    display: flex;
    justify-content: center;
    align-items: center;
  }
  
  .dots-container {
    position: relative;
    width: 100%;
    height: 100%;
  }
  
  .dot {
    width: 20px;
    height: 20px;
    border-radius: 50%;
    background: #ff5722;
    position: absolute;
    transform-origin: center center;
  }
  
  .dot-1 { top: 20%; left: 30%; }
  .dot-2 { top: 50%; left: 70%; }
  .dot-3 { top: 80%; left: 40%; }
  .dot-4 { top: 30%; left: 60%; }
  
  /* Dot Details Section */
  .dot-details {
    height: 100vh;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    background: #f9f5f2;
  }
  
  .dot-center {
    width: 20px;
    height: 20px;
    border-radius: 50%;
    background: #ff5722;
    margin-bottom: 20px;
  }
  
  .text {
    text-align: center;
    font-size: 1.2rem;
    color: #333;
    opacity: 0;
  }
  </style>