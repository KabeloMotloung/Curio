<template>
  <div class="relative w-full overflow-hidden h-[300vh]">
    <!-- Sky Background with oil painting colors -->
    <div class="fixed inset-0 bg-transition" ref="skyBackground">
      <img 
        src="./sky-background.jpg" 
        class="h-screen w-full object-cover" 
        ref="background" 
        alt="Background 1"
      />
    </div>


    <!-- Cloud Images Container -->
    <div class="fixed inset-0 pointer-events-none" ref="cloudContainer">      
      <div class="absolute top-0 left-0 w-full h-screen flex items-center justify-center text-4xl text-white">
      <h1>The Swan</h1>
    </div>
      <!-- Cloud images -->
      <img 
        src="./cloud.png" 
        class="absolute top-[15%] left-[10%] w-[30%] opacity-0" 
        ref="cloud1" 
        alt="Cloud 1"
      />
      <img 
        src="./cloud.png" 
        class="absolute top-[25%] right-[20%] w-[40%] opacity-0" 
        ref="cloud2" 
        alt="Cloud 2"
      />
      <img 
        src="./cloud.png" 
        class="absolute top-[60%] left-[30%] w-[35%] opacity-0" 
        ref="cloud3" 
        alt="Cloud 3"
      />
    </div>
    <!-- Main container for the painting -->
    <div class="relative z-10 flex flex-col items-center justify-center min-h-screen p-4">
      <!-- Painting container with scroll animation -->
      <div ref="paintingContainer" class="fixed top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 w-[95vw] max-w-[1200px] aspect-[4/3] opacity-0">
        <!-- Antique Picture Frame -->
        <div class="relative w-full h-full">
          <!-- Frame background -->
          <div class="absolute inset-0 bg-[#1a0f0f]/95"></div>
          
          <!-- Wood grain texture overlays -->
          <div class="absolute inset-0">
            <!-- Deep wood grain (primary) -->
            <div class="absolute inset-0 opacity-25">
              <div class="absolute inset-0 bg-[url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMDAiIGhlaWdodD0iMTAwIj48ZGVmcz48cGF0dGVybiBpZD0id29vZCIgd2lkdGg9IjUiIGhlaWdodD0iNSIgcGF0dGVyblVuaXRzPSJ1c2VyU3BhY2VPblVzZSI+PHBhdGggZD0iTSA1IDAgTCAwIDAgMCA1IiBmaWxsPSJub25lIiBzdHJva2U9IiMwMDAiIHN0cm9rZS13aWR0aD0iMSIvPjxwYXRoIGQ9Ik0gMCAwIEwgNSA1IiBmaWxsPSJub25lIiBzdHJva2U9IiMwMDAiIHN0cm9rZS13aWR0aD0iMSIvPjxwYXRoIGQ9Ik0gNSAwIEwgMCA1IiBmaWxsPSJub25lIiBzdHJva2U9IiMwMDAiIHN0cm9rZS13aWR0aD0iMSIvPjwvcGF0dGVybj48L2RlZnM+PHJlY3Qgd2lkdGg9IjEwMCIgaGVpZ2h0PSIxMDAiIGZpbGw9InVybCgjd29vZCkiLz48L3N2Zz4=')]"></div>
            </div>
            
            <!-- Aged wood grain (secondary) -->
            <div class="absolute inset-0 opacity-20">
              <div class="absolute inset-0 bg-[url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMDAiIGhlaWdodD0iMTAwIj48ZGVmcz48cGF0dGVybiBpZD0id29vZDIiIHdpZHRoPSIxMCIgaGVpZ2h0PSIxMCIgcGF0dGVyblVuaXRzPSJ1c2VyU3BhY2VPblVzZSI+PHBhdGggZD0iTSAxMCAwIEwgMCAwIDAgMTAiIGZpbGw9Im5vbmUiIHN0cm9rZT0iIzAwMCIgc3Ryb2tlLXdpZHRoPSIxIi8+PHBhdGggZD0iTSAwIDAgTCAxMCAxMCIgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjMDAwIiBzdHJva2Utd2lkdGg9IjEiLz48cGF0aCBkPSJNIDEwIDAgTCAwIDEwIiBmaWxsPSJub25lIiBzdHJva2U9IiMwMDAiIHN0cm9rZS13aWR0aD0iMSIvPjwvcGF0dGVybj48L2RlZnM+PHJlY3Qgd2lkdGg9IjEwMCIgaGVpZ2h0PSIxMDAiIGZpbGw9InVybCgjd29vZDIpIi8+PC9zdmc+')]"></div>
            </div>
            
            <!-- Natural imperfections -->
            <div class="absolute inset-0 opacity-15">
              <div class="absolute inset-0 bg-[url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMDAiIGhlaWdodD0iMTAwIj48ZGVmcz48cGF0dGVybiBpZD0iaW1wZXJmZWN0aW9ucyIgd2lkdGg9IjIwIiBoZWlnaHQ9IjIwIiBwYXR0ZXJuVW5pdHM9InVzZXJTcGFjZU9uVXNlIj48cGF0aCBkPSJNIDIwIDAgTCAwIDAgMCAyMCIgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjMDAwIiBzdHJva2Utd2lkdGg9IjEiLz48cGF0aCBkPSJNIDAgMCAgTCAyMCAyMCIgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjMDAwIiBzdHJva2Utd2lkdGg9IjEiLz48cGF0aCBkPSJNIDIwIDAgTCAwIDIwIiBmaWxsPSJub25lIiBzdHJva2U9IiMwMDAiIHN0cm9rZS13aWR0aD0iMSIvPjxwYXRoIGQ9Ik0gMTAgMCAgTCAwIDEwIiBmaWxsPSJub25lIiBzdHJva2U9IiMwMDAiIHN0cm9rZS13aWR0aD0iMSIvPjxwYXRoIGQ9Ik0gMjAgMTAgIEwgMTAgMjAiIGZpbGw9Im5vbmUiIHN0cm9rZT0iIzAwMCIgc3Ryb2tlLXdpZHRoPSIxIi8+PC9wYXR0ZXJuPjwvZGVmcz48cmVjdCB3aWR0aD0iMTAwIiBoZWlnaHQ9IjEwMCIgZmlsbD0idXJsKCNpbXBlcmZlY3Rpb25zKSIvPjwvc3ZnPg==')]"></div>
          </div>

          <!-- Wood knots and cracks -->
          <div class="absolute inset-0 opacity-10">
            <div class="absolute inset-0 bg-[url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMDAiIGhlaWdodD0iMTAwIj48ZGVmcz48cGF0dGVybiBpZD0ia25vdHMiIHdpZHRoPSI0MCIgaGVpZ2h0PSI0MCIgcGF0dGVyblVuaXRzPSJ1c2VyU3BhY2VPblVzZSI+PGNpcmNsZSBjeD0iMjAiIGN5PSIyMCIgcj0iMTAiIGZpbGw9Im5vbmUiIHN0cm9rZT0iIzAwMCIgc3Ryb2tlLXdpZHRoPSIxIi8+PGNpcmNsZSBjeD0iMjAiIGN5PSIyMCIgcj0iNSIgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjMDAwIiBzdHJva2Utd2lkdGg9IjEiLz48cGF0aCBkPSJNIDIwIDAgTCAyMCA0MCIgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjMDAwIiBzdHJva2Utd2lkdGg9IjEiLz48cGF0aCBkPSJNIDAgMjAgTCA0MCAyMCIgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjMDAwIiBzdHJva2Utd2lkdGg9IjEiLz48L3BhdHRlcm4+PC9kZWZzPjxyZWN0IHdpZHRoPSIxMDAiIGhlaWdodD0iMTAwIiBmaWxsPSJ1cmwoI2tub3RzKSIvPjwvc3ZnPg==')]"></div>
          </div>
        </div>
        
        <!-- Outer frame layer with 3D effect -->
        <div class="absolute inset-0 border-[12px] border-[#2a1f1f] bg-gradient-to-b from-[#3a2f2f] via-[#2a1f1f] to-[#1a0f0f] shadow-[inset_0_0_20px_rgba(0,0,0,0.5)]">
          <!-- Natural wood color variations -->
          <div class="absolute inset-0 bg-[#4a3f3f]/20"></div>
          <div class="absolute inset-0 bg-[#5a4f4f]/10"></div>
          <div class="absolute inset-0 bg-[#3a2f2f]/30"></div>
          <!-- 3D depth effect -->
          <div class="absolute inset-0 bg-gradient-to-r from-[#2a1f1f]/50 to-transparent"></div>
          <div class="absolute inset-0 bg-gradient-to-b from-[#2a1f1f]/50 to-transparent"></div>
        </div>
        
        <!-- Inner frame layers with 3D effect -->
        <div class="absolute inset-12 border-6 border-[#2a1f1f] bg-gradient-to-b from-[#3a2f2f] via-[#2a1f1f] to-[#1a0f0f] shadow-[inset_0_0_15px_rgba(0,0,0,0.4)]">
          <!-- Natural wood color variations -->
          <div class="absolute inset-0 bg-[#4a3f3f]/15"></div>
          <div class="absolute inset-0 bg-[#5a4f4f]/8"></div>
          <div class="absolute inset-0 bg-[#3a2f2f]/25"></div>
          <!-- 3D depth effect -->
          <div class="absolute inset-0 bg-gradient-to-r from-[#2a1f1f]/40 to-transparent"></div>
          <div class="absolute inset-0 bg-gradient-to-b from-[#2a1f1f]/40 to-transparent"></div>
        </div>
        <div class="absolute inset-16 border-4 border-[#1a0f0f] bg-gradient-to-b from-[#2a1f1f] to-[#1a0f0f] shadow-[inset_0_0_10px_rgba(0,0,0,0.3)]">
          <!-- Natural wood color variations -->
          <div class="absolute inset-0 bg-[#4a3f3f]/10"></div>
          <div class="absolute inset-0 bg-[#5a4f4f]/5"></div>
          <div class="absolute inset-0 bg-[#3a2f2f]/20"></div>
          <!-- 3D depth effect -->
          <div class="absolute inset-0 bg-gradient-to-r from-[#2a1f1f]/30 to-transparent"></div>
          <div class="absolute inset-0 bg-gradient-to-b from-[#2a1f1f]/30 to-transparent"></div>
        </div>
        
        <!-- Inner border transition -->
        <div class="absolute inset-20 border-2 border-[#2a1f1f]/20"></div>
        <div class="absolute inset-20 bg-gradient-to-b from-[#1a0f0f]/40 via-[#1a0f0f]/20 to-[#1a0f0f]/10"></div>
        <div class="absolute inset-20 bg-gradient-to-r from-[#1a0f0f]/40 via-[#1a0f0f]/20 to-[#1a0f0f]/10"></div>
        <div class="absolute inset-20 bg-gradient-to-tr from-[#1a0f0f]/30 via-transparent to-transparent"></div>
        
        <!-- Aged gold accents with 3D effect -->
        <div class="absolute top-0 left-0 w-32 h-32 border-t-8 border-l-8 border-[#b49474] transform rotate-0 shadow-[inset_-2px_-2px_4px_rgba(0,0,0,0.3)]">
          <div class="absolute top-0 left-0 w-16 h-16 border-t-4 border-l-4 border-[#c4a484] transform rotate-0"></div>
          <div class="absolute bottom-0 right-0 w-16 h-16 border-b-4 border-r-4 border-[#a48464] transform rotate-180"></div>
        </div>
        <div class="absolute top-0 right-0 w-32 h-32 border-t-8 border-r-8 border-[#b49474] transform rotate-90 shadow-[inset_2px_-2px_4px_rgba(0,0,0,0.3)]">
          <div class="absolute top-0 left-0 w-16 h-16 border-t-4 border-l-4 border-[#c4a484] transform rotate-90"></div>
          <div class="absolute bottom-0 right-0 w-16 h-16 border-b-4 border-r-4 border-[#a48464] transform -rotate-90"></div>
        </div>
        <div class="absolute bottom-0 left-0 w-32 h-32 border-b-8 border-l-8 border-[#b49474] transform -rotate-90 shadow-[inset_-2px_2px_4px_rgba(0,0,0,0.3)]">
          <div class="absolute top-0 left-0 w-16 h-16 border-t-4 border-l-4 border-[#c4a484] transform -rotate-90"></div>
          <div class="absolute bottom-0 right-0 w-16 h-16 border-b-4 border-r-4 border-[#a48464] transform rotate-90"></div>
        </div>
        <div class="absolute bottom-0 right-0 w-32 h-32 border-b-8 border-r-8 border-[#b49474] transform rotate-180 shadow-[inset_2px_2px_4px_rgba(0,0,0,0.3)]">
          <div class="absolute top-0 left-0 w-16 h-16 border-t-4 border-l-4 border-[#c4a484] transform rotate-180"></div>
          <div class="absolute bottom-0 right-0 w-16 h-16 border-b-4 border-r-4 border-[#a48464] transform rotate-0"></div>
        </div>

        <!-- Aged decorative elements with 3D effect -->
        <div class="absolute top-0 left-1/2 -translate-x-1/2 w-64 h-16 border-t-4 border-[#b49474] shadow-[inset_0_-2px_4px_rgba(0,0,0,0.3)]">
          <div class="absolute top-0 left-1/2 -translate-x-1/2 w-32 h-8 border-t-2 border-[#c4a484]"></div>
        </div>
        <div class="absolute bottom-0 left-1/2 -translate-x-1/2 w-64 h-16 border-b-4 border-[#b49474] shadow-[inset_0_2px_4px_rgba(0,0,0,0.3)]">
          <div class="absolute bottom-0 left-1/2 -translate-x-1/2 w-32 h-8 border-b-2 border-[#c4a484]"></div>
        </div>
        <div class="absolute left-0 top-1/2 -translate-y-1/2 w-16 h-64 border-l-4 border-[#b49474] shadow-[inset_-2px_0_4px_rgba(0,0,0,0.3)]">
          <div class="absolute left-0 top-1/2 -translate-y-1/2 w-8 h-32 border-l-2 border-[#c4a484]"></div>
        </div>
        <div class="absolute right-0 top-1/2 -translate-y-1/2 w-16 h-64 border-r-4 border-[#b49474] shadow-[inset_2px_0_4px_rgba(0,0,0,0.3)]">
          <div class="absolute right-0 top-1/2 -translate-y-1/2 w-8 h-32 border-r-2 border-[#c4a484]"></div>
        </div>

        <!-- The Swan Image -->
          <div id = "painting" class="absolute inset-20 w-[calc(100%-10rem)] h-[calc(100%-10rem)]">
          <!-- Image vignette overlay -->
          <div class="absolute inset-0 bg-gradient-radial from-transparent via-transparent to-[#1a0f0f]/40"></div>
          <!-- Natural texture overlay -->
          <div class="absolute inset-0 opacity-10">
            <div class="absolute inset-0 bg-[url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMDAiIGhlaWdodD0iMTAwIj48ZGVmcz48cGF0dGVybiBpZD0idGV4dHVyZSIgd2lkdGg9IjUiIGhlaWdodD0iNSIgcGF0dGVyblVuaXRzPSJ1c2VyU3BhY2VPblVzZSI+PHBhdGggZD0iTSA1IDAgTCAwIDAgMCA1IiBmaWxsPSJub25lIiBzdHJva2U9IiMwMDAiIHN0cm9rZS13aWR0aD0iMSIvPjwvcGF0dGVybj48L2RlZnM+PHJlY3Qgd2lkdGg9IjEwMCIgaGVpZ2h0PSIxMDAiIGZpbGw9InVybCgjdGV4dHVyZSkiLz48L3N2Zz4=')]"></div>
          </div>
          <!-- The actual image -->
          <img 
            src="../../../assets/TheSwan.png" 
            alt="The Swan" 
            class="w-full h-full object-contain brightness-90 drop-shadow-[0_0_10px_rgba(0,0,0,0.2)]"
          />
          </div>
        </div>
      </div>

      <!-- Parchment card container -->
      <div ref="parchmentContainer" class="fixed top-1/2 right-0 w-[35vw] max-w-[500px] transform translate-y-1/2 translate-x-full opacity-0">
        <!-- Parchment background -->
        <div class="relative bg-[#f4e4bc] shadow-2xl p-6 rounded-lg">
          <!-- Parchment texture -->
          <div class="absolute inset-0 opacity-20">
            <div class="absolute inset-0 bg-[url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMDAiIGhlaWdodD0iMTAwIj48ZGVmcz48cGF0dGVybiBpZD0icGFyY2htZW50IiB3aWR0aD0iMTAiIGhlaWdodD0iMTAiIHBhdHRlcm5Vbml0cz0idXNlclNwYWNlT25Vc2UiPjxwYXRoIGQ9Ik0gMTAgMCBMIDAgMCAwIDEwIiBmaWxsPSJub25lIiBzdHJva2U9IiMwMDAiIHN0cm9rZS13aWR0aD0iMSIvPjxwYXRoIGQ9Ik0gMCAwIEwgMTAgMTAiIGZpbGw9Im5vbmUiIHN0cm9rZT0iIzAwMCIgc3Ryb2tlLXdpZHRoPSIxIi8+PHBhdGggZD0iTSAxMCAwIEwgMCAxMCIgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjMDAwIiBzdHJva2Utd2lkdGg9IjEiLz48L3BhdHRlcm4+PC9kZWZzPjxyZWN0IHdpZHRoPSIxMDAiIGhlaWdodD0iMTAwIiBmaWxsPSJ1cmwoI3BhcmNobWVudCkiLz48L3N2Zz4=')]"></div>
          </div>
          
          <!-- Aged edges -->
          <div class="absolute inset-0 border-4 border-[#e4d4ac] rounded-lg"></div>
          <div class="absolute inset-2 border-2 border-[#d4c49c] rounded-lg"></div>
          
          <!-- Content -->
          <div class="relative z-10">
            <h2 class="text-2xl font-serif text-[#2a1f1f] mb-4">The Swan</h2>
            <div class="space-y-4 text-[#2a1f1f]">
              <div>
                <h3 class="text-lg font-serif mb-2">Jan Jacob Spohler</h3>
                <p class="text-base">1849</p>
              </div>
              
              <div>
                <h3 class="text-lg font-serif mb-3">Key Details</h3>
                <p class="text-sm mb-3">Oil on Canvas by Dutch artist Jan Jacob Spohler (1811-1879). The painting depicts "Het Zwaantjie" (The Swan), an imagined inn set against a dramatic cloudy sky, with a small ship and the St. Dionysius church of Tilburg in the background.</p>
              </div>

              <div>
                <h3 class="text-lg font-serif mb-3">Hidden Symbolism</h3>
                <p class="text-sm mb-3">The painting is rich with symbols of death and transition: a ghostly figure at the inn's entrance, a swan (believed to carry souls to the afterlife), a knotted bale of hay on the roof, and a black flag on the boat. The inn itself represents a place between life and the afterlife.</p>
              </div>

              <div>
                <h3 class="text-lg font-serif mb-3">Historical Significance</h3>
                <p class="text-sm mb-3">The painting is believed to commemorate the death of King Willem II of the Netherlands, who died in Tilburg in 1849. This is suggested by the presence of the Dutch flag, the Tilburg church, and the death symbolism throughout the composition.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  </div>
