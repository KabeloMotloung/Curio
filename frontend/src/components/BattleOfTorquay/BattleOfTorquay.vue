<template>
  <div class="w-full min-h-screen bg-gray-900 text-white overflow-x-hidden font-serif">
    <!-- Hero Section -->
     
    <section
      ref="section1"
      class="section h-screen relative flex flex-col justify-center items-center px-8 overflow-hidden"
    >
      <div class="absolute inset-0 bg-[url('/7.jpg')] bg-cover opacity-20 z-0"></div>
      <div class="painting-mask absolute inset-0 z-10 bg-black"></div>

      <div class="relative z-20 text-center max-w-4xl">
        <h1
          class="text-5xl md:text-7xl font-bold mb-4 opacity-0 tracking-tight"
          style="font-family: 'Cinzel', serif"
        >
          THE BATTLE OF TORQUAY
        </h1>
        <h2 class="text-xl md:text-2xl text-amber-300 opacity-0 font-light tracking-widest">
          June 27, 1673: When the Sea Turned to Fire
        </h2>
        <div class="mt-12 opacity-0">
          <button
            @click="startExperience"
            class="px-8 py-3 bg-amber-600 hover:bg-amber-700 rounded-full font-medium transition-all transform hover:scale-105"
          >
            Begin the Story ↓
          </button>
        </div>
      </div>

      <div class="absolute bottom-4 left-0 right-0 text-center text-sm text-gray-400 opacity-0">
        "The morning mist clung to the Channel as 72 ships prepared for bloodshed..."
      </div>
    </section>

    <!-- Animated Timeline Section -->
    <section ref="section2" class="section h-[180vh] relative bg-gray-800">
      <div class="sticky top-0 h-screen flex items-center">
        <div class="w-full max-w-6xl mx-auto px-8">
          <h2 class="text-4xl font-bold mb-12 text-center text-amber-400 opacity-0">
            Dawn Approaches: The Battle Unfolds
          </h2>

          <div class="relative h-96 timeline-container opacity-0">
            <!-- Timeline line -->
            <div class="absolute left-8 md:left-1/2 h-full w-1 bg-amber-400/50 timeline-line transform -translate-x-1/2"></div>
            
            <!-- Timeline events -->
            <div v-for="(event, index) in timelineEvents" :key="index" 
              class="absolute timeline-event"
              :style="{ top: `${15 + index * 25}%`}">
              <div class="flex items-start">
                <div class="bg-amber-400 rounded-full h-4 w-4 mt-1 flex-shrink-0 timeline-dot"></div>
                <div class="ml-4 bg-gray-900/90 p-4 rounded-lg border border-amber-600/30 max-w-md">
                  <h3 class="text-lg font-bold text-amber-300">{{ event.time }}</h3>
                  <p class="text-gray-300">{{ event.description }}</p>
                  <p class="text-sm text-amber-400/80 mt-1 italic">{{ event.quote }}</p>
                </div>
              </div>
            </div>
          </div>

          <div class="mt-12 text-center opacity-0">
            <button
              @click="scrollToSection(section3)"
              class="px-6 py-3 border border-amber-400 text-amber-400 rounded-lg font-medium hover:bg-amber-400/10 transition-all"
            >
              Continue to Tactics →
            </button>
          </div>
        </div>
      </div>
    </section>

    <!-- Tactical Storytelling Section -->
    <section ref="section3" class="section h-[200vh] relative bg-gray-900/50">
      <div class="sticky top-0 h-screen flex items-center">
        <div class="w-full max-w-6xl mx-auto px-8">
          <h2 class="text-4xl font-bold mb-12 text-center text-amber-400 opacity-0">
            Masterstroke at Sea: De Ruyter's Gambit
          </h2>

          <div class="grid grid-cols-1 md:grid-cols-2 gap-12">
            <div class="space-y-8 opacity-0">
              <div class="bg-gray-900/90 p-6 rounded-lg border border-amber-600/30 hover:border-amber-400 transition-all">
                <h3 class="text-xl font-bold mb-2 text-amber-300">The Dutch Advantage</h3>
                <p class="text-gray-300">
                  As dawn broke, de Ruyter positioned his fleet to exploit the eastern light, blinding English gunners while 
                  his own crews, having trained relentlessly, could still pick their targets. The morning breeze carried 
                  the scent of salt and gunpowder as the Dutch ships closed the distance.
                </p>
              </div>

              <div class="bg-gray-900/90 p-6 rounded-lg border border-amber-600/30 hover:border-amber-400 transition-all">
                <h3 class="text-xl font-bold mb-2 text-amber-300">A Dance of Destruction</h3>
                <p class="text-gray-300">
                  English logs would later describe the Dutch formation as "a crescent of fire." Each broadside was timed 
                  to perfection, the thunderous roar of cannons followed by the terrible sound of splintering oak. 
                  The painting captures this moment - the chaotic beauty of disciplined violence.
                </p>
              </div>
            </div>

            <div class="relative opacity-0">
              <img
                src="/7.jpg"
                alt="Battle Tactical Map"
                class="w-full rounded-lg shadow-2xl border-4 border-amber-600/50"
              />
              <div class="absolute -bottom-4 -right-4 bg-amber-600 text-black px-4 py-2 rounded-lg shadow-lg">
                <p class="font-bold">The Battle Painting</p>
              </div>
              <div class="absolute top-4 left-4 bg-black/80 p-3 rounded-lg">
                <p class="text-sm text-amber-300 italic">"Their line held like tempered steel"<br>- English Captain's Log</p>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="absolute bottom-4 left-0 right-0 text-center text-sm text-gray-400 opacity-0">
        "By midday, the Channel ran red with the blood of sailors from both nations..."
      </div>
    </section>

    <!-- Neural Network Canvas Section -->
    <section class="min-h-[300vh] relative" ref="section4">
      <div class="sticky top-0 h-screen w-full flex items-center justify-center overflow-hidden">
        <!-- AI Analysis Overlay -->
        <div class="absolute inset-0 z-0 ai-grid-pattern"></div>
        
        <!-- Enhanced Painting Container -->
        <div class="relative w-full max-w-5xl px-4 z-10">
          <div class="relative overflow-hidden rounded-xl border border-amber-400/20 glow-container">
            <img 
              src="/7.jpg" 
              alt="Enhanced battle visualization" 
              class="w-full h-auto painting-img opacity-0"
              ref="painting"
            >
            
            <!-- Dynamic Analysis Overlays -->
            <div class="absolute inset-0 pointer-events-none">
              <div 
                v-for="(layer, i) in aiAnalysisLayers"
                :key="i"
                class="absolute inset-0 opacity-0 transition-opacity duration-1000"
                :class="{ 'opacity-100': activeLayer === i }"
                :style="{
                  background: layer.overlay,
                  mixBlendMode: layer.blendMode
                }"
              ></div>
            </div>

            <!-- Floating Data Nodes -->
            <div 
              v-for="(node, i) in dataNodes"
              :key="i"
              class="absolute w-4 h-4 rounded-full bg-amber-400/80 pointer-events-none data-node"
              :style="{
                top: `${node.y}%`,
                left: `${node.x}%`,
                boxShadow: `0 0 ${activeNode === i ? '20px 5px' : '10px 2px'} rgba(245,158,11,${activeNode === i ? 0.8 : 0.4})`
              }"
            ></div>
          </div>
        </div>

        <!-- Quantum Interface Controls -->
        <div class="absolute bottom-12 left-0 right-0 z-20">
          <div class="flex justify-center gap-6">
            <button 
              v-for="(layer, i) in aiAnalysisLayers"
              :key="i"
              @click="activateLayer(i)"
              class="quantum-pill"
              :class="{ 'active-pill': activeLayer === i }"
            >
              {{ layer.label }}
            </button>
          </div>
        </div>

        <!-- Neural Connections -->
        <canvas ref="neuralCanvas" class="absolute inset-0 w-full h-full pointer-events-none z-5"></canvas>
      </div>
    </section>

    <!-- Hyperreal Conclusion Section -->
    <section ref="section5" class="h-screen relative flex items-center justify-center bg-black/90">
      <div class="absolute inset-0 overflow-hidden z-0">
        <div 
          class="absolute inset-0 bg-[url('/7.jpg')] bg-cover bg-center opacity-10"
          :style="{
            transform: `scale(${zoomLevel}) rotate(${tiltAngle}deg)`,
            filter: `blur(${blurAmount}px)`
          }"
        ></div>
        <div class="absolute inset-0 bg-gradient-to-t from-black via-transparent to-black z-1"></div>
      </div>

      <div class="relative z-10 text-center max-w-2xl px-8 opacity-0" ref="endContent">
        <h2 class="text-4xl md:text-5xl font-bold mb-6 text-transparent bg-clip-text bg-gradient-to-r from-amber-300 to-amber-500">
          BATTLE RESONANCE
        </h2>
        <div class="h-px bg-gradient-to-r from-transparent via-amber-400/50 to-transparent my-8"></div>
        <div class="spectrum-analyzer mb-8 mx-auto"></div>
        <button 
          @click="resetExperience"
          class="neon-button"
        >
          <span class="flex items-center gap-2">
            INITIATE REBOOT
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 group-hover:rotate-180 transition-transform" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15" />
            </svg>
          </span>
        </button>
      </div>
    </section>
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'
import { gsap } from 'gsap'
import { ScrollTrigger } from 'gsap/ScrollTrigger'

