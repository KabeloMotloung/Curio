<template>
  <!-- <section ref="introSection" class="relative w-full h-screen flex flex-col items-center justify-center">

    <div class="flex justify-center gap-10 mt-32 max-w-7xl w-full">
      <img ref="spindleLeft" src="../../assets/spindle.png" alt="Left Spindle" class="spindle" />
      <img ref="spindle" src="../../assets/spindle.png" alt="Spindle" class="spindle" />
      <img ref="spindleRight" src="../../assets/spindle.png" alt="Right Spindle" class="spindle" />
    </div>
  </section> -->
  <div class="intro-container">
    <div class="particle-container">
      <div class="particle" v-for="n in 300" :key="n"></div>
    </div>
    <div class="intro-content">
      <h1 ref="title" class="intro-title">The Spindle Whorl of Mapungubwe</h1>
      <p class="intro-description">
        Discover the rich history and craftsmanship of the ancient kingdom of Mapungubwe through this remarkable
        artifact.
      </p>
    </div>

    <div class="scroll-indicator">
      <p class="scroll-text">Scroll to explore</p>
      <div class="arrow-container">
        <div class="arrow"></div>
      </div>
    </div>
  </div>

  <div class="container">
    <div class="timeline-item panel" v-for="(event, index) in timelineEvents" :key="index">
      <div class="timeline-date">{{ event.date }}</div>
      <div class="timeline-description">{{ event.description }}</div>
    </div>
  </div>

  <div class="last-container">
    <div class="content gradient-yellow">
      <div class="info-wrapper">
        <div class="info-container">
          <div class="spindle-image-container">
            <img src="../../assets/spindle.png" alt="Spindle Whorl" class="spindle-image" />
            <div class="image-overlay">
              <div class="overlay-content">
                <span>Circa 1200 AD</span>
              </div>
            </div>
          </div>

          <div class="info-text">
            <h2 class="section-title">The <span class="highlight">Spindle Whorl</span></h2>
            <div class="divider"></div>
            <p class="main-description">
              The spindle whorl was a vital tool in ancient Mapungubwe, used for spinning fibers into thread. It
              highlights the advanced craftsmanship and trade practices of the time, symbolizing the ingenuity of the
              Mapungubwe people.
            </p>
            <ul class="feature-list">
              <li><span class="feature-icon">🔹</span> <span class="feature-text">Created between 900-1300 AD</span>
              </li>
              <li><span class="feature-icon">🔹</span> <span class="feature-text">Made from clay or stone
                  materials</span></li>
              <li><span class="feature-icon">🔹</span> <span class="feature-text">Essential for textile
                  production</span></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class=""></div>
</template>

<script>
import { ref, onMounted } from "vue";
import { gsap } from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";
gsap.registerPlugin(ScrollTrigger);