</template>


<script setup lang="ts">
import { ref, onMounted, onUnmounted } from 'vue'
import gsap from 'gsap'
import ScrollTrigger from 'gsap/ScrollTrigger'

// Register ScrollTrigger plugin
gsap.registerPlugin(ScrollTrigger)

// Refs for animation elements
const paintingContainer = ref<HTMLElement | null>(null)
const parchmentContainer = ref<HTMLElement | null>(null)
const skyBackground = ref<HTMLElement | null>(null)
const cloudContainer = ref<HTMLElement | null>(null)
const cloud1 = ref<HTMLElement | null>(null)
const cloud2 = ref<HTMLElement | null>(null)
const cloud3 = ref<HTMLElement | null>(null)

// Animation parameters
const PAINTING_REVEAL_START = 0.1; 
const PAINTING_REVEAL_END = 0.3;    
const PARCHMENT_REVEAL_END = 0.7;   


let scrollPosition = 0
let ticking = false

const animateOnScroll = () => {
  // Get scroll progress as percentage (0 to 1)
  const maxScroll = document.body.scrollHeight - window.innerHeight;
  scrollPosition = maxScroll > 0 ? window.scrollY / maxScroll : 0;
  scrollPosition = Math.max(0, Math.min(1, scrollPosition)); // Clamp between 0 and 1
  
  // Update progress indicator
  if (document.getElementById('scrollProgress')) {
    document.getElementById('scrollProgress').textContent = `${Math.round(scrollPosition * 100)}%`
  }
  
  // Only request animation frame if we're not already processing one
  if (!ticking) {
    window.requestAnimationFrame(() => {
      // Animate cloud images - start fully visible and move off screen
      if (cloud1.value && cloud2.value && cloud3.value) {
        // Cloud animation based on painting visibility
        // When painting starts to appear, clouds start to move off screen
        const cloudAnimProgress = Math.min(1, (scrollPosition - PAINTING_REVEAL_START) / 
                                 (PAINTING_REVEAL_END - PAINTING_REVEAL_START));
        
        // Cloud 1 - moves left off screen
        const cloud1X = 10 - (cloudAnimProgress * 110); 
        gsap.to(cloud1.value, {
          left: `${cloud1X}%`,
          opacity: Math.max(0, 1 - cloudAnimProgress), 
          duration: 0.1
        });
        
        // Cloud 2 - moves right off screen
        const cloud2X = 20 + (cloudAnimProgress * 110);
        gsap.to(cloud2.value, {
          right: `${-cloud2X}%`,
          opacity: Math.max(0, 1 - cloudAnimProgress),
          duration: 0.1
        });
        
        // Cloud 3 - moves down off screen
        const cloud3Y = 60 + (cloudAnimProgress * 70);
        gsap.to(cloud3.value, {
          top: `${cloud3Y}%`,
          opacity: Math.max(0, 1 - cloudAnimProgress),
          duration: 0.1
        });
      }
      
// Painting animation - now with transition to left side and shrink
if (paintingContainer.value) {
  // Initial reveal animation (from the first part of the scroll)
  if (scrollPosition < PAINTING_REVEAL_END) {
    // Calculate painting reveal progress
    const paintingProgress = Math.max(0, Math.min(1, (scrollPosition - PAINTING_REVEAL_START) / 
                                     (PAINTING_REVEAL_END - PAINTING_REVEAL_START)));
    
    // Scale and opacity based on scroll
    const paintingScale = 0.7 + (paintingProgress * 0.3); 
    const paintingOpacity = paintingProgress;
    
    gsap.to(paintingContainer.value, {
      scale: paintingScale,
      opacity: paintingOpacity,
      x: "0%",
      duration: 0.1
    });
  } else {
    // After painting is fully revealed, start moving it to the left and shrinking
    // Calculate progress for this phase with a shorter scroll range
    const laterScrollProgress = Math.max(0, Math.min(1, (scrollPosition - PAINTING_REVEAL_END) / 0.1));
    
    // Calculate painting shrink and move left
    const paintingScale = 1 - (laterScrollProgress * 0.3); 
    const paintingX = laterScrollProgress * -25; 
    
    gsap.to(paintingContainer.value, {
      scale: paintingScale,
      x: `${paintingX}%`,
      opacity: 1, 
      duration: 0.1
    });
  }
}

// Parchment animation - only start after painting is fully shrunk
if (parchmentContainer.value) {
  // Define when painting should be completely shrunk 
  const PAINTING_SHRINK_COMPLETE = PAINTING_REVEAL_END + 0.1;
  
  if (scrollPosition > PAINTING_SHRINK_COMPLETE) {
    // Calculate parchment reveal progress after painting is shrunk
    const parchmentProgress = Math.max(0, Math.min(1, (scrollPosition - PAINTING_SHRINK_COMPLETE) / 
                                     (PARCHMENT_REVEAL_END - PAINTING_SHRINK_COMPLETE)));
    
    // Position based on scroll - move from right side into position
    const parchmentX = 100 - (parchmentProgress * 150); 
    const parchmentY = -20 - (parchmentProgress * 30); 
    
    gsap.to(parchmentContainer.value, {
      x: `${parchmentX}%`,
      y: `${parchmentY}%`,
      opacity: 1, // Always fully visible - no fade
      duration: 0.1
    });
  } else {
    // Reset parchment when scrolling back up - keep it off screen to the right
    gsap.to(parchmentContainer.value, {
      x: '100%',
      y: '0%',
      opacity: 1, 
      duration: 0.1
    });
  }
}
      ticking = false;
    });
    ticking = true;
  }
}

