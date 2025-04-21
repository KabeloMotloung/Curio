<template>
    <div class="clock-container">
      <svg class="clock" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
        <!-- Clock Circle -->
        <circle cx="50" cy="50" r="48" stroke="black" stroke-width="2" fill="none" />
        <!-- Clock Hands -->

        <text x="50" y="15" text-anchor="middle" font-size="5" fill="black">12</text>
        <text x="85" y="53" text-anchor="middle" font-size="5" fill="black">3</text>
        <text x="50" y="95" text-anchor="middle" font-size="5" fill="black">6</text>
        <text x="15" y="53" text-anchor="middle" font-size="5" fill="black">9</text>

        <line ref="hourHand" x1="50" y1="50" x2="50" y2="30" stroke="black" stroke-width="2" />
        <!-- <line ref="minuteHand" x1="50" y1="50" x2="50" y2="20" stroke="black" stroke-width="1" /> -->
      </svg>
    </div>
  </template>
  
  <script>
  import { ref, onMounted } from "vue";
  import { gsap } from "gsap";
  import { ScrollTrigger } from "gsap/ScrollTrigger";
  
  gsap.registerPlugin(ScrollTrigger);
  
  export default {
    name: "Clock",
    setup() {
      const hourHand = ref(null);
      const minuteHand = ref(null);
  
      onMounted(() => {
        // Animate the clock hands as the user scrolls
        gsap.to(hourHand.value, {
          rotation: 360, // Rotate the hour hand 360 degrees
          transformOrigin: "50% 50%", // Rotate around the center of the clock
          ease: "none",
          scrollTrigger: {
            trigger: ".clock-container", // Trigger animation when the clock comes into view
            start: "top bottom", // Start animation when the top of the clock is at the bottom of the viewport
            end: "bottom top", // End animation when the bottom of the clock is at the top of the viewport
            scrub: true, // Tie the animation to the scroll progress
          },
        });
  
        // gsap.to(minuteHand.value, {
        //   rotation: 360 * 12, // Rotate the minute hand 12 times for every hour hand rotation
        //   transformOrigin: "50% 50%",
        //   ease: "none",
        //   scrollTrigger: {
        //     trigger: ".clock-container",
        //     start: "top bottom",
        //     end: "bottom top",
        //     scrub: true,
        //   },
        // });
      });
  
      return {
        hourHand,
        minuteHand,
      };
    },
  };
  </script>
  
  <style scoped>
  .clock-container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh; /* Full height to fit between panels */
    background: #f9f5f2;
  }
  
  .clock {
    width: 200px;
    height: 200px;
  }
  </style>