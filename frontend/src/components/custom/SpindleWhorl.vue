<template>
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
            <h2 class="section-title"><span class="highlight">The Spindle Whorl</span></h2>
            <!-- <div class="divider"></div> -->
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

  <div class="parallax-container">
    <div class="spindle-track">
      <!-- Spindle whorls will be generated dynamically -->
      <div class="spindle-item top" v-for="i in 5" :key="`top-${i}`">
        <img src="../../assets/spindle.png" alt="Spindle Whorl" class="spindle-parallax-image" />
      </div>
      <div class="spindle-item bottom" v-for="i in 5" :key="`bottom-${i}`">
        <img src="../../assets/spindle.png" alt="Spindle Whorl" class="spindle-parallax-image" />
      </div>
    </div>
    <!-- <div class="parallax-content">
      <h2>The Evolution of Textile Tools</h2>
      <p>Spindle whorls represent one of humanity's earliest technological innovations for textile production.</p>
    </div> -->
    <div class="impact-visualization">
      <div class="central-spindle">
        <img src="../../assets/spindle.png" alt="Central Spindle Whorl" />
      </div>
      <div class="ripple-circles">
        <div class="ripple-circle" data-category="trade"></div>
        <div class="ripple-circle" data-category="technology"></div>
        <div class="ripple-circle" data-category="society"></div>
        <div class="ripple-circle" data-category="art"></div>
      </div>
      <div class="impact-cards">
        <div class="impact-card" data-category="trade">
          <h3>Trade Networks</h3>
          <p>Spindle whorls enabled textile production that became central to Mapungubwe's extensive trade networks
            across Africa and beyond.</p>
        </div>
        <div class="impact-card" data-category="technology">
          <h3>Technological Innovation</h3>
          <p>This simple tool represented sophisticated engineering knowledge, balancing weight and momentum for
            efficient fiber spinning.</p>
        </div>
        <div class="impact-card" data-category="society">
          <h3>Social Structure</h3>
          <p>Textile production influenced social organization, creating specialized roles and contributing to
            Mapungubwe's complex society.</p>
        </div>
        <div class="impact-card" data-category="art">
          <h3>Cultural Expression</h3>
          <p>The decorative patterns on spindle whorls reflected artistic traditions and cultural symbolism unique to
            the region.</p>
        </div>
      </div>
    </div>

    <div class="scroll-hint">
      <p>Continue scrolling</p>
      <div class="scroll-arrow"></div>
    </div>
  </div>
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

    // Quick emergency fix for your setupParallaxEffect function
