<template>
  <div
    class="w-full min-h-screen bg-gray-900 text-white overflow-x-hidden font-serif"
  >
    <!-- Hero Section with Painting Reveal -->
    <section
      ref="section1"
      class="section h-screen relative flex flex-col justify-center items-center px-8 overflow-hidden"
    >
      <div class="absolute inset-0 bg-black z-0"></div>
      <div class="painting-mask absolute inset-0 z-10 bg-black"></div>

      <div class="relative z-20 text-center max-w-4xl">
        <h1
          class="text-5xl md:text-7xl font-bold mb-4 opacity-0 tracking-tight"
          style="font-family: 'Cinzel', serif"
        >
          THE BATTLE OF TORQUAY
        </h1>
        <h2
          class="text-xl md:text-2xl text-amber-300 opacity-0 font-light tracking-widest"
        >
          Through the Eyes of Abraham Storck
        </h2>
        <div class="mt-12 opacity-0">
          <button
            @click="startExperience"
            class="px-8 py-3 bg-amber-600 hover:bg-amber-700 rounded-full font-medium transition-all transform hover:scale-105"
          >
            Begin Exploration ↓
          </button>
        </div>
      </div>
    </section>

    <!-- Painting Deep Dive Section -->
    <section ref="section2" class="section h-[300vh] relative">
      <div class="sticky top-0 h-screen w-full overflow-hidden">
        <!-- Painting with zoom layers -->
        <div class="absolute inset-0 flex items-center justify-center">
          <img
            ref="mainPainting"
            src="/7.jpg"
            alt="Battle of Torquay by Abraham Storck"
            class="max-h-full max-w-full object-contain opacity-0 painting-image"
          />
        </div>

        <!-- Detail highlights -->
        <div
          v-for="(detail, index) in paintingDetails"
          :key="index"
          class="detail-spotlight absolute rounded-full border-2 border-amber-400 bg-black/20 backdrop-blur-sm p-4 transform scale-0 transition-all duration-300"
          :style="{
            top: `${detail.position.y}%`,
            left: `${detail.position.x}%`,
          }"
        >
          <div class="w-64 bg-black/80 p-4 rounded-lg shadow-xl">
            <h3 class="text-amber-300 font-bold">{{ detail.title }}</h3>
            <p class="text-sm mt-1">{{ detail.description }}</p>
          </div>
        </div>
      </div>
    </section>

    <!-- Context Section - Artist and Era -->
    <section
      ref="section3"
      class="section h-screen relative flex items-center px-8"
    >
      <div
        class="absolute inset-0 bg-[url('/old-paper-texture.jpg')] bg-cover opacity-20 z-0"
      ></div>

      <div
        class="relative z-10 w-full max-w-6xl mx-auto grid grid-cols-1 md:grid-cols-2 gap-12 items-center"
      >
        <div class="opacity-0">
          <h2 class="text-4xl font-bold mb-6 text-amber-600">Abraham Storck</h2>
          <h3 class="text-2xl font-medium mb-4 text-gray-300">
            Marine Painter of the Dutch Golden Age
          </h3>
          <p class="text-lg text-gray-200 mb-4 leading-relaxed">
            Born in 1644 in Amsterdam, Abraham Storck specialized in marine
            paintings that captured the drama and grandeur of naval battles and
            harbor scenes.
          </p>
          <p class="text-lg text-gray-200 leading-relaxed">
            His works are characterized by meticulous attention to ship details
            and dynamic compositions that bring historical events to life.
          </p>
        </div>

        <div class="relative opacity-0">
          <img
            src="/7.jpg"
            alt="Abraham Storck"
            class="w-full rounded-lg shadow-2xl border-4 border-amber-600/50"
          />
          <div
            class="absolute -bottom-6 -right-6 bg-amber-600 text-black px-4 py-2 rounded-lg shadow-lg"
          >
            <p class="font-bold">1644 - 1708</p>
          </div>
        </div>
      </div>
    </section>

    <!-- Historical Context Section -->
    <section
      ref="section4"
      class="section h-screen relative flex items-center px-8 bg-gray-800"
    >
      <div class="relative z-10 w-full max-w-6xl mx-auto">
        <h2
          class="text-4xl font-bold mb-12 text-center opacity-0 text-amber-400"
        >
          The Historical Battle
        </h2>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-8 opacity-0">
          <div
            class="bg-gray-900/80 p-6 rounded-lg border border-amber-600/30 hover:border-amber-400 transition-all"
          >
            <div class="text-amber-400 text-5xl font-bold mb-4">1673</div>
            <h3 class="text-xl font-bold mb-2 text-amber-300">
              The Year of Conflict
            </h3>
            <p class="text-gray-300">
              During the Third Anglo-Dutch War, when naval supremacy in the
              Channel was hotly contested.
            </p>
          </div>

          <div
            class="bg-gray-900/80 p-6 rounded-lg border border-amber-600/30 hover:border-amber-400 transition-all"
          >
            <div class="text-amber-400 text-5xl font-bold mb-4">27+</div>
            <h3 class="text-xl font-bold mb-2 text-amber-300">Ships Engaged</h3>
            <p class="text-gray-300">
              The battle involved a combined fleet of Dutch and English vessels
              fighting for control.
            </p>
          </div>

          <div
            class="bg-gray-900/80 p-6 rounded-lg border border-amber-600/30 hover:border-amber-400 transition-all"
          >
            <div class="text-amber-400 text-5xl font-bold mb-4">1690</div>
            <h3 class="text-xl font-bold mb-2 text-amber-300">
              Painting Created
            </h3>
            <p class="text-gray-300">
              Storck painted this dramatic interpretation years after the actual
              battle.
            </p>
          </div>
        </div>

        <div class="mt-12 text-center opacity-0">
          <button
            class="px-6 py-3 border border-amber-400 text-amber-400 rounded-lg font-medium hover:bg-amber-400/10 transition-all flex items-center mx-auto"
          >
            <svg
              class="w-5 h-5 mr-2"
              fill="none"
              stroke="currentColor"
              viewBox="0 0 24 24"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"
              ></path>
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"
              ></path>
            </svg>
            View Painting Analysis
          </button>
        </div>
      </div>
    </section>

    <!-- Final Viewing Room -->
    <section
      ref="section5"
      class="section h-screen relative flex items-center justify-center px-8"
    >
      <div class="absolute inset-0 bg-black z-0"></div>
      <div class="absolute inset-0 flex items-center justify-center z-10">
        <img
          src="/7.jpg"
          alt="Battle of Torquay by Abraham Storck"
          class="max-h-[90vh] max-w-[90vw] object-contain painting-final"
        />
      </div>

      <div class="absolute bottom-8 left-0 right-0 text-center z-20 opacity-0">
        <p class="text-gray-400 mb-2">You've completed the journey through</p>
        <h3 class="text-2xl text-amber-300 font-medium">
          The Battle of Torquay by Abraham Storck
        </h3>
        <button
          class="mt-4 px-6 py-2 bg-amber-600 rounded-lg font-medium hover:bg-amber-700 transition-all"
        >
          Experience Again
        </button>
      </div>
    </section>
  </div>
