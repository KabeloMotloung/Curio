<template>
  <div class="scroll-container">
    <div 
      class="fixed top-8 left-8 z-50 backButton" 
      v-show="showBackButton" 
      style="transition: opacity 0.3s ease;">
      <button 
        @click="$router.back()" 
        class="text-black/30 hover:text-black/80 transition-all duration-300 flex items-center gap-2 group  bg-white/5 px-4 py-2 rounded-lg hover:shadow-[0_0_15px_rgba(255,255,255,0.3)] hover:border hover:border-white/30"
      >
        <svg 
          class="w-6 h-6 transform group-hover:-translate-x-1 transition-transform duration-300" 
          fill="none" 
          stroke="currentColor" 
          viewBox="0 0 24 24"
        >
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M15 19l-7-7 7-7" />
        </svg>
        <span class="text-sm font-light tracking-[0.25em] uppercase font-['Raleway'] leading-none">Back</span>
      </button>
    </div>

    <RopeAnimation />

    <Needle />

    <section class="panel panel1">
      <div class="text">
        Tapestry is more than just woven threads. Each strand tells a story, and
        together they form a masterpiece that transcends time.
      </div>
    </section>
    <Clock/>
    <section class="panel panel2">
      <div class="text">
        Threads of history, culture, and artistry weave together to create a
        tapestry that speaks to the soul. The Life of Shaka captures this in its
        rich display of South African History
      </div>
    </section>

    <section class="horizontal-panel-wrapper" ref="horizontalWrapper">
      <div class="horizontal-panels" ref="horizontalPanels">
        <div class="horizontal-panel panel3a">
          <div class="text">
            The piece spans over four and a half meters in length and was
            crafted with pure karakul hand-spun wool and linen
          </div>
        </div>
        <div class="horizontal-panel panel3b">
          <div class="text">
            Its vibrant hues and intricate design bring to life the legacy of
            Shaka Zulu, the legendary king of the Zulu nation.
          </div>
        </div>
        <div class="horizontal-panel panel3c">
          <div class="text">
            Under the guidance of master weaver Allina Ndebele, Memela and
            Shabalala spent four and a half months weaving this exceptional
            piece
          </div>
        </div>
      </div>
    </section>

    <section class="panel panel4">
      <div class="text">
        Tapestry, as a medium, is a testament to patience and collaboration and
        The Life of Shaka is not exempt from this truth
      </div>
    </section>
    <section class="panel panel5">
      <div class="text">
        The Life of Shaka" tapestry is not just an artwork; it is a cultural
        treasure.
      </div>
    </section>
  </div>
</template>

<script>
import { onMounted, ref, nextTick } from "vue";
import gsap from "gsap";
import ScrollTrigger from "gsap/ScrollTrigger";
import RopeAnimation from "./Rope.vue";
import Thread from "./Thread.vue";
import Needle from "./Needle.vue";
import Clock from "./Clock.vue";

gsap.registerPlugin(ScrollTrigger);

export default {
  name: "ScrollPanels",
  components: {
    Clock,
    RopeAnimation,
    Thread,
    Needle,
  },
  setup() {
    const horizontalWrapper = ref(null);
    const horizontalPanels = ref(null);
    // const threadImage = ref(null);
    const showBackButton = ref(false);

    onMounted(async () => {
      await nextTick();

      const panels = horizontalPanels.value;
      const totalPanels = panels.children.length;

      window.addEventListener("mousemove", (e) => {
        if (e.clientY < 50) {
          showBackButton.value = true; // Show the button when the mouse is near the top
        } else {
          showBackButton.value = false; // Hide the button otherwise
        }
      });

      gsap.to(panels, {
        xPercent: -100 * (totalPanels - 1),
        ease: "none",
        scrollTrigger: {
          trigger: horizontalWrapper.value,
          start: "top top",
          end: `+=${window.innerHeight * (totalPanels - 1)}`,
          scrub: true,
          pin: true,
          anticipatePin: 1,
        },
      });

      gsap.to(".horizontal-panels", {
        backgroundPositionX: "-50%", // Adjust this value for the parallax effect
        ease: "none",
        scrollTrigger: {
          trigger: horizontalWrapper.value,
          start: "top top",
          end: () => `+=${horizontalPanels.value.offsetWidth}`,
          scrub: true,
        },
      });

      const textElements = document.querySelectorAll(".text");
      textElements.forEach((text) => {
        gsap.fromTo(
          text,
          { opacity: 0, y: 100 }, // Start fully transparent and further below
          {
            opacity: 1, // Fade in to full visibility
            y: 0, // Float to its original position
            duration: 1.5, // Slightly longer animation duration for smoother effect
            ease: "power2.out", // Smooth easing
            scrollTrigger: {
              trigger: text, // Trigger animation when the text comes into view
              start: "top 80%", // Start animation when the top of the text is 80% down the viewport
              end: "top 50%", // End animation when the top of the text is 50% down the viewport
              scrub: false, // No scrubbing, play the animation normally
            },
          }
        );
      });

      // gsap.to(threadImage.value, {
      //   x: () => horizontalPanels.value.offsetWidth - threadImage.value.offsetWidth, // Move across the width of the horizontal panels
      //   rotation: 360 * 3, // Rotate 3 full turns
      //   ease: "none",
      //   scrollTrigger: {
      //     trigger: horizontalWrapper.value, // Trigger animation on the horizontal wrapper
      //     start: "top top", // Start when the horizontal panels start scrolling
      //     end: () => `+=${horizontalPanels.value.offsetWidth}`, // End when the horizontal scroll finishes
      //     scrub: true, // Tie the animation to the scroll progress
      //     pin: false, // Do not pin the image
      //   },
      // });
    });

    return {
      horizontalWrapper,
      horizontalPanels,
      showBackButton,
      // threadImage
    };
  },
};
</script>

<style scoped>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

.scroll-container {
  overflow-x: hidden;
}

.panel {
  width: 100vw;
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 3em;
  color: #99724b;
}

.panel1 {
  background: #f9f5f2;
}
.panel2 {
  background: #f9f5f2;
}

.horizontal-panel-wrapper {
  position: relative;
  height: 100vh;
  overflow: hidden;
  background: #f9f5f2;
}

.horizontal-panels {
  display: flex;
  width: 300vw;
  height: 100%;
  color: #99724b;
  background: url("../../assets/shaka.jpg") no-repeat center center; /* 50% opacity black overlay */
  background-size: cover;
  background-blend-mode: overlay; /* Blend the overlay with the image */
}

.horizontal-panel {
  width: 100vw;
  height: 100vh;
  flex-shrink: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 3em;
  color: white;
}

.panel3a {
  background: transparent;
  color: white;
}
.panel3b {
  background: transparent;
  color: white;
}
.panel3c {
  background: transparent;
  color: white;
}

.panel4 {
  background: #f9f5f2;
}
.panel5 {
  background: #f9f5f2;
}

.thread-image {
  position: fixed; /* Fix the image to the viewport */
  bottom: 20px; /* Stay at the bottom of the screen */
  left: 20px; /* Initial position on the left */
  width: 100px;
  height: auto;
  z-index: 10;
  pointer-events: none;
  opacity: 1; /* Ensure the image is visible */
  transform-origin: center; /* Ensure rotation happens from the center */
}

.text {
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 2rem;
  padding: 50px;
  width: auto;
  /* color:#99724B; */
}
</style>
