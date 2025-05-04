<template>
    <div class="tapestry-container">
      <!-- Landing Screen -->
      <section class="landing-screen" ref="landingScreen">
        <h1 class="artifact-name">The Kraal</h1>
        <div class="lines-container">
          <div class="line" v-for="n in 10" :key="n"></div>
        </div>
      </section>

      <!-- Timeline Component -->
      <Timeline :events="timelineEvents" ref="timelineComponent"/>

      <Background/>

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
    </div>
  </template>
  
  <script>
  import { ref, onMounted } from "vue";
  import { gsap } from "gsap";
  import { ScrollTrigger } from "gsap/ScrollTrigger";
  import Background from "./Background.vue";
  import Timeline from "./HorizontalTimeline.vue";

  gsap.registerPlugin(ScrollTrigger);
  
  export default {
    name: "Tapestry",
    components: {
     Background,
     Timeline,
    },
    setup() {
      const landingScreen = ref(null);
      const backgroundSection = ref(null);
      const timelineSection = ref(null);
      const mapSection = ref(null);
      const dotsContainer = ref(null);
      const backgroundComponent = ref(null);
      const timelineComponent = ref(null);
      const dotDetails = ref([]);
      const dots = [
        { text: ["This is the first dot.", "It represents the beginning.", "A story starts here."] },
        { text: ["This is the second dot.", "It represents growth.", "A journey continues."] },
        { text: ["This is the third dot.", "It represents challenges.", "A story unfolds."] },
        { text: ["This is the fourth dot.", "It represents triumph.", "A story concludes."] },
      ];

      const timelineEvents = [
        {
          date: "900 AD",
          description: "First evidence of fiber spinning in Mapungubwe.",
          details: "Archaeological excavations revealed simple spindle whorls made from clay, marking the earliest evidence of textile production in the region.",
          fact: "These early spindle whorls weighed between 15-30 grams - perfect for spinning indigenous cotton."
        },
        {
          date: "1000 AD",
          description: "Mapungubwe's rise as a key economic and political center.",
          details: "As Mapungubwe grew in importance, so did the craftsmanship of its spindle whorls, becoming more uniform and balanced for improved thread production.",
          fact: "Specialized spindle whorls for different fabric types began appearing around this time."
        },
        {
          date: "1200 AD",
          description: "Peak of Mapungubwe's textile production.",
          details: "The spindle whorls from this period show remarkable sophistication in design and craftsmanship.",
          fact: "Chemical analysis revealed traces of indigenous cotton and wild silk in the fibers."
        },
        {
          date: "1290 AD",
          description: "Final phase of Mapungubwe's spindle whorl production.",
          details: "The last known spindle whorls from Mapungubwe show the culmination of centuries of refinement.",
          fact: "These artifacts represent the height of pre-colonial African textile technology."
        }
      ]
  
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

        // Background Component Animation
        gsap.fromTo(
          backgroundSection.value,
          { opacity: 0 },
          {
            opacity: 1,
            duration: 1,
            scrollTrigger: {
              trigger: backgroundSection.value,
              start: "top center",
              end: "bottom center",
              scrub: true,
              pin: true,
            },
          }
        );

        // Timeline Component Animation
        gsap.fromTo(
          timelineSection.value,
          { opacity: 0 },
          {
            opacity: 1,
            duration: 1,
            scrollTrigger: {
              trigger: timelineSection.value,
              start: "top center",
              end: "bottom center",
              scrub: true,
              pin: true,
            },
          }
        );
  
        // Map Section Animation
        const mainTimeline = gsap.timeline({
          scrollTrigger: {
            trigger: mapSection.value,
            start: "top top",
            end: "+=400%",
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
        backgroundSection,
        timelineSection,
        mapSection,
        dotsContainer,
        backgroundComponent,
        timelineComponent,
        dotDetails,
        dots,
        timelineEvents,
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

  .component-section {
    min-height: 100vh;
    width: 100%;
    position: relative;
  }
  </style>