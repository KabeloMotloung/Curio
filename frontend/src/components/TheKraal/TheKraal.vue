<template>
  <BackButton />
  <ScrollProgress :sections="SECTIONS" />

  <div
    ref="loaderOverlay"
    class="fixed inset-0 z-50 flex items-center justify-center bg-[#111111] transition-opacity duration-1000"
    :class="{ 'opacity-0 pointer-events-none': !isLoading }"
  >
    <div class="flex flex-col items-center">
      <!-- Sleek spinner loader -->
      <div class="relative w-16 h-16 mb-5">
        <div
          class="absolute inset-0 border-2 border-white/10 rounded-full"
        ></div>
        <div
          class="absolute inset-0 border-2 border-transparent border-t-white rounded-full animate-spinner"
        ></div>
      </div>
      <p class="text-white text-base font-raleway uppercase tracking-widest">
        Loading<span ref="loadingDots">.</span>
      </p>
    </div>
  </div>

  <div class="tapestry-container">
    <!-- Landing Screen -->
    <section class="landing-screen" ref="landingScreen">
      <!-- Animated Strings -->
      <svg class="animated-strings" ref="stringsSvg">
        <path
          v-for="(path, index) in stringPaths"
          :key="index"
          :d="path.d"
          class="string-path"
          :style="{ '--delay': `${index * 0.5}s` }"
        />
      </svg>

      <h1 class="artifact-name">The Kraal</h1>
      <h2 class="artifact-author">Mary Shabalala and Josephine Memela</h2>
      <div class="lines-container">
        <div class="line" v-for="n in 8" :key="n"></div>
      </div>
      <ScrollArrow />
    </section>

    <!-- Timeline Component -->
    <Timeline :events="timelineEvents" ref="timelineComponent" />

    <!-- Border Spiral Section -->
    <div class="border-spiral-section" ref="borderSpiralSection">
      <svg ref="spiralSvg" class="spiral-svg"></svg>
      <div class="text-container">
        <h3
          v-for="(text, index) in messages"
          :key="index"
          class="message-text"
          :class="{ active: currentMessage === index }"
        >
          {{ text }}
        </h3>
      </div>
    </div>

    <!-- Clock Section -->
    <div class="clock-section" ref="clockSection">
      <div>
        <div class="kraal">
          <div class="kraal-image-stack">
            <img
              src="./assets/wovenFrame.jpg"
              alt="Woven Frame"
              class="woven-frame"
            />
            <img
              src="./assets/theKraal.jpg"
              alt="The Kraal"
              class="kraal-image-top"
            />
          </div>
        </div>
      </div>
      <div class="clock-container">
        <div>
          <ClockModel />
        </div>
        <div class="clock-text">
          <h3
            v-for="(text, index) in clockMessages"
            :key="index"
            class="clock-message"
            :class="{ active: currentClockMessage === index }"
          >
            {{ text }}
          </h3>
        </div>
      </div>
    </div>

    <!-- Black Section -->
    <div class="black-section">
      <div class="kraal">
        <PageEnd
          nextArtifactTitle="Spindle Whorl"
          nextArtifactPath="/spindle-whorl"
          bgColor="#1a1a1a"
          textColor="#ffffff"
          :isVisible="true"
        />
      </div>
    </div>
  </div>
</template>

<script>
import { ref, onMounted } from "vue";
import { gsap } from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";
import Background from "./components/Background.vue";
import Timeline from "./components/HorizontalTimeline.vue";
import BackButton from "./components/BackButton.vue";
import ScrollProgress from "../UniversalComponents/ScrollProgress.vue";
import ScrollArrow from "../UniversalComponents/ScrollArrow.vue";
import PageEnd from "./components/PageEnd.vue";
import ClockModel from "./components/ClockModel.vue";

gsap.registerPlugin(ScrollTrigger);