// Set up and tear down the scroll event listener
onMounted(() => {
  window.addEventListener('scroll', animateOnScroll);
  // Initialize positions
  animateOnScroll();
})

onUnmounted(() => {
  window.removeEventListener('scroll', animateOnScroll);
})
</script>

<style scoped>
/* Import period-appropriate fonts */
@import url('https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap');

/* Smooth transitions */
.transition-all {
  transition-property: all;
  transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
  transition-duration: 150ms;
}

html, body {
  overflow-x: hidden;
  height: 100%;
}

/* Background transition */
.bg-transition {
  transition: background-color 0.5s ease, background-image 0.5s ease;
}

/* Text styling */
p {
  line-height: 1.8;
  margin-bottom: 1rem;
  font-family: 'Dancing Script', cursive;
  font-size: 1.2rem;
  font-weight: 800;
  color: #2a1f1f;
  text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
}

h1, h2, h3 {
  font-family: 'Dancing Script', cursive;
  font-weight: 800;
  letter-spacing: 0.05em;
  color: #2a1f1f;
  text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
}

h2 {
  font-size: 2.5rem;
  font-weight: 700;
  margin-bottom: 1.5rem;
  border-bottom: 2px solid #2a1f1f;
  padding-bottom: 0.5rem;
}

h3 {
  font-size: 1.5rem;
  margin-bottom: 1rem;
}