</template>

<script setup>
import { onMounted, ref } from "vue";
import { gsap } from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";

gsap.registerPlugin(ScrollTrigger);

const section1 = ref(null);
const section2 = ref(null);
const section3 = ref(null);
const section4 = ref(null);
const section5 = ref(null);
const mainPainting = ref(null);
// Removed unused paintingMask declaration

const paintingDetails = [
  {
    title: "Dutch Flagship",
    description:
      "The central vessel flying the Dutch tricolor, likely representing Admiral de Ruyter's ship.",
    position: { x: 45, y: 30 },
  },
  {
    title: "Battle Smoke",
    description:
      "Storck's dramatic use of smoke conveys the chaos of naval combat.",
    position: { x: 60, y: 50 },
  },
  {
    title: "Cannon Fire",
    description:
      "Detailed depiction of muzzle flashes and recoil from the ship's broadside.",
    position: { x: 70, y: 40 },
  },
  {
    title: "Sailing Techniques",
    description:
      "Note the precise rendering of sails and rigging characteristic of Storck's work.",
    position: { x: 30, y: 60 },
  },
];

const startExperience = () => {
  gsap.to(".painting-mask", {
    scaleY: 0,
    duration: 1.5,
    ease: "power3.inOut",
    onComplete: () => {
      gsap.to(mainPainting.value, { opacity: 1, duration: 1 });
      setupPaintingAnimation();
    },
  });
};

const setupPaintingAnimation = () => {
  // Painting zoom and pan effects
  ScrollTrigger.create({
    trigger: section2.value,
    start: "top top",
    end: "bottom bottom",
    scrub: true,
    onUpdate: (self) => {
      const progress = self.progress;
      const scale = 1 + progress * 0.5;
      const y = progress * -10;
      gsap.to(mainPainting.value, {
        scale: scale,
        y: y,
        duration: 0.1,
      });

      // Reveal details at certain scroll points
      paintingDetails.forEach((detail, index) => {
        const detailProgress = progress * 4 - index * 0.2;
        if (detailProgress > 0.2 && detailProgress < 0.8) {
          gsap.to(`.detail-spotlight:nth-child(${index + 2})`, {
            scale: 1,
            opacity: 1,
            duration: 0.3,
          });
        } else {
          gsap.to(`.detail-spotlight:nth-child(${index + 2})`, {
            scale: 0,
            opacity: 0,
            duration: 0.3,
          });
        }
      });
    },
  });
};

onMounted(() => {
  const sections = [section1, section2, section3, section4, section5];

  sections.forEach((section, index) => {
    const el = section.value;
    const children = el.querySelectorAll(".opacity-0");

    children.forEach((child, childIndex) => {
      gsap.fromTo(
        child,
        { opacity: 0, y: 20 },
        {
          opacity: 1,
          y: 0,
          duration: 1,
          delay: childIndex * 0.2 + index * 0.1,
          scrollTrigger: {
            trigger: el,
            start: "top 75%",
            toggleActions: "play none none none",
          },
        }
      );
    });
  });

  // Initial painting mask setup
  gsap.set(".painting-mask", { scaleY: 1 });
});
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&display=swap");

.section {
  position: relative;
  padding: 0 2rem;
}

.painting-mask {
  transform-origin: top;
}

.painting-image {
  transform-origin: center center;
  transition: transform 0.1s ease-out;
}

.detail-spotlight {
  opacity: 0;
  transform: scale(0);
  cursor: pointer;
}

.detail-spotlight:hover {
  z-index: 100 !important;
}

.painting-final {
  box-shadow: 0 0 60px rgba(200, 150, 50, 0.3);
  animation: pulseGlow 8s infinite alternate;
}

@keyframes pulseGlow {
  0% {
    box-shadow: 0 0 60px rgba(200, 150, 50, 0.3);
  }
  100% {
    box-shadow: 0 0 100px rgba(200, 150, 50, 0.5);
  }
}
</style>