export default {
  name: "Tapestry",
  components: {
    Background,
    Timeline,
    BackButton,
    ScrollProgress,
    ScrollArrow,
    ClockModel,
    PageEnd,
  },
  setup() {
    const landingScreen = ref(null);
    const backgroundSection = ref(null);
    const timelineSection = ref(null);
    const borderSpiralSection = ref(null);
    const spiralSvg = ref(null);
    const timelineComponent = ref(null);
    const clockSection = ref(null);
    const minuteHand = ref(null);
    const currentClockMessage = ref(0);
    const loaderOverlay = ref(null);
    const isLoading = ref(true);

    const SECTIONS = [
      { position: 0.00, name: 'Landing' },
      { position: 0.099, name: 'Timeline' },
      { position: 0.16, name: 'Background Info' },
      { position: 0.75, name: 'Image Showcase' },
      { position: 1, name: 'Page End' }
    ];

    const clockMessages = [
      "Four and a half months",
      "Can you imagine?",
      "It Took  four and a half months to create The Kraal",
      "A testament to time, patience and dedication",
    ];

    const timelineEvents = [
      {
        date: "1947",
        description: "Mary Shabalala born in Amoibe.",
        details:
          "Mary Shabalala, born around 1947 in Amoibe near Rorke's Drift, begins her journey as a tapestry weaver linked to the local Lutheran mission.",
        fact: "Recorded as Mary Shabalala (Amoibe, 1947), she later trained at Rorke's Drift weaving studio."
      },
      {
        date: "mid-1960s",
        description: "Josephine Memela joins the weaving studio.",
        details:
          "Josephine Memela, from Vant's Drift, starts assisting and training in tapestry weaving at the Evangelical Lutheran Church Art & Craft Centre.",
        fact: "Production records from March 1966 list Josephine Memela as assisting in the studio's tapestry work."
      },
      {
        date: "1974",
        description: "Major collaborative tapestry completed.",
        details:
          "Mary Shabalala and the younger Josephine Memela jointly weave a large-scale tapestry under master-weaver Allina Ndebele's guidance, using hand-spun karakul wool and linen on a Swedish loom.",
        fact: "They co-wove the piece over 4½ months under Allina Ndebele's supervision."
      },
      {
        date: "1974-1976",
        description: "Continued weaving practice at Rorke's Drift.",
        details:
          "Both women remain active in the studio's tapestry production during a pivotal era for the Centre's creative output.",
        fact: "They are mentioned among Rorke's Drift weavers during exhibitions and sales in this period."
      }
    ];


    const messages = [
      "Each thread is a memory — not just of history, but of the hands that spun it.",
      "Tapestry is slow work — it teaches patience, precision, and how to tell a story without words.",
      "To weave is to resist — especially when your voice is denied, your history erased.",
      "The loom is a place of meditation. Every shuttle pass is a heartbeat, every knot a decision.",
      "Weaving The Kraal wasn't just art — it was honouring an ancestor, stitching pride into wool.",
      "Tapestry holds weight — not just in wool, but in legacy. It outlives the weaver.",
      "Even silence has a texture in tapestry. What's left unwoven is as powerful as what's shown.",
      "We don't just weave what we see — we weave what we carry, what we lost, and what we hope for.",
    ];
    const currentMessage = ref(0);

    // String paths data
    const stringPaths = ref([
      { d: "M-800,50 L-800,50" },
      { d: "M1800,120 L1800,120" },
      { d: "M-800,190 L-800,190" },
      { d: "M1800,260 L1800,260" },
      { d: "M-800,330 L-800,330" },
      { d: "M1800,400 L1800,400" },
      { d: "M-800,470 L-800,470" },
      { d: "M1800,540 L1800,540" },
      { d: "M-800,610 L-800,610" },
      { d: "M1800,680 L1800,680" },
      { d: "M-800,750 L-800,750" },
      { d: "M1800,820 L1800,820" },
    ]);

    onMounted(() => {
      isLoading.value = true; // Ensure loading is shown on mount
      setTimeout(() => {
        isLoading.value = false;
      }, 2000); // 2 seconds

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
            end: "+=3000",
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
        const rect = document.createElementNS(
          "http://www.w3.org/2000/svg",
          "rect"
        );
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
      gsap
        .timeline({
          scrollTrigger: {
            trigger: borderSpiralSection.value,
            start: "top top",
            end: "+=22000",
            scrub: true,
            pin: true,
            anticipatePin: 1,
            pinSpacing: true,
          },
        })
        .to(
          borders.map((b) => b.rect),
          {
            strokeDashoffset: 0,
            stagger: {
              each: 3 / numBorders,
            },
            ease: "none",
          }
        )
        .to(
          borderSpiralSection.value,
          {
            opacity: 0,
            duration: 0.5,
            ease: "none",
          },
          ">"
        );

      // Text sequence animation - separate timeline
      const textTimeline = gsap.timeline({
        scrollTrigger: {
          trigger: borderSpiralSection.value,
          start: "top top",
          end: "+21000",
          scrub: true,
        },
      });

      // Add text animations to the timeline
      messages.forEach((_, index) => {
        textTimeline
          .to(`.message-text:nth-child(${index + 1})`, {
            opacity: 1,
            y: 0,
            duration: 0.5,
            ease: "power2.out",
          })
          .to(
            `.message-text:nth-child(${index + 1})`,
            {
              opacity: 0,
              y: -20,
              duration: 0.5,
              ease: "power2.in",
            },
            "+=1"
          ); // Add a 1-second delay between messages
      });

      const clockTimeline = gsap.timeline({
        scrollTrigger: {
          trigger: clockSection.value,
          start: "top top",
          end: "+=8000",
          scrub: true,
          pin: true,
          anticipatePin: 1,
        },
      });

      // Fade in Clock Section before pinning
      clockTimeline.fromTo(
        clockSection.value,
        { opacity: 0, backgroundColor: "#ffffff" },
        { opacity: 1, backgroundColor: "#f9f5f2", duration: 1.5 }
      );

      clockMessages.forEach((_, index) => {
        clockTimeline
          .to(
            `.clock-message:nth-child(${index + 1})`,
            { opacity: 1, duration: 0.5 },
            index * 3
          )
          .to(
            `.clock-message:nth-child(${index + 1})`,
            { opacity: 0, duration: 0.5 },
            (index + 1) * 3
          );
      });

      // Fade out Clock Section at the end of the pin
      clockTimeline.to(clockSection.value, {
        opacity: 0,
        backgroundColor: "#99724B",
        duration: 1,
      });

      gsap.to(minuteHand.value, {
        rotation: 360 * 12,
        transformOrigin: "50% 50%",
        ease: "none",
        scrollTrigger: {
          trigger: clockSection.value,
          start: "top top",
          end: "+=3000",
          scrub: true,
        },
      });

      // Animate strings with growing/shrinking motion
      const strings = document.querySelectorAll(".string-path");
      strings.forEach((string, index) => {
        // Create a timeline for each string
        const tl = gsap.timeline({
          repeat: -1,
          delay: index * 0.2,
        });

        // Determine if string grows from left or right
        const isLeftToRight = index % 2 === 0;
        const startX = isLeftToRight ? -800 : 1800;
        const endX = isLeftToRight ? 1800 : -800;

        // Create growing/shrinking motion
        tl.to(string, {
          duration: 4,
          attr: {
            d: `M${startX},${50 + index * 70} L${endX},${50 + index * 70}`,
          },
          ease: "power1.inOut",
          repeat: -1,
          yoyo: true,
        });
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
      clockSection,
      minuteHand,
      clockMessages,
      currentClockMessage,
      stringPaths,
      isLoading,
      SECTIONS
    };
  },
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
  font-weight: 300;
  src:
    local("Raleway"),
    url("/fonts/Raleway/static/Raleway-Light.ttf") format("truetype");
  font-display: swap;
}
/* General Styles */
.tapestry-container {
  font-family: "Raleway", Arial, sans-serif;
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
  overflow: hidden;
}

.artifact-name {
  font-size: 3rem;
  font-weight: bold;
  color: #333;
  z-index: 2;
  margin-bottom: 0;
}

.artifact-author {
  font-weight: lighter;
  color: #6c6c6c;
  z-index: 2;
  margin-bottom: 2px;
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
  background: #c8a078;
  transform-origin: left;
  transform: scaleX(0);
}

/* Border Spiral Section */
.border-spiral-section {
  position: relative;
  width: 100vw;
  height: 100vh;
  background: #4f2d2c;
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
  background: linear-gradient(to bottom, #ffffff, rgb(220, 185, 151));
  display: flex;
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
  width: 100%;
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
  transition:
    opacity 0.5s ease,
    transform 0.5s ease;
}

.message-text.active {
  opacity: 1;
  transform: translateY(0);
}

.clock-section {
  position: relative;
  width: 100vw;
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: space-around;
  background-color: #ffffff;
  overflow: hidden;
  transition: background-color 0.5s ease;
  z-index: 20;
}

.clock-container {
  position: relative;
  display: flex;
  flex-direction: column;
  width: 300px;
  height: 300px;
}

.clock {
  width: 100%;
  height: 100%;
}

.clock-text {
  position: absolute;
  top: 110%;
  left: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
  font-size: 1.3rem;
  color: #333;

  display: flex;
  width: 30vw;
  height: 50px;
  align-items: center;
  justify-content: center;
}

.clock-message {
  position: absolute;
  opacity: 0;
  transition: opacity 0.5s ease;
}

.clock-message.active {
  opacity: 1;
}

.black-section {
  width: 100vw;
  height: 100vh;
  background: linear-gradient(to bottom, #ffffff, rgb(220, 185, 151));
  display: flex;
  align-items: center;
  justify-content: center;
}

.animated-strings {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  pointer-events: none;
  z-index: 1;
  overflow: visible;
}

.string-path {
  fill: none;
  stroke: rgba(200, 160, 120, 0.264);
  stroke-width: 1.5;
  stroke-linecap: round;
  stroke-dasharray: 4 8; /* Creates dotted pattern */
}

@keyframes spinner {
  to {
    transform: rotate(360deg);
  }
}

.animate-spinner {
  animation: spinner 1s linear infinite;
}

.kraal-image-stack {
  position: relative;
  width: 650px;
  height: 650px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.woven-frame {
  position: absolute;
  top: 0;
  left: 2;
  width: 100%;
  height: 100%;
  z-index: 1;
  object-fit: contain;
}

.kraal-image-top {
  position: absolute;
  top: 2;
  left: 2;
  width: 100%;
  height: 100%;
  z-index: 2;
  object-fit: contain;
}
</style>