/* Painting container */
#painting {
  filter: brightness(0.7) contrast(1.05);
  transition: filter 0.2s ease-in-out;
}

/* Cloud animations for subtle motion */
@keyframes driftSlow {
  0% { transform: translateX(0); }
  50% { transform: translateX(20px); }
  100% { transform: translateX(0); }
}

@keyframes driftMedium {
  0% { transform: translateX(0); }
  50% { transform: translateX(-15px); }
  100% { transform: translateX(0); }
}

@keyframes driftFast {
  0% { transform: translateX(0); }
  50% { transform: translateX(10px); }
  100% { transform: translateX(0); }
}

/* Apply cloud drift animations to images */
[ref="cloud1"] {
  animation: driftSlow 30s ease-in-out infinite;
  filter: drop-shadow(0 0 10px rgba(255, 255, 255, 0.5));
}

[ref="cloud2"] {
  animation: driftMedium 25s ease-in-out infinite;
  filter: drop-shadow(0 0 8px rgba(255, 255, 255, 0.4));
}

[ref="cloud3"] {
  animation: driftFast 20s ease-in-out infinite;
  filter: drop-shadow(0 0 12px rgba(255, 255, 255, 0.6));
}

/* Add styles for parchment card */
.parchment-card {
  background: linear-gradient(to bottom, #f4e4bc, #e4d4ac);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

/* Add text styling for parchment */
.parchment-text {
  text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
}

/* Add decorative elements to text */
h2::before,
h2::after {
  content: "❧";
  margin: 0 1rem;
  color: #2a1f1f;
  opacity: 0.5;
}

/* Add ink-like effect to text */
p {
  position: relative;
}

p::after {
  content: "";
  position: absolute;
  bottom: -2px;
  left: 0;
  width: 100%;
  height: 1px;
  background: linear-gradient(to right, transparent, #2a1f1f, transparent);
  opacity: 0.1;
}
</style> 