gsap.registerPlugin(ScrollTrigger)

// Refs
const section1 = ref(null)
const section2 = ref(null)
const section3 = ref(null)
const section4 = ref(null)
const section5 = ref(null)
const painting = ref(null)
const neuralCanvas = ref(null)
const endContent = ref(null)

// Data
const timelineEvents = [
  {
    time: "04:30 Dawn",
    description: "Dutch scouts spot the English fleet near Torquay Bay",
    quote: "'The horizon bloomed with sails' - Dutch sailor's account"
  },
  {
    time: "06:15 First Contact",
    description: "De Ruyter orders the line-ahead formation",
    quote: "'Beat to quarters! All hands make sail!'"
  },
  {
    time: "08:45 Broadside Exchange",
    description: "Intense cannon fire begins, lasting nearly 5 hours",
    quote: "'The very sea trembled with our guns' - Gunner's log"
  },
  {
    time: "14:20 Disengagement",
    description: "Both fleets break contact to assess damages",
    quote: "'Smoke obscured the sun itself by midday'"
  }
]

const aiAnalysisLayers = [
  {
    label: "THERMAL",
    overlay: "radial-gradient(circle at center, rgba(255,50,0,0.3) 0%, transparent 70%)",
    blendMode: "hard-light"
  },
  {
    label: "SPECTRAL",
    overlay: "conic-gradient(from 90deg, rgba(0,200,255,0.2), rgba(0,255,150,0.3), rgba(255,0,200,0.2), rgba(0,200,255,0.2))",
    blendMode: "screen"
  },
  {
    label: "STRUCTURAL",
    overlay: "repeating-linear-gradient(45deg, rgba(245,158,11,0.1) 0px, rgba(245,158,11,0.1) 2px, transparent 2px, transparent 4px)",
    blendMode: "overlay"
  }
]

