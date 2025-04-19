<template>
  <div class="w-full min-h-screen bg-black text-amber-50 overflow-x-hidden" ref="appContainer">
    <!-- Section 1: Stormy Seas Opening -->
    <section class="h-screen relative flex items-center justify-center overflow-hidden">
      <!-- Animated Ocean Background -->
      <div class="absolute inset-0 ocean-waves">
        <div class="wave-layer wave-1"></div>
        <div class="wave-layer wave-2"></div>
        <div class="wave-layer wave-3"></div>
      </div>

      <!-- Burning Horizon Effect -->
      <div class="absolute inset-0 burning-horizon"></div>

      <div class="relative z-10 text-center px-8 max-w-4xl">
        <h1 
          class="text-7xl md:text-9xl font-bold mb-8 text-transparent bg-clip-text bg-gradient-to-b from-amber-300 via-orange-500 to-amber-900 tracking-tight leading-tight"
          ref="title"
        >
          <span class="block opacity-0 title-word">TORQUAY</span>
          <span class="block opacity-0 title-word">INFERNO</span>
        </h1>
        <div class="w-full max-w-md mx-auto opacity-0" ref="subtitle">
          <div class="h-px bg-gradient-to-r from-transparent via-amber-400 to-transparent mb-6"></div>
          <p class="text-xl text-amber-300/80 font-light tracking-widest">JUNE 27, 1673</p>
        </div>
      </div>

      <!-- Floating Ghost Ships -->
      <div 
        v-for="i in 3"
        :key="i"
        class="absolute ghost-ship opacity-0"
        :style="{
          left: `${10 + i * 30}%`,
          bottom: `${10 + i * 5}%`,
          filter: `hue-rotate(${i * 40}deg)`
        }"
      ></div>

      <div class="absolute bottom-12 left-0 right-0 text-center z-10">
        <button 
          @click="startExperience"
          class="storm-button"
        >
          <span class="flex items-center gap-2">
            ENTER THE MAELSTROM
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 animate-pulse" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 5l7 7-7 7M5 5l7 7-7 7" />
            </svg>
          </span>
        </button>
      </div>
    </section>

    <!-- Section 2: Living Battlefield -->
    <section class="min-h-[400vh] relative" ref="battleSection">
      <div class="sticky top-0 h-screen w-full flex items-center justify-center overflow-hidden">
        <!-- Dynamic Painting Core -->
        <div class="relative w-full h-full max-w-6xl">
          <img 
            src="/7.jpg" 
            alt="The Battle Comes Alive" 
            class="absolute inset-0 w-full h-full object-cover opacity-90 battle-painting"
            ref="battleImage"
          >

          <!-- Interactive Elements -->
          <div class="absolute inset-0">
            <!-- Cannon Fire Particles -->
            <div 
              v-for="i in 12"
              :key="`cannon-${i}`"
              class="absolute cannon-blast origin-center"
              :style="{
                left: `${15 + (i % 4) * 25}%`,
                top: `${20 + Math.floor(i / 4) * 20}%`,
                transform: `scale(${Math.random() * 0.5 + 0.5})`
              }"
            ></div>

            <!-- Sailor's Whisper Hotspots -->
            <button
              v-for="(story, i) in battleStories"
              :key="`story-${i}`"
              @click="tellStory(i)"
              class="absolute sailor-marker"
              :style="{
                left: `${story.position.x}%`,
                top: `${story.position.y}%`
              }"
            >
              <div class="marker-pulse"></div>
              <div class="marker-core"></div>
            </button>

            <!-- Drifting Smoke -->
            <div 
              v-for="i in 8"
              :key="`smoke-${i}`"
              class="absolute smoke-cloud"
              :style="{
                left: `${Math.random() * 100}%`,
                top: `${Math.random() * 100}%`,
                width: `${Math.random() * 200 + 100}px`,
                height: `${Math.random() * 200 + 100}px`,
                opacity: Math.random() * 0.6 + 0.2,
                animationDelay: `${Math.random() * 5}s`
              }"
            ></div>
          </div>
        </div>

        <!-- Storytelling Canvas -->
        <div 
          class="absolute inset-0 pointer-events-none flex items-center justify-center"
          :class="{ 'pointer-events-auto': activeStory !== null }"
        >
          <div 
            class="story-card"
            :class="{ 'active': activeStory !== null }"
          >
            <div v-if="activeStory !== null" class="p-6">
              <h3 class="text-2xl font-bold mb-3 text-amber-300 border-b border-amber-400/30 pb-2">
                {{ battleStories[activeStory].title }}
              </h3>
              <p class="mb-4">{{ battleStories[activeStory].content }}</p>
              <p class="text-amber-400/80 italic">
                "{{ battleStories[activeStory].quote }}"
              </p>
              <button 
                @click="activeStory = null"
                class="absolute top-4 right-4 text-amber-400 hover:text-white"
              >
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                </svg>
              </button>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Section 3: Aftermath -->
    <section class="h-screen relative flex items-center justify-center">
      <div class="absolute inset-0 aftermath-visual">
        <div class="absolute inset-0 bg-[url('/7.jpg')] bg-cover bg-center opacity-10"></div>
        <div class="absolute inset-0 bg-gradient-to-t from-black via-black/50 to-black z-1"></div>
        <div class="absolute inset-0 raining-embers"></div>
      </div>

      <div class="relative z-10 text-center max-w-2xl px-8">
        <h2 class="text-5xl font-bold mb-8 text-transparent bg-clip-text bg-gradient-to-r from-amber-300 to-amber-600">
          ASHES ON THE TIDE
        </h2>
        <div class="h-px bg-gradient-to-r from-transparent via-amber-400/50 to-transparent my-8"></div>
        <p class="text-xl text-amber-100/80 mb-8 leading-relaxed">
          When the smoke cleared, the sea bore witness to valor and sacrifice - 
          a story now preserved in pigment and memory
        </p>
        <button 
          @click="resetExperience"
          class="phoenix-button"
        >
          <span class="flex items-center gap-2">
            RISE FROM THE ASHES
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 animate-bounce" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 10l7-7m0 0l7 7m-7-7v18" />
            </svg>
          </span>
        </button>
      </div>
    </section>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { gsap } from 'gsap'