export default {
  setup() {
    const bg = ref(null);
    const title = ref(null);
    const timelineEvents = [
      { date: "900 AD", description: "First evidence of fiber spinning in Mapungubwe." },
      { date: "1000 AD", description: "Mapungubwe's rise as a key economic and political center." },
      { date: "1100 AD", description: "Discovery of spindle whorls at Mutamba indicating active trade." },
      { date: "1200 AD", description: "Regional trade with China and India through the east coast." },
      { date: "1300 AD", description: "Mapungubwe's influence over trade routes peaks." },
    ];

    onMounted(() => {
      const sections = gsap.utils.toArray(".panel");
      const timeline = gsap.timeline();

      timeline.fromTo(
        title.value,
        {
          opacity: 0,
          y: 50,
          scale: 0.8,
        },
        {
          opacity: 1,
          y: 0,
          scale: 1,
          duration: 1.5,
          ease: "power2.out",
          textShadow: "0px 0px 60px rgba(255, 215, 0, 0.9), 0px 0px 20px rgba(255, 165, 0, 0.5)",
          color: "#FFD700",
        }
      );

      timeline.fromTo(
        ".intro-description",
        {
          opacity: 0,
          y: 30, // Start slightly below
        },
        {
          opacity: 1,
          y: 0, // Move to its final position
          duration: 1.2,
          ease: "power2.out", // Smooth easing
          color: "#fff",
        },
        "-=1" // Overlap with the title animation
      );

      // Horizontal scrolling logic
      gsap.to(sections, {
        xPercent: -100 * (sections.length - 1),
        ease: "none",
        scrollTrigger: {
          trigger: ".container",
          pin: true,
          scrub: 1,
          snap: 1 / (sections.length - 1),
          end: () => "+=" + document.querySelector(".container").offsetWidth,
        },
      });

      const particles = document.querySelectorAll(".particle");
      particles.forEach((particle) => {
        const container = document.querySelector(".particle-container");
        const bounds = container.getBoundingClientRect();

        const posX = Math.random() * bounds.width;
        const posY = Math.random() * bounds.height;

        const size = 2 + Math.random() * 4;
        const blinkDuration = 1 + Math.random(); // 1 to 2 seconds
        const blinkDelay = Math.random() * 3;

        gsap.set(particle, {
          x: posX,
          y: posY,
          scale: size / 6,
          opacity: 0.2 + Math.random() * 0.6,
        });

        gsap.to(particle, {
          opacity: "+=0.3",
          duration: blinkDuration,
          delay: blinkDelay,
          yoyo: true,
          repeat: -1,
          ease: "sine.inOut",
        });

        gsap.to(particle, {
          y: `-=${50 + Math.random() * 100}`,
          x: `+=${Math.random() * 20 - 10}`,
          duration: 10 + Math.random() * 10,
          repeat: -1,
          yoyo: true,
          ease: "sine.inOut",
        });
      });

      gsap.registerPlugin(ScrollTrigger);

      gsap.timeline({
        scrollTrigger: {
          trigger: ".last-container",
          start: "top top",
          end: "+=100%",
          pin: true,
          scrub: true,
        },
      })
        .to(".content", {
          clipPath: "polygon(0% 45%, 100% 45%, 100% 55%, 0% 55%)", // Horizontal split
          duration: 1,
        })
        .to(".content", {
          clipPath: "polygon(0% 0%, 100% 0%, 100% 100%, 0% 100%)", // Fully open
          duration: 1,
        });

      const infoTimeline = gsap.timeline({
        scrollTrigger: {
          trigger: ".last-container",
          start: "top top",
          toggleActions: "restart none none reset"
        }
      });

      // Add animations that will play forward and backward based on scroll
      infoTimeline
        .to(".info-wrapper", {
          opacity: 1,
          duration: 0.8,
          delay: 0.5, // Adjust this delay based on when your eye effect completes
          ease: "power2.out"
        })
        .from(".spindle-image-container", {
          x: -100,
          opacity: 0,
          duration: 0.8,
          ease: "back.out(1.7)"
        }, "-=0.3")
        .from(".section-title", {
          y: 30,
          opacity: 0,
          duration: 0.6,
          ease: "power2.out"
        }, "-=0.4")
        .from(".divider", {
          width: 0,
          duration: 0.6,
          ease: "power1.out"
        }, "-=0.2")
        .from(".main-description", {
          y: 20,
          opacity: 0,
          duration: 0.6,
          ease: "power2.out"
        }, "-=0.3")
        .from(".feature-list li", {
          x: -20,
          opacity: 0,
          stagger: 0.1,
          duration: 0.4,
          ease: "power1.out"
        }, "-=0.2");

      // Replace the continuous floating animation with a scroll-based one
      gsap.from(".spindle-image-container", {
        y: 20,
        scrollTrigger: {
          trigger: ".last-container",
          start: "top bottom",
          end: "bottom top",
          scrub: 1
        }
      });

      ScrollTrigger.create({
        trigger: ".last-container",
        start: "top 80%", // When the top of the container is 80% from the top of viewport
        end: "bottom top", // When the bottom of container leaves the top of viewport 
        onLeave: resetAnimation,
        onLeaveBack: resetAnimation
      });

      // Simple function to reset the elements
      function resetAnimation() {
        // Reset info wrapper opacity
        gsap.set(".info-wrapper", { opacity: 0 });

        // Reset all animated elements to their starting positions
        gsap.set(".spindle-image-container", { x: -100, opacity: 0 });
        gsap.set(".section-title", { y: 30, opacity: 0 });
        gsap.set(".divider", { width: 0 });
        gsap.set(".main-description", { y: 20, opacity: 0 });
        gsap.set(".feature-list li", { x: -20, opacity: 0 });
      }

    });

    return { title, timelineEvents };
  },
};
// import { ref, onMounted } from "vue";
// import { gsap } from "gsap";
// import { ScrollTrigger } from "gsap/ScrollTrigger";
// gsap.registerPlugin(ScrollTrigger);

