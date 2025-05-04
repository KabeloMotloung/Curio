<template>
    <BackButton />
    <ScrollProgress :totalSections="4" />
    <ScrollArrow/>
    <div class="tapestry-container">
      <!-- Landing Screen -->
      <section class="landing-screen" ref="landingScreen">
        <h1 class="artifact-name">Life of Shaka</h1>
        <h2>Mary Shabalala and Josephine Memela</h2>
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
          <h3 v-for="(text, index) in messages" :key="index" class="message-text" :class="{ 'active': currentMessage === index }">
            {{ text }}
          </h3>
        </div>
      </div>

      <!-- Black Section -->
      <div class="black-section">
        <div class = "kraal">
          <img src="../assets/shaka.jpg" alt="The Kraal" class="kraal-image" />
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
  import BackButton from "../../UniversalComponents/BackButton.vue";
  import ScrollProgress from "../../UniversalComponents/ScrollProgress.vue";
  import ScrollArrow from "../../UniversalComponents/ScrollArrow.vue";


  gsap.registerPlugin(ScrollTrigger);
  
  export default {
    name: "Tapestry",
    components: {
     Background,
     Timeline,
     BackButton,
     ScrollProgress,
     ScrollArrow,
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
          "date": "1973",
          "description": "A vision woven in Rorke's Drift.",
          "details": "At the Evangelical Lutheran Church Art and Craft Centre in Rorke's Drift, artists Mary Shabalala and Josephine Memela begin conceptualizing a tapestry that would honour one of Africa's most legendary figures: King Shaka Zulu.",
          "fact": "This centre had become a powerful incubator of Black South African creativity during apartheid, giving rural women the tools to tell their stories through wool and weave."
        },
        {
          "date": "1974",
          "description": "The weaving begins: Life of Shaka takes form.",
          "details": "Using a linocut design by artist Caiphas Nxumalo as their guide, the weavers begin the intricate process of translating his imagery into textile. The piece spans over 4.5 meters, and every thread tells part of Shaka’s story.",
          "fact": "It took four and a half months of dedicated labour to complete, under the direction of master weaver Allina Ndebele."
        },
        {
          "date": "1974 (late)",
          "description": "Threads of resistance and remembrance.",
          "details": "The tapestry narrates the birth, rise, and tragic death of Shaka — scenes of military strategy, royal lineage, and betrayal are frozen in wool. Yet it also speaks to a broader African legacy: pride, power, and perseverance in the face of erasure.",
          "fact": "The use of pure karakul wool and linen symbolized a reclaiming of indigenous craft at a time when Black South African expression was tightly controlled."
        },
        {
          "date": "Mid-1970s",
          "description": "A journey abroad: the tapestry leaves South Africa.",
          "details": "Shortly after its creation, the Life of Shaka tapestry becomes part of a private collection in Sweden. For decades, it remains there—far from the land and people whose history it honors.",
          "fact": "Despite its displacement, the tapestry continued to speak silently of Zulu resistance and the artistry of rural South African women."
        },
        {
          "date": "2024",
          "description": "Return of the king: the tapestry comes home.",
          "details": "After fifty years abroad, the tapestry is returned to South Africa. Its homecoming is both symbolic and historic—a restoration of cultural memory and artistic legacy.",
          "fact": "Now recognized as a national treasure, the tapestry bridges generations, bringing Shaka’s legacy—and that of the women who wove him—back into the collective South African imagination."
        }
      

      ];

      const messages = [
        "Each thread is a memory — not just of history, but of the hands that spun it.",
        "Tapestry is slow work — it teaches patience, precision, and how to tell a story without words.",
        "To weave is to resist — especially when your voice is denied, your history erased.",
        "The loom is a place of meditation. Every shuttle pass is a heartbeat, every knot a decision.",
        "Weaving the Life of Shaka wasn’t just art — it was honouring an ancestor, stitching pride into wool.",
        "Tapestry holds weight — not just in wool, but in legacy. It outlives the weaver.",
        "Even silence has a texture in tapestry. What’s left unwoven is as powerful as what’s shown.",
        "We don't just weave what we see — we weave what we carry, what we lost, and what we hope for."
      ];
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
    background: linear-gradient(to bottom, #ffffff, #99724B);
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
    font-size: 1.5rem;
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