const dataNodes = [
  { x: 30, y: 25 }, { x: 65, y: 45 }, { x: 45, y: 60 },
  { x: 75, y: 35 }, { x: 25, y: 50 }, { x: 55, y: 30 }
]

const activeLayer = ref(0)
const activeNode = ref(0)
const zoomLevel = ref(1)
const tiltAngle = ref(0)
const blurAmount = ref(3)

// Methods
const scrollToSection = (sectionRef) => {
  if (sectionRef?.value) {
    sectionRef.value.scrollIntoView({ behavior: "smooth" })
  }
}

const activateLayer = (index) => {
  activeLayer.value = index
  animateDataNodes()
}

const animateDataNodes = () => {
  activeNode.value = (activeNode.value + 1) % dataNodes.length
  
  gsap.to(".data-node", {
    scale: (i) => i === activeNode.value ? 1.5 : 1,
    duration: 0.8,
    ease: "elastic.out(1, 0.5)"
  })
}

const startExperience = () => {
  gsap.to(".painting-mask", {
    scaleY: 0,
    duration: 1.8,
    ease: "power3.inOut",
    onComplete: () => {
      animateTimeline()
      scrollToSection(section2)
    }
  })
}

const resetExperience = () => {
  gsap.to(window, { scrollTo: 0, duration: 1.5 })
  
  // Reset all animations
  gsap.set(".opacity-0", { opacity: 0, y: 20 })
  gsap.set(".timeline-event", { opacity: 0, x: -20 })
  gsap.set(".timeline-line", { scaleY: 0 })
  gsap.set(painting.value, { opacity: 0 })
  gsap.set(endContent.value, { opacity: 0 })
  gsap.set([zoomLevel, tiltAngle, blurAmount], {
    zoomLevel: 1,
    tiltAngle: 0,
    blurAmount: 3
  })
}

const animateTimeline = () => {
  gsap.to(".timeline-line", {
    scaleY: 1,
    duration: 2,
    ease: "power2.inOut"
  })

  gsap.to(".timeline-event", {
    opacity: 1,
    x: 0,
    duration: 0.8,
    stagger: 0.3,
    scrollTrigger: {
      trigger: section2.value,
      start: "top center",
      end: "bottom bottom",
      scrub: 0.5
    }
  })
}