function setupParallaxEffect() {
  const parallaxContainer = document.querySelector('.parallax-container');
  if (!parallaxContainer) return;

  const topSpindles = document.querySelectorAll('.spindle-item.top');
  const bottomSpindles = document.querySelectorAll('.spindle-item.bottom');
  const impactVisualization = document.querySelector('.impact-visualization');
  const centralSpindle = document.querySelector('.central-spindle');
  
  // Initially hide everything
  gsap.set(topSpindles, { autoAlpha: 0, rotation: -180 });
  gsap.set(bottomSpindles, { autoAlpha: 0, rotation: 180 });
  gsap.set(impactVisualization, { autoAlpha: 0 });
  gsap.set(centralSpindle, { scale: 0, opacity: 0 });

  // Master timeline with scroll trigger for the entire sequence
  const masterTimeline = gsap.timeline({
    scrollTrigger: {
      trigger: parallaxContainer,
      start: "top 0%",
      end: "+=250%", 
      scrub: true,
      pin: true,
      pinSpacing: true
    }
  });

  // PART 1: Initial alignment - spindles come from top/bottom
  const alignmentTl = gsap.timeline();
  
  // Animate top spindles to center
  topSpindles.forEach((spindle, i) => {
    alignmentTl.to(spindle, {
      top: "50%",
      y: "-50%",
      autoAlpha: 1,
      rotation: 0,
      duration: 2,
      ease: "power2.out"
    }, i * 0.2);
  });
  
  // Animate bottom spindles to center
  bottomSpindles.forEach((spindle, i) => {
    alignmentTl.to(spindle, {
      bottom: "50%",
      y: "50%", 
      autoAlpha: 1,
      rotation: 0,
      duration: 2,
      ease: "power2.out"
    }, i * 0.2);
  });

  // PART 2: Convergence - all spindles move to horizontal center
  const convergenceTl = gsap.timeline();
  
  // First move all spindles to horizontal center
  convergenceTl
    .to([topSpindles, bottomSpindles], {
      left: "50%", 
      x: "-50%",
      duration: 3,
      stagger: 0.05,
      ease: "power3.inOut"
    })
    // Make them all rotate slightly
    .to([topSpindles, bottomSpindles], {
      rotation: 360,
      duration: 2,
      stagger: 0.05,
      ease: "power2.inOut" 
    })
    // Scale down and gather them to center point
    .to([topSpindles, bottomSpindles], {
      scale: 0.3,
      duration: 1.5,
      stagger: 0.03,
      ease: "power2.in"
    })
    // Show impact visualization container
    .to(impactVisualization, {
      autoAlpha: 1,
      duration: 0.5
    })
    // Make the spindles fade away
    .to([topSpindles, bottomSpindles], {
      opacity: 0,
      scale: 0,
      duration: 1,
      stagger: 0.02
    })
    // Reveal central spindle with dramatic entrance
    .to(centralSpindle, {
      scale: 1,
      opacity: 1,
      rotation: 360,
      duration: 1.5,
      ease: "back.out(2)"
    });

  // PART 3: Ripple effect - circles and cards appear
  const rippleTl = gsap.timeline();

  gsap.set(".ripple-circle", { scale: 0, opacity: 0 });
  
  rippleTl
    // Expand ripple circles in sequence
    .to(".ripple-circle[data-category='trade']", {
      scale: 1,
      opacity: 0.9, // Increased opacity for better visibility
      duration: 1,
      ease: "power2.out"
    })
    .to(".ripple-circle[data-category='technology']", {
      scale: 1,
      opacity: 0.9, // Increased opacity for better visibility
      duration: 1,
      ease: "power2.out"
    }, "-=0.7")
    .to(".ripple-circle[data-category='society']", {
      scale: 1,
      opacity: 0.9, // Increased opacity for better visibility
      duration: 1,
      ease: "power2.out"
    }, "-=0.7")
    .to(".ripple-circle[data-category='art']", {
      scale: 1,
      opacity: 0.9, // Increased opacity for better visibility
      duration: 1,
      ease: "power2.out"
    }, "-=0.7")
    // Reveal impact cards
    .to(".impact-card[data-category='trade']", {
      opacity: 1,
      scale: 1,
      duration: 0.8,
      ease: "back.out(1.5)"
    }, "-=0.4")
    .to(".impact-card[data-category='technology']", {
      opacity: 1,
      scale: 1,
      duration: 0.8,
      ease: "back.out(1.5)"
    }, "-=0.6")
    .to(".impact-card[data-category='society']", {
      opacity: 1,
      scale: 1,
      duration: 0.8,
      ease: "back.out(1.5)"
    }, "-=0.6")
    .to(".impact-card[data-category='art']", {
      opacity: 1,
      scale: 1,
      duration: 0.8,
      ease: "back.out(1.5)"
    }, "-=0.6");

  // Add all timelines to the master timeline
  masterTimeline
    .add(alignmentTl)
    .add(convergenceTl)
    .add(rippleTl);
    
  // Add subtle perpetual animation to the ripple circles
  ScrollTrigger.create({
    trigger: ".parallax-container",
    start: "top top",
    end: "bottom top",
    onEnter: () => {
      // Clear any existing animations on ripple circles first
      gsap.killTweensOf(".ripple-circle");
      
      // Create a consistent animation that's less likely to be interrupted
      gsap.to(".ripple-circle", {
        scale: 1.05, // Small scale change for subtle effect
        opacity: (i) => 0.7 + (i * 0.05), // Higher base opacity
        duration: 1.5,
        repeat: -1,
        yoyo: true,
        ease: "sine.inOut",
        stagger: 0.2,
        overwrite: true // Important: ensures this animation takes precedence
      });
    },
    onLeaveBack: () => {
      // Kill the animations when scrolling back up
      gsap.killTweensOf(".ripple-circle");
    }
  });
}

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

      setupParallaxEffect();
    });

    return { title, timelineEvents };
  },
};

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
  background: linear-gradient(to bottom, #2d1e0f, #111);
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

/* Fix for the title underline in the last container */
.highlight {
  color: white;
  position: relative;
  display: inline-block;
}

.highlight::after {
  content: '';
  position: absolute;
  bottom: -5px;
  /* Adjusted to be below the text properly */
  left: 0;
  width: 100%;
  height: 3px;
  background: #FFEF00;
  /* Yellow underline */
  transform: scaleX(1);
  /* Start with the underline visible */
  transform-origin: left;
  transition: transform 0.5s ease;
}

/* Create the infinite animation effect for the underline */
@keyframes underlinePulse {
  0% {
    opacity: 0.6;
    box-shadow: 0 0 5px rgba(255, 239, 0, 0.5);
  }

  50% {
    opacity: 1;
    box-shadow: 0 0 12px rgba(255, 239, 0, 0.8);
  }

  100% {
    opacity: 0.6;
    box-shadow: 0 0 5px rgba(255, 239, 0, 0.5);
  }
}

/* Apply the animation to the underline */
.highlight::after {
  animation: underlinePulse 2s infinite;
}

/* Make the highlight text color more vibrant */
.highlight {
  color: #FFEF00;
  /* Match the underline color for consistency */
}

/* Remove the hover effect since we want the underline always visible */
.info-text:hover .highlight::after {
  transform: scaleX(1);
  /* Always show full underline */
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

/* Parallax Section */
.parallax-container {
  position: relative;
  height: 100vh;
  width: 100%;
  overflow: hidden;
  background: linear-gradient(to bottom, #111, #2d1e0f);
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  margin-top: -1px; /* Eliminate any gap caused by rounding */
  z-index: 10;
}

.spindle-track {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  z-index: 1;
  /* Make sure this is above background but below content */
}

.spindle-item {
  position: absolute;
  width: 150px;
  height: 150px;
  transform: translateX(-50%);
  /* Center horizontally */
  transition: all 0.5s ease;
}

.spindle-item.top {
  top: -150px;
  /* Start above viewport */
}

.spindle-item.bottom {
  bottom: -150px;
  /* Start below viewport */
}

/* Position each spindle horizontally */
.spindle-item:nth-child(1) {
  left: 10%;
}

.spindle-item:nth-child(2) {
  left: 30%;
}

.spindle-item:nth-child(3) {
  left: 50%;
}

.spindle-item:nth-child(4) {
  left: 70%;
}

.spindle-item:nth-child(5) {
  left: 90%;
}

.spindle-item:nth-child(6) {
  left: 10%;
}

.spindle-item:nth-child(7) {
  left: 30%;
}

.spindle-item:nth-child(8) {
  left: 50%;
}

.spindle-item:nth-child(9) {
  left: 70%;
}

.spindle-item:nth-child(10) {
  left: 90%;
}

.spindle-parallax-image {
  width: 100%;
  height: 100%;
  object-fit: contain;
  filter: drop-shadow(0 0 10px rgba(255, 215, 0, 0.5));
}

.parallax-content {
  position: relative;
  z-index: 10;
  text-align: center;
  color: white;
  padding: 2rem;
  max-width: 800px;
  opacity: 0;
  margin-top: 200px;
  /* Make space for spindles */
}

.parallax-content h2 {
  font-size: 3rem;
  color: #ffd700;
  margin-bottom: 1rem;
}

.parallax-content p {
  font-size: 1.2rem;
  line-height: 1.6;
  color: white;
}

/* Ripple Effect Section */
.impact-visualization {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  opacity: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 20;
  pointer-events: none;
}

.central-spindle {
  position: absolute;
  width: 200px;
  height: 200px;
  z-index: 25;
  filter: drop-shadow(0 0 20px rgba(255, 215, 0, 0.7));
  transform: scale(0.8);
  opacity: 0;
}

.central-spindle img {
  width: 100%;
  height: 100%;
  object-fit: contain;
}

.ripple-circles {
  position: absolute;
  width: 100%;
  height: 100%;
  z-index: 22;
}

.ripple-circle {
  position: absolute;
  border-radius: 50%;
  border: 2px solid rgba(255, 215, 0, 0.5);
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%) scale(0);
  opacity: 0;
}

.ripple-circle[data-category="trade"] {
  width: 300px;
  height: 300px;
  border-color: rgba(255, 215, 0, 0.6);
}

.ripple-circle[data-category="technology"] {
  width: 500px;
  height: 500px;
  border-color: rgba(255, 215, 0, 0.5);
}

.ripple-circle[data-category="society"] {
  width: 700px;
  height: 700px;
  border-color: rgba(255, 215, 0, 0.4);
}

.ripple-circle[data-category="art"] {
  width: 900px;
  height: 900px;
  border-color: rgba(255, 215, 0, 0.3);
}

.impact-cards {
  position: absolute;
  width: 100%;
  height: 100%;
  z-index: 23;
}

.impact-card {
  position: absolute;
  width: 250px;
  padding: 20px;
  background: rgba(45, 30, 15, 0.8);
  backdrop-filter: blur(5px);
  border: 1px solid rgba(255, 215, 0, 0.3);
  border-radius: 10px;
  opacity: 0;
  transform: scale(0.8);
  pointer-events: auto;
  /* Make cards clickable */
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.impact-card:hover {
  transform: scale(1.05);
  box-shadow: 0 0 20px rgba(255, 215, 0, 0.5);
}

.impact-card[data-category="trade"] {
  top: calc(50% - 150px);
  left: calc(50% + 200px);
}

.impact-card[data-category="technology"] {
  top: calc(50% + 100px);
  left: calc(50% + 300px);
}

.impact-card[data-category="society"] {
  top: calc(50% - 250px);
  left: calc(50% - 400px);
}

.impact-card[data-category="art"] {
  top: calc(50% + 200px);
  left: calc(50% - 300px);
}

.impact-card h3 {
  color: #ffd700;
  margin-bottom: 10px;
  font-size: 1.5rem;
}

.impact-card p {
  color: white;
  font-size: 1rem;
  line-height: 1.5;
}

/* Responsive adjustments for smaller screens */
@media (max-width: 768px) {
  .ripple-circle[data-category="trade"] {
    width: 200px;
    height: 200px;
  }

  .ripple-circle[data-category="technology"] {
    width: 320px;
    height: 320px;
  }

  .ripple-circle[data-category="society"] {
    width: 440px;
    height: 440px;
  }

  .ripple-circle[data-category="art"] {
    width: 560px;
    height: 560px;
  }

  .impact-card {
    width: 200px;
  }

  .impact-card[data-category="trade"] {
    top: calc(50% - 120px);
    left: calc(50% + 120px);
  }

  .impact-card[data-category="technology"] {
    top: calc(50% + 80px);
    left: calc(50% + 180px);
  }

  .impact-card[data-category="society"] {
    top: calc(50% - 200px);
    left: calc(50% - 240px);
  }

  .impact-card[data-category="art"] {
    top: calc(50% + 150px);
    left: calc(50% - 220px);
  }
}

.scroll-hint {
  position: absolute;
  bottom: 30px;
  left: 50%;
  transform: translateX(-50%);
  text-align: center;
  opacity: 0;
  animation: fadeInOut 3s infinite;
  z-index: 15;
}

.scroll-hint p {
  color: #ffd700;
  font-size: 0.9rem;
  text-transform: uppercase;
  letter-spacing: 2px;
  margin-bottom: 5px;
}

.scroll-arrow {
  width: 15px;
  height: 15px;
  border-right: 2px solid #ffd700;
  border-bottom: 2px solid #ffd700;
  transform: rotate(45deg);
  margin: 0 auto;
}

@keyframes fadeInOut {

  0%,
  100% {
    opacity: 0.3;
  }

  50% {
    opacity: 1;
  }
}
</style>