// export default {
//   setup() {
//     const title = ref(null);
//     const bg = ref(null);
//     const spindle = ref(null);
//     const spindleLeft = ref(null);
//     const spindleRight = ref(null);
//     const introSection = ref(null);
//     const timelineSection = ref(null);
//       timeline.fromTo(
//         spindle.value,
//         {
//           opacity: 0,
//           y: window.innerHeight / 2,
//           rotation: 0,
//         },
//         {
//           opacity: 1,
//           y: 20,
//           rotation: 360,
//           duration: 2,
//           ease: "power2.out",
//         },
//         "+=0.5"
//       );


//       timeline.fromTo(
//         spindleLeft.value,
//         {
//           opacity: 0,
//           y: window.innerHeight / 2,
//           rotation: 0,
//         },
//         {
//           opacity: 1,
//           y: 20, // lower than center
//           rotation: 360,
//           duration: 2,
//           ease: "power2.out",
//         },
//         "-=0.7"
//       );

//       timeline.fromTo(
//         spindleRight.value,
//         {
//           opacity: 0,
//           y: window.innerHeight / 2,
//           rotation: 0,
//         },
//         {
//           opacity: 1,
//           y: 20,
//           rotation: 360,
//           duration: 2,
//           ease: "power2.out",
//           onComplete: () => {
//             // Floating animation starts ONLY after all spindles are in place
//             gsap.to([spindle.value, spindleLeft.value, spindleRight.value], {
//               y: "+=20",
//               repeat: -1,
//               yoyo: true,
//               duration: 2,
//               ease: "sine.inOut",
//             });

//             gsap.to(title.value, {
//               textShadow: "0px 0px 80px rgba(255, 215, 0, 1), 0px 0px 30px rgba(255, 165, 0, 0.7)",
//               repeat: -1,
//               yoyo: true,
//               duration: 2.5,
//               ease: "power1.inOut",
//             });

//             const particles = document.querySelectorAll(".particle");
//             particles.forEach((particle) => {
//               const container = document.querySelector(".particle-container");
//               const bounds = container.getBoundingClientRect();

//               const posX = Math.random() * bounds.width;
//               const posY = Math.random() * bounds.height;

//               const size = 2 + Math.random() * 4;
//               const blinkDuration = 1 + Math.random(); // 1 to 2 seconds
//               const blinkDelay = Math.random() * 3;

//               gsap.set(particle, {
//                 x: posX,
//                 y: posY,
//                 scale: size / 6,
//                 opacity: 0.2 + Math.random() * 0.6,
//               });

//               gsap.to(particle, {
//                 opacity: "+=0.3",
//                 duration: blinkDuration,
//                 delay: blinkDelay,
//                 yoyo: true,
//                 repeat: -1,
//                 ease: "sine.inOut",
//               });

//               gsap.to(particle, {
//                 y: `-=${50 + Math.random() * 100}`,
//                 x: `+=${Math.random() * 20 - 10}`,
//                 duration: 10 + Math.random() * 10,
//                 repeat: -1,
//                 yoyo: true,
//                 ease: "sine.inOut",
//               });
//             });