const drawNeuralNetwork = () => {
  const canvas = neuralCanvas.value
  const ctx = canvas.getContext('2d')
  
  const resizeCanvas = () => {
    canvas.width = canvas.offsetWidth
    canvas.height = canvas.offsetHeight
  }
  
  const animate = () => {
    resizeCanvas()
    ctx.clearRect(0, 0, canvas.width, canvas.height)
    
    // Draw connections
    ctx.strokeStyle = `rgba(245, 158, 11, ${Math.random() * 0.2 + 0.1})`
    ctx.lineWidth = 1
    
    for (let i = 0; i < dataNodes.length; i++) {
      for (let j = i + 1; j < dataNodes.length; j++) {
        const node1 = dataNodes[i]
        const node2 = dataNodes[j]
        
        const x1 = (node1.x / 100) * canvas.width
        const y1 = (node1.y / 100) * canvas.height
        const x2 = (node2.x / 100) * canvas.width
        const y2 = (node2.y / 100) * canvas.height
        
        ctx.beginPath()
        ctx.moveTo(x1, y1)
        ctx.bezierCurveTo(
          x1 + (Math.random() * 100 - 50),
          y1 + (Math.random() * 100 - 50),
          x2 + (Math.random() * 100 - 50),
          y2 + (Math.random() * 100 - 50),
          x2, y2
        )
        ctx.stroke()
      }
    }
    
    requestAnimationFrame(animate)
  }
  
  animate()
  window.addEventListener('resize', resizeCanvas)
}

const setupCanvasAnimations = () => {
  // Painting reveal with scanline effect
  gsap.to(painting.value, {
    opacity: 1,
    duration: 2,
    scrollTrigger: {
      trigger: section4.value,
      start: "top bottom",
      end: "bottom bottom",
      scrub: true
    }
  })
  
  // Floating nodes animation
  dataNodes.forEach((_, i) => {
    gsap.to(`.data-node:nth-child(${i + 1})`, {
      y: () => Math.random() * 20 - 10,
      x: () => Math.random() * 10 - 5,
      duration: 3 + Math.random() * 4,
      repeat: -1,
      yoyo: true,
      ease: "sine.inOut"
    })
  })
  
  // End content reveal
  gsap.to(endContent.value, {
    opacity: 1,
    y: 0,
    duration: 1.5,
    scrollTrigger: {
      trigger: endContent.value,
      start: "top 80%",
      toggleActions: "play none none none"
    }
  })
  
  // Background distortion effect
  gsap.to([zoomLevel, tiltAngle, blurAmount], {
    zoomLevel: 1.2,
    tiltAngle: 3,
    blurAmount: 8,
    duration: 10,
    scrollTrigger: {
      trigger: endContent.value,
      start: "top bottom",
      end: "bottom top",
      scrub: 1
    }
  })
}

onMounted(() => {
  // Setup section animations
  const sections = [section1, section2, section3, section4, section5]

  sections.forEach((section, index) => {
    const el = section.value
    if (!el) return

    const children = el.querySelectorAll(".opacity-0")

    children.forEach((child, childIndex) => {
      gsap.fromTo(
        child,
        { opacity: 0, y: 20 },
        {
          opacity: 1,
          y: 0,
          duration: 1.2,
          delay: childIndex * 0.2 + index * 0.2,
          scrollTrigger: {
            trigger: el,
            start: "top 70%",
            toggleActions: "play none none none",
          },
        }
      )
    })
  })

  // Initial setup
  gsap.set(".painting-mask", { scaleY: 1 })
  gsap.set(".timeline-line", { scaleY: 0 })
  gsap.set(".timeline-event", { opacity: 0, x: -20 })
  
  drawNeuralNetwork()
  setupCanvasAnimations()
  
  // Auto-cycle analysis layers
  let layerInterval = setInterval(() => {
    activeLayer.value = (activeLayer.value + 1) % aiAnalysisLayers.length
  }, 5000)
  
  // Auto-animate data nodes
  let nodeInterval = setInterval(animateDataNodes, 1500)
  
  // Store intervals for cleanup
  window.layerInterval = layerInterval
  window.nodeInterval = nodeInterval
})

onUnmounted(() => {
  clearInterval(window.layerInterval)
  clearInterval(window.nodeInterval)
  ScrollTrigger.getAll().forEach(instance => instance.kill())
  window.removeEventListener('resize', () => {})
})
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&display=swap");

html {
  scroll-behavior: smooth;
}

.section {
  position: relative;
  padding: 0 2rem;
  scroll-snap-align: start;
}