import { ScrollTrigger } from 'gsap/ScrollTrigger'

gsap.registerPlugin(ScrollTrigger)

// Refs
const appContainer = ref(null)
const title = ref(null)
const subtitle = ref(null)
const battleSection = ref(null)
const battleImage = ref(null)

// Data
const activeStory = ref(null)
const battleStories = ref([
  {
    position: { x: 35, y: 25 },
    title: "DAWN'S CRUEL LIGHT",
    content: "As morning broke, Admiral de Ruyter positioned his fleet to exploit the rising sun, blinding English gunners while his Dutch crews could still aim true.",
    quote: "We fought with the sun as our ally and their tormentor"
  },
  {
    position: { x: 70, y: 40 },
    title: "IRON TEMPEST",
    content: "Each first-rate ship carried up to 100 cannons. A full broadside could unleash over a ton of iron across 300 yards in seconds.",
    quote: "The very air became solid with flying death"
  },
  {
    position: { x: 45, y: 60 },
    title: "DANCE OF DEATH",
    content: "Ships maintained line-ahead formations while reloading - a 3-minute ballet of pain where a single misstep meant destruction.",
    quote: "We moved through smoke and splinters like ghosts in Hades"
  },
  {
    position: { x: 20, y: 50 },
    title: "THE SURGEON'S CRUEL ART",
    content: "With no anesthesia, wounded men bit leather straps as surgeons sawed limbs. Only 1 in 5 abdominal wounds survived.",
    quote: "The cockpit floor grew slick with our brothers' blood"
  }
])

// Methods
const startExperience = () => {
  gsap.to(".ocean-waves", {
    opacity: 0,
    duration: 2,
    ease: "power2.in"
  })
  
  gsap.to(".burning-horizon", {
    scale: 3,
    opacity: 0,
    duration: 2.5,
    ease: "power2.in"
  })
  
  gsap.to(".ghost-ship", {
    opacity: 0,
    y: 100,
    duration: 1.5,
    stagger: 0.3
  })
  
  gsap.to(window, {
    scrollTo: battleSection.value,
    duration: 1,
    delay: 1.5
  })
}

const tellStory = (index) => {
  activeStory.value = index
  
  // Visual feedback
  gsap.to(`.sailor-marker:nth-child(${index + 1}) .marker-core`, {
    scale: 1.5,
    duration: 0.3,
    yoyo: true,
    repeat: 1
  })
  
  // Play cannon sound effect
  playCannonSound()
}

const playCannonSound = () => {
  // In a real implementation, this would trigger an audio file
  console.log("BOOM! Cannon sound plays")
}

