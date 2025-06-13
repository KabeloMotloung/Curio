<template>
    <BackButton />
    <ScrollProgress :totalSections="4" />

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

      <div class="tapestry-container">
      <!-- Landing Screen -->
      <section class="landing-screen" ref="landingScreen">
        <!-- Animated Strings -->
        <svg class="animated-strings" ref="stringsSvg">
          <path v-for="(path, index) in stringPaths" 
                :key="index" 
                :d="path.d" 
                class="string-path"
                :style="{ '--delay': `${index * 0.5}s` }"
          />
        </svg>
        
        <h1 class="artifact-name">Life of Shaka</h1>
        <h2 class="artifact-author">Mary Shabalala and Josephine Memela</h2>
        <div class="lines-container">
          <div class="line" v-for="n in 8" :key="n"></div>
        </div>
        <ScrollArrow />
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

      <!-- Clock Section -->
      <div class="clock-section" ref="clockSection">
        <div class="clock-container">
          <div>
           <ClockModel />
          </div>
          <div class="clock-text">
            <h3 v-for="(text, index) in clockMessages" :key="index" class="clock-message" :class="{ active: currentClockMessage === index }">
              {{ text }}
            </h3>
          </div>
        </div>
      </div>
  

      <!-- Black Section -->
      <div class="black-section">
        <div class = "kraal">
          <img src="../assets/shaka.jpg" alt="The Kraal" class="kraal-image" />
        </div>
      </div>


    <div class="image-transition-section">
      <div class="slide-view base-slide" data-index="1">
        <div class="background-layer" style="background-image: url('./assets/TheDiscoveryPaintingImage.jpg')"></div>
        <div class="sidebar-content">
          <div class="project-number">[01]</div>
          <h2 class="project-title">The Discovery</h2>
          <div class="project-tags">
            <!-- <span>CULTURAL SYMBOLISM</span>
            <span>FEMALE IDENTITY</span>
            <span>ARTISTIC EXPRESSION</span> -->
          </div>
          <p class="slide-description">A monumental triptych mural by South African artist Alexis Preller, originally commissioned for the Transvaal 
            Provincial Administration. Measuring over 13 meters in width, the painting portrays an imagined encounter between European explorers and 
            African civilizations during the so-called "Age of Discovery." Rather than glorify colonization, Preller's work blends African and 
            classical European symbolism to challenge colonial narratives. Rich in surrealist and mythological imagery, it presents Africa as 
            culturally advanced and spiritually significant, questioning Western assumptions of superiority..</p>
          <a class="view-project-link" href="https://javettup.art/artworks/discovery">VIEW DETAILS <span class="arrow">→</span></a>
        </div>
        <div class="image-frame-container">
          <img alt="Early Designs" src="./assets/TheDiscoveryPaintingImage.jpg">
          <div class="image-caption">South African 1959</div>
        </div>
      </div>

      <div class="wipe-container" data-index="2">
        <div class="slide-view" data-index="2">
          <div class="background-layer"></div>
          <div class="sidebar-content">
            <div class="project-number">[02]</div>
            <h2 class="project-title">Alexis Preller</h2>
            <div class="project-tags">
              <!-- <span>PRODUCTION PROCESS</span>
              <span>CRAFTING TECHNIQUES</span>
              <span>MATERIAL TRANSFORMATION</span> -->
            </div>
            <p class="slide-description">Pretoria-born artist Alexis Preller studied art in London at the Westminster School of Art and expanded 
              his knowledge of art and art history by reading voraciously and travelling widely in Europe and Africa. He studied Egyptian, 
              ancient Greek, Etruscan, early Renaissance and southern and central African art and culture, in particular, and created an art 
              that was of his own place and time rather than a continuation of either traditional European practice or avant-garde Modernism. He
              visited Ndebele settlements near Pretoria in the late 1940s and early 1950s, and the ‘Mapogga’ women in their distinctive 
              traditional costume and the colourful geometric wall paintings that decorated the homesteads appear in his work from this time. 
              His work became progressively more abstract in later years, informed by his interest in space travel and discovery, and his focus
                shifted from the local and the African to encompass the universal.</p>
            <a class="view-project-link" href="https://www.straussart.co.za/artists/alexis-preller">VIEW DETAILS <span class="arrow">→</span></a>
          </div>
          <div class="image-frame-container">
            <img alt="South African 1911-1975" src="./assets/alexis-preller.jpg">
            <div class="image-caption">South African 1911-1975</div>
          </div>
        </div>
      </div>

        <div class="scroll-progress">
          <div class="progress-track">
            <div class="progress-fill"></div>
          </div>
          <div class="progress-numbers">
            <span class="current">01</span>
            <span class="separator">/</span>
            <span class="total">02</span>
          </div>
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
  import BackButton from "./BackButton.vue";
  import ScrollProgress from "../../UniversalComponents/ScrollProgress.vue";
  import ScrollArrow from '../../UniversalComponents/ScrollArrow.vue';
  import ClockModel from "./ClockModel.vue";

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

    const clockMessages = [
      "Four and a half months",
      "Can you imagine?",
      "It Took  four and a half months to create the Life of Shaka",
      "A testament to time, patience and dedication",
    ];

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
          "details": "Using a linocut design by artist Caiphas Nxumalo as their guide, the weavers begin the intricate process of translating his imagery into textile. The piece spans over 4.5 meters, and every thread tells part of Shaka's story.",
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
          "fact": "Now recognized as a national treasure, the tapestry bridges generations, bringing Shaka's legacy—and that of the women who wove him—back into the collective South African imagination."
        }
      

      ];

      const messages = [
        "Each thread is a memory — not just of history, but of the hands that spun it.",
        "Tapestry is slow work — it teaches patience, precision, and how to tell a story without words.",
        "To weave is to resist — especially when your voice is denied, your history erased.",
        "The loom is a place of meditation. Every shuttle pass is a heartbeat, every knot a decision.",
        "Weaving the Life of Shaka wasn't just art — it was honouring an ancestor, stitching pride into wool.",
        "Tapestry holds weight — not just in wool, but in legacy. It outlives the weaver.",
        "Even silence has a texture in tapestry. What's left unwoven is as powerful as what's shown.",
        "We don't just weave what we see — we weave what we carry, what we lost, and what we hope for."
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
        { d: "M1800,820 L1800,820" }
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
            end: "+=22000",
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
            end: "+21000",
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
 clockTimeline.fromTo(clockSection.value, 
  { opacity: 0, backgroundColor: "#ffffff" },
  { opacity: 1, backgroundColor: "#f9f5f2", duration: 1.5 }
);

      clockMessages.forEach((_, index) => {
        clockTimeline
          .to(`.clock-message:nth-child(${index + 1})`, { opacity: 1, duration: 0.5 }, index * 3)
          .to(`.clock-message:nth-child(${index + 1})`, { opacity: 0, duration: 0.5 }, (index + 1) * 3);
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
        }
      });

      // Animate strings with growing/shrinking motion
      const strings = document.querySelectorAll('.string-path');
      strings.forEach((string, index) => {
        // Create a timeline for each string
        const tl = gsap.timeline({
          repeat: -1,
          delay: index * 0.2
        });

        // Determine if string grows from left or right
        const isLeftToRight = index % 2 === 0;
        const startX = isLeftToRight ? -800 : 1800;
        const endX = isLeftToRight ? 1800 : -800;

        // Create growing/shrinking motion
        tl.to(string, {
          duration: 4,
          attr: {
            d: `M${startX},${50 + index * 70} L${endX},${50 + index * 70}`
          },
          ease: "power1.inOut",
          repeat: -1,
          yoyo: true
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
  /* General Styles */
  .tapestry-container {
    font-family: 'Raleway', Arial, sans-serif; 
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
    margin-bottom:0;
  }

  .artifact-author{
    font-weight: lighter;
    color: #6c6c6c;
    z-index: 2;
    margin-bottom:2px;
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

  .clock-section {
  position: relative;
  width: 100vw;
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
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
  left:50%;
  transform: translate(-50%, -50%);
  text-align: center;
  font-size: 1.5rem;
  color: #333;
  
  display:flex;
  width:100vw;
  height:50px;
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
  background: linear-gradient(to bottom, #ffffff, #99724b);
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
  to { transform: rotate(360deg); }
}

.animate-spinner {
  animation: spinner 1s linear infinite;
}

.image-transition-section {
  position: relative;
  height: 100vh;
  width: 100%;
  background-color: #111;
  overflow: hidden;
}

.slide-view {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  z-index: 1;
  background-color: #111;
}

.base-slide {
  z-index: 1;
  transition: opacity 0.3s ease, visibility 0.3s ease;
}

.background-layer {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-position: center;
  background-size: cover;
  opacity: 0.2;
}

.sidebar-content {
  position: absolute;
  left: 5%;
  top: 50%;
  transform: translateY(-50%);
  color: white;
  z-index: 10;
  width: 35%;
}

.project-number {
  font-size: 1rem;
  color: #888;
  margin-bottom: 0.8rem;
  font-family: monospace;
  margin-top: -40px;
}

.project-title {
  font-size: 3.2rem;
  color: #4e83ff;
  margin-bottom: 1.8rem;
  line-height: 1.1;
}

/* Enhance the transitions to be smoother */
.project-title {
  transition: opacity 0.5s ease-out, transform 0.5s ease-out;
  transform: translateY(0);
}

.project-tags {
  display: flex;
  flex-direction: column;
  margin-bottom: 2.5rem;
}

.project-tags span {
  font-size: 0.8rem;
  color: #bbb;
  margin-bottom: 0.5rem;
  letter-spacing: 0.05rem;
}

.project-tags span {
  display: inline-block;
  padding: 3px 0;
  transition: opacity 0.5s ease-out, transform 0.5s ease-out;
  transform: translateY(0);
}

.slide-description {
  font-size: 1.1rem;
  line-height: 1.5;
  color: #ccc;
  margin-bottom: 1.5rem;
}

.view-project-link {
  display: inline-block;
  color: white;
  text-decoration: none;
  font-size: 0.9rem;
  letter-spacing: 0.1rem;
  padding-bottom: 0.5rem;
  border-bottom: 1px solid #4e83ff;
  transition: all 0.3s ease;
}

.view-project-link:hover {
  color: #4e83ff;
}

.view-project-link .arrow {
  display: inline-block;
  transition: transform 0.3s ease;
}

.view-project-link:hover .arrow {
  transform: translateX(5px);
}

/* Image frame styling */
.image-frame-container {
  position: absolute;
  width: 50%;
  height: 60vh;
  right: 5%;
  overflow: hidden;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
  border-radius: 2px;
  z-index: 5;
}

.image-frame-container img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.image-caption {
  position: absolute;
  bottom: 1.5rem;
  left: 1.5rem;
  color: white;
  font-size: 1.2rem;
  font-weight: 300;
  background-color: rgba(0, 0, 0, 0.5);
  padding: 0.5rem 1rem;
  border-radius: 4px;
  backdrop-filter: blur(5px);
}


/* Ensure captions stay within their masks */
.image-caption {
  position: absolute;
  bottom: 1.5rem;
  left: 1.5rem;
  color: white;
  font-size: 1.2rem;
  font-weight: 300;
  background-color: rgba(0, 0, 0, 0.5);
  padding: 0.5rem 1rem;
  border-radius: 4px;
  backdrop-filter: blur(5px);
  z-index: 5;
}

/* Wipe containers cover the entire screen */
.wipe-container {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  /* Start from bottom (fully hidden) */
  clip-path: polygon(0% 100%, 100% 100%, 100% 100%, 0% 100%);
  z-index: 10;
  background-color: #111;
}

.wipe-container[data-index="2"] {
  z-index: 10;
}

.wipe-container[data-index="3"] {
  z-index: 11;
}

.wipe-container[data-index="4"] {
  z-index: 12;
}

/* Create a visible wipe line with glow effect */
.wipe-container::after {
  content: '';
  position: absolute;
  left: 0;
  right: 0;
  height: 2px;
  background: rgba(118, 99, 255, 0.9);
  top: 0;
  box-shadow: 0 0 15px rgba(118, 99, 255, 0.9);
  z-index: 100;
}

  </style>