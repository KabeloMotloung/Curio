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

      <!-- Border Spiral Section -->
      <div class="border-spiral-section" ref="borderSpiralSection">
        <svg ref="spiralSvg" class="spiral-svg"></svg>
        <div class="text-container">
          <h2 v-for="(text, index) in messages" :key="index" class="message-text" :class="{ 'active': currentMessage === index }">
            {{ text }}
          </h2>
        </div>
      </div>

      <!-- Black Section -->
      <div class="black-section">
        <div class = "kraal">
          <img src="../assets/the kraal.jpg" alt="The Kraal" class="kraal-image" />
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
      const borderSpiralSection = ref(null);
      const spiralSvg = ref(null);
      const timelineComponent = ref(null);

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
      ];

      const messages = ["hello", "how are you", "wow", "testing", "we are real"];
      const currentMessage = ref(0);
  
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

        // Border Spiral Animation
        const numBorders = 10; // Number of spirals
        const paddingStep = 20; // px between each border
        const width = borderSpiralSection.value.offsetWidth;
        const height = borderSpiralSection.value.offsetHeight;

        // Clear SVG
        spiralSvg.value.innerHTML = "";

        // Draw rectangles
        const borders = [];
        for (let i = 0; i < numBorders; i++) {
          const pad = i * paddingStep;
          const rect = document.createElementNS("http://www.w3.org/2000/svg", "rect");
          rect.setAttribute("x", pad);
          rect.setAttribute("y", pad);
          rect.setAttribute("width", width - pad * 2);
          rect.setAttribute("height", height - pad * 2);
          rect.setAttribute("fill", "none");
          rect.setAttribute("stroke", "#fff");
          rect.setAttribute("stroke-width", "2");
          spiralSvg.value.appendChild(rect);

          // Prepare for animation
          const length = 2 * (width + height - 4 * pad);
          rect.style.strokeDasharray = length;
          rect.style.strokeDashoffset = length;
          borders.push({ rect, length });
        }

        // Animate each border in sequence as you scroll
        gsap.timeline({
          scrollTrigger: {
            trigger: borderSpiralSection.value,
            start: "top top",
            end: "+=4000",
            scrub: true,
            pin: true,
            anticipatePin: 1,
            pinSpacing: true
          }
        })
        .to(borders.map(b => b.rect), {
          strokeDashoffset: 0,
          stagger: {
            each: 3 / numBorders,
          },
          ease: "none"
        })
        .to(borderSpiralSection.value, {
          opacity: 0,
          duration: 0.5,
          ease: "none"
        }, ">");

        // Text sequence animation - separate timeline
        const textTimeline = gsap.timeline({
          scrollTrigger: {
            trigger: borderSpiralSection.value,
            start: "top top",
            end: "+=4000",
            scrub: true,
          }
        });

        // Add text animations to the timeline
        messages.forEach((_, index) => {
          textTimeline
            .to(`.message-text:nth-child(${index + 1})`, {
              opacity: 1,
              y: 0,
              duration: 0.5,
              ease: "power2.out"
            })
            .to(`.message-text:nth-child(${index + 1})`, {
              opacity: 0,
              y: -20,
              duration: 0.5,
              ease: "power2.in"
            }, "+=1"); // Add a 1-second delay between messages
        });
      });
  
      return {
        landingScreen,
        backgroundSection,
        timelineSection,
        borderSpiralSection,
        spiralSvg,
        timelineComponent,
        messages,
        currentMessage,
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
    background: #C8A078;
    transform-origin: left;
    transform: scaleX(0);
  }

  /* Border Spiral Section */
  .border-spiral-section {
    position: relative;
    width: 100vw;
    height: 100vh;
    background: #4F2D2C;
    overflow: hidden;
  }

  .spiral-svg {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    pointer-events: none;
  }

  /* Black Section */
  .black-section {
    width: 100vw;
    height: 100vh;
    background: linear-gradient(to bottom, #ffffff, #4F2D2C);
    display:flex;
    align-items: center;
    justify-content: center;
  }

  .component-section {
    min-height: 100vh;
    width: 100%;
    position: relative;
  }

  .text-container {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    z-index: 2;
    text-align: center;
    width:100%;
  }

  .message-text {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    font-size: 3rem;
    color: #fff;
    opacity: 0;
    transform: translateY(20px);
    transition: opacity 0.5s ease, transform 0.5s ease;
  }

  .message-text.active {
    opacity: 1;
    transform: translateY(0);
  }
  </style>