const resetExperience = () => {
  gsap.to(window, { scrollTo: 0, duration: 1.5 })
  
  // Reset animations
  gsap.set([".ocean-waves", ".burning-horizon"], {
    opacity: 1,
    scale: 1
  })
  
  gsap.set(".ghost-ship", {
    opacity: 0,
    y: 0
  })
  
  // Replay entrance animations
  animateEntrance()
}

const animateEntrance = () => {
  // Title animation
  gsap.to(".title-word", {
    opacity: 1,
    y: 0,
    duration: 1.8,
    stagger: 0.4,
    ease: "elastic.out(1, 0.5)"
  })
  
  // Subtitle animation
  gsap.to(subtitle.value, {
    opacity: 1,
    duration: 1.5,
    delay: 0.8,
    ease: "power3.out"
  })
  
  // Ghost ships appear
  gsap.to(".ghost-ship", {
    opacity: 0.7,
    y: -20,
    duration: 3,
    delay: 1.5,
    stagger: 0.5,
    ease: "sine.inOut"
  })
}

const setupBattleAnimations = () => {
  // Cannon fire animations
  gsap.to(".cannon-blast", {
    scale: 2,
    opacity: 0,
    duration: 1,
    repeat: -1,
    repeatDelay: () => Math.random() * 3 + 1,
    ease: "power1.out"
  })
  
  // Painting parallax effect
  ScrollTrigger.create({
    trigger: battleSection.value,
    start: "top top",
    end: "bottom bottom",
    scrub: true,
    onUpdate: (self) => {
      const progress = self.progress
      gsap.to(battleImage.value, {
        scale: 1 + progress * 0.5,
        y: progress * -100,
        rotation: progress * 2,
        ease: "none"
      })
    }
  })
}

onMounted(() => {
  animateEntrance()
  setupBattleAnimations()
})
</script>

<style scoped>
/* Ocean Animation */
.ocean-waves {
  perspective: 1000px;
  transform-style: preserve-3d;
}

.wave-layer {
  position: absolute;
  inset: 0;
  background: linear-gradient(to bottom, transparent 60%, rgba(30, 64, 175, 0.3));
  background-size: 200% 100%;
  animation: oceanWave 8s linear infinite;
  transform-origin: bottom;
}

.wave-1 {
  animation-duration: 12s;
  opacity: 0.8;
  background-blend-mode: overlay;
}

.wave-2 {
  animation-duration: 8s;
  opacity: 0.6;
  background-blend-mode: soft-light;
}

.wave-3 {
  animation-duration: 15s;
  opacity: 0.4;
  background-blend-mode: hard-light;
}

@keyframes oceanWave {
  0% { transform: scaleY(1) translateY(0); }
  50% { transform: scaleY(1.2) translateY(-5%); }
  100% { transform: scaleY(1) translateY(0); }
}

/* Burning Horizon */
.burning-horizon {
  background: radial-gradient(ellipse at center, 
    rgba(245, 158, 11, 0.8) 0%, 
    rgba(220, 38, 38, 0.6) 30%, 
    rgba(0, 0, 0, 0) 70%);
  mix-blend-mode: hard-light;
  transform-origin: center bottom;
}

/* Ghost Ships */
.ghost-ship {
  width: 150px;
  height: 150px;
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='rgba(245,158,11,0.3)'%3E%3Cpath d='M3 17l3.2-9.6c.2-.6.8-1 1.4-1H22l-2 8h-5.5l-.5 2h-8l-.5-2H5L3 17z'/%3E%3C/svg%3E");
  background-size: contain;
  background-repeat: no-repeat;
  filter: drop-shadow(0 0 10px rgba(245, 158, 11, 0.5));
  transform: translateY(50px);
}

/* Storm Button */
.storm-button {
  padding: 12px 24px;
  background: rgba(0, 0, 0, 0.3);
  border: 2px solid rgba(245, 158, 11, 0.5);
  color: rgba(245, 158, 11, 0.9);
  font-size: 1.1rem;
  letter-spacing: 1px;
  border-radius: 999px;
  backdrop-filter: blur(5px);
  transition: all 0.3s ease;
  box-shadow: 
    0 0 15px rgba(245, 158, 11, 0.3),
    inset 0 0 10px rgba(245, 158, 11, 0.2);
}

.storm-button:hover {
  background: rgba(245, 158, 11, 0.1);
  border-color: rgba(245, 158, 11, 0.8);
  color: white;
  box-shadow: 
    0 0 25px rgba(245, 158, 11, 0.5),
    inset 0 0 15px rgba(245, 158, 11, 0.3);
  transform: translateY(-2px);
}