//             gsap.to(".light-ray", {
//               opacity: 0.2,
//               duration: 4,
//               repeat: -1,
//               yoyo: true,
//               ease: "sine.inOut",
//             });
//           },
//         },
//         "-=0.7"
//       );


//       ScrollTrigger.create({
//         trigger: introSection.value,
//         start: "top top",
//         end: "+=150%",
//         pin: true,
//         scrub: true,
//       });

//       const timelineItems = gsap.utils.toArray(".timeline-item");
//       const timelineContainer = timelineSection.value.querySelector(".timeline-container");
//       const totalScrollWidth = timelineContainer.scrollWidth;
//       const viewportWidth = window.innerWidth;

//       timelineItems.forEach((item, index) => {
//         gsap.set(item, {
//           x: index * 300,
//           scale: index === 0 ? 1.5 : 0.8,
//           opacity: index === 0 ? 1 : 0.5,
//         });
//       });

//       gsap.set(timelineContainer, {
//         x: viewportWidth / 2 - 150, // Offset to center the first item (150 = half the item width)
//       });

//       gsap.to(timelineContainer, {
//         x: () => -(totalScrollWidth - viewportWidth) + viewportWidth / 2 - 150, // Ensure the last item centers
//         ease: "none",
//         scrollTrigger: {
//           trigger: timelineSection.value,
//           start: "top top",
//           end: () => `+=${totalScrollWidth}`, // Ensure the scroll duration matches the total width
//           scrub: true,
//           pin: true,
//           onUpdate: (self) => {
//             const progress = self.progress * (timelineItems.length - 1); // Map progress to the number of items
//             timelineItems.forEach((item, index) => {
//               const distance = Math.abs(progress - index); // Distance from the current progress
//               const scale = gsap.utils.clamp(0.8, 1.5, 1.5 - distance * 0.5); // Scale based on distance
//               const opacity = gsap.utils.clamp(0.5, 1, 1 - distance * 0.5); // Opacity based on distance
//               gsap.to(item, {
//                 scale,
//                 opacity,
//                 duration: 0.2,
//               });
//             });
//           },
//         },
//       });


//       ScrollTrigger.create({
//         trigger: timelineSection.value,
//         start: "top top",
//         end: () => `+=${totalScrollWidth}`, // Ensure the timeline finishes scrolling before transitioning
//         pin: true,
//         scrub: true,
//         anticipatePin: 1,
//       });


//     });

//     return { title, spindle, spindleLeft, spindleRight, introSection, timelineSection, timelineEvents };
//   },
// };
</script>

<style scoped>
html,
body {
  overflow-x: hidden;
  margin: 0;
  height: 100%;
  width: 100%;
}