.painting-mask {
  transform-origin: top;
  background: linear-gradient(to bottom, #000 0%, #111 100%);
}

.painting-image {
  transform-origin: center center;
  transition: transform 0.2s ease-out;
  filter: drop-shadow(0 0 20px rgba(200, 150, 50, 0.2));
}

.timeline-container {
  perspective: 1000px;
}

.timeline-event {
  opacity: 0;
  transform: translateX(-20px);
  transition: all 0.5s ease;
}

.timeline-dot {
  box-shadow: 0 0 10px rgba(200, 150, 50, 0.8);
}

/* AI Analysis Section Styles */
.ai-grid-pattern {
  background-image: 
    radial-gradient(circle at center, rgba(245, 158, 11, 0.05) 0%, transparent 70%),
    linear-gradient(rgba(245, 158, 11, 0.02) 1px, transparent 1px),
    linear-gradient(90deg, rgba(245, 158, 11, 0.02) 1px, transparent 1px);
  background-size: 100% 100%, 40px 40px, 40px 40px;
  animation: pulseGrid 6s ease infinite alternate;
}

.glow-container {
  box-shadow: 0 0 60px rgba(245, 158, 11, 0.1);
}

.painting-img {
  transition: all 0.5s ease;
}

.data-node {
  transition: all 0.5s cubic-bezier(0.16, 1, 0.3, 1);
}

.quantum-pill {
  padding: 8px 20px;
  background: transparent;
  border: 1px solid rgba(245, 158, 11, 0.3);
  border-radius: 999px;
  color: rgba(245, 158, 11, 0.7);
  font-size: 0.9rem;
  letter-spacing: 1px;
  transition: all 0.3s ease;
  position: relative;
  overflow: hidden;
}

.quantum-pill::before {
  content: '';
  position: absolute;
  top: 0;
  left: -100%;
  width: 100%;
  height: 100%;
  background: linear-gradient(90deg, transparent, rgba(245, 158, 11, 0.1), transparent);
  transition: all 0.6s ease;
}

.quantum-pill:hover {
  border-color: rgba(245, 158, 11, 0.7);
  color: rgba(245, 158, 11, 0.9);
}

.quantum-pill:hover::before {
  left: 100%;
}

.active-pill {
  background: rgba(245, 158, 11, 0.1);
  border-color: rgba(245, 158, 11, 0.7);
  color: rgba(245, 158, 11, 0.9);
  box-shadow: 0 0 15px rgba(245, 158, 11, 0.3);
}

/* Spectrum Analyzer */
.spectrum-analyzer {
  width: 200px;
  height: 4px;
  background: linear-gradient(90deg, 
    transparent, 
    rgba(245, 158, 11, 0.3), 
    rgba(245, 158, 11, 0.7), 
    rgba(245, 158, 11, 0.3), 
    transparent);
  position: relative;
  overflow: hidden;
}

.spectrum-analyzer::after {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
  animation: spectrumScan 3s linear infinite;
}

/* Neon Button */
.neon-button {
  padding: 12px 24px;
  background: transparent;
  border: 1px solid rgba(245, 158, 11, 0.5);
  color: rgba(245, 158, 11, 0.9);
  font-size: 1rem;
  letter-spacing: 1px;
  border-radius: 4px;
  position: relative;
  overflow: hidden;
  transition: all 0.3s ease;
}

.neon-button::before {
  content: '';
  position: absolute;
  top: 0;
  left: -100%;
  width: 100%;
  height: 100%;
  background: linear-gradient(90deg, transparent, rgba(245, 158, 11, 0.2), transparent);
  transition: all 0.6s ease;
}

.neon-button:hover {
  border-color: rgba(245, 158, 11, 0.8);
  color: white;
  box-shadow: 0 0 10px rgba(245, 158, 11, 0.5),
              0 0 20px rgba(245, 158, 11, 0.3);
}

.neon-button:hover::before {
  left: 100%;
}

/* Animations */
@keyframes pulseGrid {
  0% { opacity: 0.5; }
  100% { opacity: 1; }
}

@keyframes spectrumScan {
  from { transform: translateX(-100%); }
  to { transform: translateX(100%); }
}

@media (min-height: 800px) {
  .section {
    min-height: 100vh;
    height: auto;
    padding: 4rem 0;
  }
  
  #section2, #section3, #section4 {
    height: auto;
    min-height: 100vh;
  }
}

/* Animation for the timeline line */
.timeline-line {
  transform-origin: top center;
}

/* Pulse animation for interactive elements */
@keyframes pulse {
  0% { transform: scale(1); }
  50% { transform: scale(1.05); }
  100% { transform: scale(1); }
}

.pulse-hover:hover {
  animation: pulse 2s infinite;
}
</style>