/* Battle Elements */
.cannon-blast {
  width: 40px;
  height: 40px;
  background: radial-gradient(circle, rgba(255,200,100,0.8) 0%, rgba(255,100,50,0) 70%);
  border-radius: 50%;
  filter: blur(2px);
  opacity: 0.7;
}

.sailor-marker {
  width: 24px;
  height: 24px;
  display: flex;
  align-items: center;
  justify-content: center;
  transform: translate(-50%, -50%);
}

.marker-core {
  width: 8px;
  height: 8px;
  background: rgba(245, 158, 11, 0.8);
  border-radius: 50%;
  transition: all 0.3s ease;
  box-shadow: 0 0 10px rgba(245, 158, 11, 0.8);
}

.marker-pulse {
  position: absolute;
  width: 24px;
  height: 24px;
  border: 1px solid rgba(245, 158, 11, 0.5);
  border-radius: 50%;
  animation: pulse 2s infinite;
}

.smoke-cloud {
  background: radial-gradient(circle, rgba(100,100,100,0.3) 0%, transparent 70%);
  filter: blur(10px);
  animation: drift 20s linear infinite;
  transform-origin: center;
}

/* Story Card */
.story-card {
  position: absolute;
  max-width: 400px;
  background: rgba(10, 10, 10, 0.9);
  border: 1px solid rgba(245, 158, 11, 0.3);
  border-radius: 8px;
  backdrop-filter: blur(10px);
  transform: scale(0.9);
  opacity: 0;
  transition: all 0.4s cubic-bezier(0.16, 1, 0.3, 1);
  box-shadow: 0 0 30px rgba(0, 0, 0, 0.7);
}

.story-card.active {
  transform: scale(1);
  opacity: 1;
}

/* Aftermath Effects */
.raining-embers {
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='rgba(245,158,11,0.3)'%3E%3Cpath d='M13 14.9l3 3.1-1.4 1.4-3-3.1-3.1 3.1-1.4-1.4 3.1-3.1L6 11.9l1.4-1.4 3.1 3.1 3-3.1 1.4 1.4-3 3.1 3.1 3.1-1.4 1.4-3.1-3.1z'/%3E%3C/svg%3E");
  background-size: 20px 20px;
  opacity: 0.1;
  animation: emberFall 60s linear infinite;
}

/* Phoenix Button */
.phoenix-button {
  padding: 12px 24px;
  background: linear-gradient(to bottom, rgba(245, 158, 11, 0.2), rgba(220, 38, 38, 0.1));
  border: 1px solid rgba(245, 158, 11, 0.5);
  color: rgba(245, 158, 11, 0.9);
  font-size: 1.1rem;
  letter-spacing: 1px;
  border-radius: 999px;
  transition: all 0.3s ease;
  box-shadow: 
    0 0 15px rgba(245, 158, 11, 0.2),
    inset 0 0 10px rgba(245, 158, 11, 0.1);
}

.phoenix-button:hover {
  background: linear-gradient(to bottom, rgba(245, 158, 11, 0.3), rgba(220, 38, 38, 0.2));
  border-color: rgba(245, 158, 11, 0.8);
  color: white;
  box-shadow: 
    0 0 25px rgba(245, 158, 11, 0.4),
    inset 0 0 15px rgba(245, 158, 11, 0.2);
  transform: translateY(-2px);
}

/* Animations */
@keyframes pulse {
  0% { transform: scale(0.8); opacity: 0.5; }
  70% { transform: scale(1.3); opacity: 0.1; }
  100% { transform: scale(0.8); opacity: 0.5; }
}

@keyframes drift {
  0% { transform: translate(0, 0) rotate(0deg); }
  100% { transform: translate(100px, -50px) rotate(360deg); }
}

@keyframes emberFall {
  0% { background-position: 0 0; }
  100% { background-position: -1000px 1000px; }
}

/* Base Styles */
.battle-painting {
  transform-origin: center center;
  transition: transform 0.1s linear;
}

.title-word {
  transform: translateY(50px);
  opacity: 0;
}

/* Custom Scrollbar */
::-webkit-scrollbar {
  width: 8px;
  height: 8px;
}

::-webkit-scrollbar-track {
  background: #111827;
}

::-webkit-scrollbar-thumb {
  background: rgba(245, 158, 11, 0.5);
  border-radius: 4px;
}

::-webkit-scrollbar-thumb:hover {
  background: rgba(245, 158, 11, 0.7);
}
</style>