.intro-container {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 100vh;
  width: 100vw;
  background: linear-gradient(to bottom, #2d1e0f, #111);
  color: white;
  text-align: center;
  overflow: hidden;
}

.intro-title {
  font-size: 3rem;
  font-weight: bold;
  color: #ffd700;
  /* Gold color for the title */
  margin-bottom: 1rem;
  text-transform: uppercase;
  letter-spacing: 0.1rem;
  text-shadow: 0px 0px 20px rgba(255, 215, 0, 0.7);
}

/* Subtitle Styling */
.intro-description {
  font-size: 1.5rem;
  line-height: 1.8;
  color: #fff;
  max-width: 800px;
  margin: 0 auto;
  opacity: 0;
  transition: color 0.3s ease;
}

.intro-description:hover {
  color: #ffd700;
  /* Gold color on hover */
}

/* Scroll Indicator */
.scroll-indicator {
  position: absolute;
  bottom: 2rem;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.5rem;
}

.scroll-text {
  font-size: 1rem;
  color: #fff;
  text-transform: uppercase;
  letter-spacing: 0.1rem;
}

/* Arrow Animation */
.arrow-container {
  width: 2rem;
  height: 2rem;
  display: flex;
  justify-content: center;
  align-items: center;
  position: relative;
}

.arrow {
  width: 1rem;
  height: 1rem;
  border-left: 2px solid #fff;
  border-bottom: 2px solid #fff;
  transform: rotate(-45deg);
  animation: bounce 1.5s infinite;
}

/* Arrow Bounce Animation */
@keyframes bounce {

  0%,
  20%,
  50%,
  80%,
  100% {
    transform: translateY(0) rotate(-45deg);
  }

  40% {
    transform: translateY(10px) rotate(-45deg);
  }

  60% {
    transform: translateY(5px) rotate(-45deg);
  }
}

.container {
  width: 500%;
  /* Adjust based on the number of timeline items */
  height: 100vh;
  display: flex;
  flex-wrap: nowrap;
}

.timeline-item {
  min-width: 100vw;
  height: 100vh;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  background: linear-gradient(145deg, #2d1e0f, #111);
  color: white;
  font-size: 1.5rem;
  text-align: center;
}


.timeline-item:nth-child(odd) {
  background: #2d1e0f;
}

.timeline-item:nth-child(even) {
  background: #111;
}

.timeline-date {
  font-size: 2rem;
  font-weight: bold;
  color: #ffd700;
  margin-bottom: 1rem;
}

.timeline-description {
  font-size: 1.2rem;
  color: white;
}

.last-container {
  position: relative;
  width: 100%;
  height: 100vh;
  background-color: #333;
  display: flex;
  justify-content: center;
  align-items: center;
  overflow: hidden;
  color: white;
  text-align: center;
}

/* Content for eye-opening effect */
.content {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: #FFEF00;
  /* Refined yellow */
  clip-path: polygon(50% 50%, 50% 50%, 50% 50%, 50% 50%);
  z-index: 1;
}

/* Info wrapper - appears after eye effect */
.info-wrapper {
  position: relative;
  z-index: 2;
  width: 100%;
  max-width: 1200px;
  opacity: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
}

.info-container {
  display: flex;
  flex-direction: row;
  /* Change to row to place elements side by side */
  align-items: center;
  justify-content: center;
  gap: 4rem;
  /* Add appropriate spacing */
  padding: 0 2rem;
  text-align: center;
  width: 100%;
  max-width: 1200px;
  margin: 0 auto;
}

/* Adjust the image container width for side-by-side layout */
.spindle-image-container {
  position: relative;
  width: 40%;
  max-width: 350px;
  flex-shrink: 0;
  /* Prevent shrinking */
  overflow: hidden;
  box-shadow: none;
  transform: perspective(1000px) rotateY(5deg);
  transition: transform 0.6s cubic-bezier(0.23, 1, 0.32, 1);
  background: transparent;
  border-radius: 0;
}

.spindle-image {
  width: 100%;
  height: 100%;
  object-fit: contain;
  /* Change to contain to ensure no cropping */
  border-radius: 0;
  /* Remove border radius */
  transition: transform 0.5s ease;
  filter: drop-shadow(0 8px 20px rgba(0, 0, 0, 0.3));
  /* Apply shadow to image instead of container */
}

.image-overlay {
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 30%;
  background: linear-gradient(to top, rgba(0, 0, 0, 0.8), transparent);
  display: flex;
  align-items: flex-end;
  padding: 1rem;
  opacity: 0;
  transition: opacity 0.3s ease;
}

.overlay-content {
  color: white;
  font-size: 0.9rem;
  font-weight: 500;
  letter-spacing: 1px;
}

/* Text styling */

.section-title {
  font-size: 3rem;
  font-weight: 700;
  margin-bottom: 1rem;
  color: white;
}

.highlight {
  color: white;
  position: relative;
  display: inline-block;
}

.highlight::after {
  content: '';
  position: absolute;
  bottom: 5px;
  left: 0;
  width: 100%;
  height: 3px;
  background: #FFEF00;
  transform: scaleX(0);
  transform-origin: right;
  transition: transform 0.5s ease;
}

.info-text {
  flex: 1;
  text-align: left;
  /* Change to left-aligned for better readability */
  max-width: 500px;
}

/* Center the divider for the new layout */
.divider {
  width: 80px;
  height: 3px;
  background: #FFEF00;
  margin: 1.5rem 0;
  /* Change from auto to 0 for left alignment */
}

.info-text:hover .highlight::after {
  transform: scaleX(1);
  transform-origin: left;
}

.main-description {
  font-size: 1.2rem;
  line-height: 1.8;
  color: rgba(255, 255, 255, 0.9);
  margin-bottom: 2rem;
}

.feature-list {
  list-style-type: none;
  padding: 0;
  margin: 2rem 0;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.feature-list li {
  display: flex;
  align-items: center;
  justify-content: center;
  margin-bottom: 1rem;
  font-size: 1.1rem;
}

.feature-icon {
  display: none;
  /* Hide the bullet points */
}

.feature-text {
  color: rgba(255, 255, 255, 0.8);
}

/* Media queries for responsive design */
@media (max-width: 768px) {
  .info-container {
    gap: 1.5rem;
    padding: 2rem;
  }

  .spindle-image-container {
    width: 70%;
    max-width: 250px;
    margin: 0 auto;
  }
}


h2 {
  position: relative;
  z-index: 2;
  /* Ensure the text is above the split effect */
  color: black;
  font-size: 2rem;
}

.particle-container {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  overflow: hidden;
  pointer-events: none;
  z-index: 5;
}

.particle {
  position: absolute;
  width: 6px;
  height: 6px;
  background: rgba(255, 255, 200, 0.8);
  border-radius: 50%;
  filter: blur(1px);
  z-index: 6;
}

@keyframes floatUp {
  to {
    transform: translateY(-200px);
    opacity: 0;
  }
}

/* .spindle {
  height: 10rem;
  opacity: 0;
  transition: transform 0.3s ease;
}

h1 {
  transition: all 0.3s ease;
}

.particle-container {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  overflow: hidden;
  pointer-events: none;
  z-index: 5;
}

.particle {
  position: absolute;
  width: 6px;
  height: 6px;
  background: rgba(255, 255, 200, 0.8);
  border-radius: 50%;
  filter: blur(1px);
  z-index: 6;
}

@keyframes floatUp {
  to {
    transform: translateY(-200px);
    opacity: 0;
  }
}

.light-ray {
  position: absolute;
  top: 0;
  width: 200px;
  height: 100%;
  background: radial-gradient(ellipse at center, rgba(255, 215, 0, 0.15) 0%, transparent 80%);
  pointer-events: none;
  mix-blend-mode: screen;
  z-index: 0;
  filter: blur(8px);
}

.ray-left {
  left: 20%;
  transform: rotate(25deg);
}

.ray-right {
  right: 20%;
  transform: rotate(-25deg);
}

.timeline-section {
  position: relative;
  height: 100vh;
  overflow: hidden;
  display: flex;
  align-items: center;
  justify-content: center;
}

.timeline-wrapper {
  height: 100%;
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
}

.timeline-container {
  display: flex;
  gap: 3rem;
  align-items: center;
  justify-content: flex-start;
  height: 100%;
  width: max-content;
}

.timeline-item {
  min-width: 300px;
  height: 400px;
  background: rgba(255, 255, 255, 0.1);
  border-radius: 10px;
  padding: 1rem;
  color: white;
  flex-shrink: 0;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  transform-origin: center center;
  transition: transform 0.3s ease, opacity 0.3s ease;
}

.timeline-item .timeline-date {
  font-size: 1.5rem;
  font-weight: bold;
  color: #ffd700;
  margin-bottom: 1rem;
}

.timeline-item .timeline-description {
  font-size: 1rem;
  color: #fff;
  text-align: center;
  line-height: 1.5;
}

.next-section {
  height: 100vh;
  background-color: #111;
  display: flex;
  align-items: center;
  justify-content: center;
  color: white;
  font-size: 2rem;
} */
</style>