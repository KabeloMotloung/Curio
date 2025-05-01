<template>
  <div class="relative w-full overflow-hidden h-[300vh]">

    <div v-if="isLoading" class="fixed inset-0 z-[100] flex items-center justify-center bg-[#545863]/80">
      <div class="flex flex-col items-center gap-4">
        <div class="w-16 h-16 border-4 border-[#E5E7EB] border-t-transparent rounded-full animate-spin shadow-[0_0_15px_rgba(229,231,235,0.3)]"></div>
        <span class="text-[#E5E7EB] font-['Raleway'] tracking-[0.25em] uppercase text-sm text-shadow-[0_2px_8px_rgba(0,0,0,0.3)]">Loading</span>
      </div>
    </div>
    <ScrollProgress :totalSections="4" />
    <BackButton />

    <div class="fixed inset-0 bg-transition" ref="skyBackground">
      <img 
        src="./assets/sky-background.jpg"
        class="h-screen w-full object-cover" 
        ref="background" 
        alt="Background 1"
      />
    </div>


    <div class="fixed inset-0 pointer-events-none" ref="cloudContainer">      
      <div class="absolute top-[10%] left-0 w-full flex items-center justify-center text-white/90 transition-opacity duration-500" ref="titleText">
        <h1 class="text-7xl font-extralight tracking-[0.25em] uppercase">The Swan</h1>
      </div>
      <img 
        src="./assets/cloud.png"
        class="absolute top-[15%] left-[10%] w-[30%] opacity-0 animate-float-slow" 
        ref="cloud1" 
        alt="Cloud 1"
      />
      <img 
        src="./assets/cloud.png"
        class="absolute top-[25%] right-[20%] w-[40%] opacity-0 animate-float-medium" 
        ref="cloud2" 
        alt="Cloud 2"
      />
      <img 
        src="./assets/cloud.png"
        class="absolute top-[60%] left-[30%] w-[35%] opacity-0 animate-float-fast" 
        ref="cloud3" 
        alt="Cloud 3"
      />
    </div>

    <div class="fixed bottom-12 left-1/2 -translate-x-1/2 text-[#1F2937] flex flex-col items-center gap-3 transition-opacity duration-500" ref="scrollIndicator">
      <span class="text-sm font-light tracking-[0.25em] uppercase font-['Raleway']">Scroll to explore</span>
      <svg class="w-5 h-5 animate-bounce opacity-90" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1" d="M19 13l-7 7-7-7"></path>
      </svg>
    </div>

    <div class="relative z-10 flex flex-col items-center justify-center min-h-screen p-4">
      <div ref="paintingContainer" class="fixed top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 w-[95vw] max-w-[1200px] aspect-[4/3] opacity-0">
        <div class="relative w-full h-full">
          <div class="absolute inset-0 bg-[#2a1f1f]/95"></div>
          
          <div class="absolute inset-0">
            <div class="absolute inset-0 opacity-25">
              <div class="absolute inset-0 bg-[url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMDAiIGhlaWdodD0iMTAwIj48ZGVmcz48cGF0dGVybiBpZD0id29vZCIgd2lkdGg9IjUiIGhlaWdodD0iNSIgcGF0dGVyblVuaXRzPSJ1c2VyU3BhY2VPblVzZSI+PHBhdGggZD0iTSA1IDAgTCAwIDAgMCA1IiBmaWxsPSJub25lIiBzdHJva2U9IiMwMDAiIHN0cm9rZS13aWR0aD0iMSIvPjxwYXRoIGQ9Ik0gMCAwIEwgNSA1IiBmaWxsPSJub25lIiBzdHJva2U9IiMwMDAiIHN0cm9rZS13aWR0aD0iMSIvPjxwYXRoIGQ9Ik0gNSAwIEwgMCA1IiBmaWxsPSJub25lIiBzdHJva2U9IiMwMDAiIHN0cm9rZS13aWR0aD0iMSIvPjwvcGF0dGVybj48L2RlZnM+PHJlY3Qgd2lkdGg9IjEwMCIgaGVpZ2h0PSIxMDAiIGZpbGw9InVybCgjd29vZCkiLz48L3N2Zz4=')]"></div>
            </div>
            
            <div class="absolute inset-0 opacity-20">
              <div class="absolute inset-0 bg-[url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMDAiIGhlaWdodD0iMTAwIj48ZGVmcz48cGF0dGVybiBpZD0id29vZDIiIHdpZHRoPSIxMCIgaGVpZ2h0PSIxMCIgcGF0dGVyblVuaXRzPSJ1c2VyU3BhY2VPblVzZSI+PHBhdGggZD0iTSAxMCAwIEwgMCAwIDAgMTAiIGZpbGw9Im5vbmUiIHN0cm9rZT0iIzAwMCIgc3Ryb2tlLXdpZHRoPSIxIi8+PHBhdGggZD0iTSAwIDAgTCAxMCAxMCIgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjMDAwIiBzdHJva2Utd2lkdGg9IjEiLz48cGF0aCBkPSJNIDEwIDAgTCAwIDEwIiBmaWxsPSJub25lIiBzdHJva2U9IiMwMDAiIHN0cm9rZS13aWR0aD0iMSIvPjwvcGF0dGVybj48L2RlZnM+PHJlY3Qgd2lkdGg9IjEwMCIgaGVpZ2h0PSIxMDAiIGZpbGw9InVybCgjd29vZDIpIi8+PC9zdmc+')]"></div>
            </div>
            
            <div class="absolute inset-0 opacity-15">
              <div class="absolute inset-0 bg-[url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMDAiIGhlaWdodD0iMTAwIj48ZGVmcz48cGF0dGVybiBpZD0iaW1wZXJmZWN0aW9ucyIgd2lkdGg9IjIwIiBoZWlnaHQ9IjIwIiBwYXR0ZXJuVW5pdHM9InVzZXJTcGFjZU9uVXNlIj48cGF0aCBkPSJNIDIwIDAgTCAwIDAgMCAyMCIgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjMDAwIiBzdHJva2Utd2lkdGg9IjEiLz48cGF0aCBkPSJNIDAgMCAgTCAyMCAyMCIgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjMDAwIiBzdHJva2Utd2lkdGg9IjEiLz48cGF0aCBkPSJNIDIwIDAgTCAwIDIwIiBmaWxsPSJub25lIiBzdHJva2U9IiMwMDAiIHN0cm9rZS13aWR0aD0iMSIvPjxwYXRoIGQ9Ik0gMTAgMCAgTCAwIDEwIiBmaWxsPSJub25lIiBzdHJva2U9IiMwMDAiIHN0cm9rZS13aWR0aD0iMSIvPjxwYXRoIGQ9Ik0gMjAgMTAgIEwgMTAgMjAiIGZpbGw9Im5vbmUiIHN0cm9rZT0iIzAwMCIgc3Ryb2tlLXdpZHRoPSIxIi8+PC9wYXR0ZXJuPjwvZGVmcz48cmVjdCB3aWR0aD0iMTAwIiBoZWlnaHQ9IjEwMCIgZmlsbD0idXJsKCNpbXBlcmZlY3Rpb25zKSIvPjwvc3ZnPg==')]"></div>
          </div>

          <div class="absolute inset-0 opacity-10">
            <div class="absolute inset-0 bg-[url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMDAiIGhlaWdodD0iMTAwIj48ZGVmcz48cGF0dGVybiBpZD0ia25vdHMiIHdpZHRoPSI0MCIgaGVpZ2h0PSI0MCIgcGF0dGVyblVuaXRzPSJ1c2VyU3BhY2VPblVzZSI+PGNpcmNsZSBjeD0iMjAiIGN5PSIyMCIgcj0iMTAiIGZpbGw9Im5vbmUiIHN0cm9rZT0iIzAwMCIgc3Ryb2tlLXdpZHRoPSIxIi8+PGNpcmNsZSBjeD0iMjAiIGN5PSIyMCIgcj0iNSIgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjMDAwIiBzdHJva2Utd2lkdGg9IjEiLz48cGF0aCBkPSJNIDIwIDAgTCAyMCA0MCIgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjMDAwIiBzdHJva2Utd2lkdGg9IjEiLz48cGF0aCBkPSJNIDAgMjAgTCA0MCAyMCIgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjMDAwIiBzdHJva2Utd2lkdGg9IjEiLz48L3BhdHRlcm4+PC9kZWZzPjxyZWN0IHdpZHRoPSIxMDAiIGhlaWdodD0iMTAwIiBmaWxsPSJ1cmwoI2tub3RzKSIvPjwvc3ZnPg==')]"></div>
          </div>
        </div>
        
        <div class="absolute inset-0 border-[12px] border-[#b9956c] bg-gradient-to-b from-[#d4b494] via-[#b9956c] to-[#997554] shadow-[inset_0_0_20px_rgba(0,0,0,0.3)]">
          <div class="absolute inset-0 bg-[#d4b494]/20"></div>
          <div class="absolute inset-0 bg-[#e4c4a4]/10"></div>
          <div class="absolute inset-0 bg-[#b9956c]/30"></div>
          <div class="absolute inset-0 bg-gradient-to-r from-[#b9956c]/50 to-transparent"></div>
          <div class="absolute inset-0 bg-gradient-to-b from-[#b9956c]/50 to-transparent"></div>
          

          <div class="absolute -inset-6 overflow-visible">

            <div class="absolute inset-0 animate-glow-cloud-1">
              <div class="absolute inset-0 bg-gradient-to-r from-white/25 via-white/10 to-transparent blur-xl transform rotate-12 scale-105"></div>
              <div class="absolute inset-0 bg-gradient-to-b from-white/25 via-white/10 to-transparent blur-xl transform -rotate-12 scale-105"></div>
            </div>
            <div class="absolute inset-0 animate-glow-cloud-2">
              <div class="absolute inset-0 bg-gradient-to-r from-white/20 via-white/8 to-transparent blur-lg transform -rotate-6 scale-102"></div>
              <div class="absolute inset-0 bg-gradient-to-b from-white/20 via-white/8 to-transparent blur-lg transform rotate-6 scale-102"></div>
            </div>
            <div class="absolute inset-0 animate-glow-cloud-3">
              <div class="absolute inset-0 bg-gradient-to-r from-white/15 via-white/5 to-transparent blur-md transform rotate-3"></div>
              <div class="absolute inset-0 bg-gradient-to-b from-white/15 via-white/5 to-transparent blur-md transform -rotate-3"></div>
            </div>
            <div class="absolute inset-0 animate-glow-cloud-4">
              <div class="absolute inset-0 bg-gradient-to-tr from-white/15 via-transparent to-white/15 blur-xl transform scale-105"></div>
            </div>
          </div>
        </div>
        
        <div class="absolute inset-12 border-6 border-[#b9956c] bg-gradient-to-b from-[#d4b494] via-[#b9956c] to-[#997554] shadow-[inset_0_0_15px_rgba(0,0,0,0.2)]">
          <div class="absolute inset-0 bg-[#d4b494]/15"></div>
          <div class="absolute inset-0 bg-[#e4c4a4]/8"></div>
          <div class="absolute inset-0 bg-[#b9956c]/25"></div>
          <div class="absolute inset-0 bg-gradient-to-r from-[#b9956c]/40 to-transparent"></div>
          <div class="absolute inset-0 bg-gradient-to-b from-[#b9956c]/40 to-transparent"></div>
        </div>
        <div class="absolute inset-16 border-4 border-[#997554] bg-gradient-to-b from-[#b9956c] to-[#997554] shadow-[inset_0_0_10px_rgba(0,0,0,0.2)]">
          <div class="absolute inset-0 bg-[#d4b494]/10"></div>
          <div class="absolute inset-0 bg-[#e4c4a4]/5"></div>
          <div class="absolute inset-0 bg-[#b9956c]/20"></div>
          <div class="absolute inset-0 bg-gradient-to-r from-[#b9956c]/30 to-transparent"></div>
          <div class="absolute inset-0 bg-gradient-to-b from-[#b9956c]/30 to-transparent"></div>
        </div>
        
        <div class="absolute inset-20 border-2 border-[#b9956c]/20"></div>
        <div class="absolute inset-20 bg-gradient-to-b from-[#d4b494]/40 via-[#b9956c]/20 to-[#997554]/10"></div>
        <div class="absolute inset-20 bg-gradient-to-r from-[#d4b494]/40 via-[#b9956c]/20 to-[#997554]/10"></div>
        <div class="absolute inset-20 bg-gradient-to-tr from-[#d4b494]/30 via-transparent to-transparent"></div>
        
        <div class="absolute top-0 left-0 w-32 h-32 border-t-8 border-l-8 border-[#d4b494] transform rotate-0 shadow-[inset_-2px_-2px_4px_rgba(0,0,0,0.2)]">
          <div class="absolute top-0 left-0 w-16 h-16 border-t-4 border-l-4 border-[#e4c4a4] transform rotate-0"></div>
          <div class="absolute bottom-0 right-0 w-16 h-16 border-b-4 border-r-4 border-[#b9956c] transform rotate-180"></div>
        </div>
        <div class="absolute top-0 right-0 w-32 h-32 border-t-8 border-r-8 border-[#d4b494] transform rotate-90 shadow-[inset_2px_-2px_4px_rgba(0,0,0,0.2)]">
          <div class="absolute top-0 left-0 w-16 h-16 border-t-4 border-l-4 border-[#e4c4a4] transform rotate-90"></div>
          <div class="absolute bottom-0 right-0 w-16 h-16 border-b-4 border-r-4 border-[#b9956c] transform -rotate-90"></div>
        </div>
        <div class="absolute bottom-0 left-0 w-32 h-32 border-b-8 border-l-8 border-[#d4b494] transform -rotate-90 shadow-[inset_-2px_2px_4px_rgba(0,0,0,0.2)]">
          <div class="absolute top-0 left-0 w-16 h-16 border-t-4 border-l-4 border-[#e4c4a4] transform -rotate-90"></div>
          <div class="absolute bottom-0 right-0 w-16 h-16 border-b-4 border-r-4 border-[#b9956c] transform rotate-90"></div>
        </div>
        <div class="absolute bottom-0 right-0 w-32 h-32 border-b-8 border-r-8 border-[#d4b494] transform rotate-180 shadow-[inset_2px_2px_4px_rgba(0,0,0,0.2)]">
          <div class="absolute top-0 left-0 w-16 h-16 border-t-4 border-l-4 border-[#e4c4a4] transform rotate-180"></div>
          <div class="absolute bottom-0 right-0 w-16 h-16 border-b-4 border-r-4 border-[#b9956c] transform rotate-0"></div>
        </div>

        <div class="absolute top-0 left-1/2 -translate-x-1/2 w-64 h-16 border-t-4 border-[#d4b494] shadow-[inset_0_-2px_4px_rgba(0,0,0,0.2)]">
          <div class="absolute top-0 left-1/2 -translate-x-1/2 w-32 h-8 border-t-2 border-[#e4c4a4]"></div>
        </div>
        <div class="absolute bottom-0 left-1/2 -translate-x-1/2 w-64 h-16 border-b-4 border-[#d4b494] shadow-[inset_0_2px_4px_rgba(0,0,0,0.2)]">
          <div class="absolute bottom-0 left-1/2 -translate-x-1/2 w-32 h-8 border-b-2 border-[#e4c4a4]"></div>
        </div>
        <div class="absolute left-0 top-1/2 -translate-y-1/2 w-16 h-64 border-l-4 border-[#d4b494] shadow-[inset_-2px_0_4px_rgba(0,0,0,0.2)]">
          <div class="absolute left-0 top-1/2 -translate-y-1/2 w-8 h-32 border-l-2 border-[#e4c4a4]"></div>
        </div>
        <div class="absolute right-0 top-1/2 -translate-y-1/2 w-16 h-64 border-r-4 border-[#d4b494] shadow-[inset_2px_0_4px_rgba(0,0,0,0.2)]">
          <div class="absolute right-0 top-1/2 -translate-y-1/2 w-8 h-32 border-r-2 border-[#e4c4a4]"></div>
        </div>

          <div id = "painting" class="absolute inset-20 w-[calc(100%-10rem)] h-[calc(100%-10rem)]">
          <div class="absolute inset-0 bg-gradient-radial from-transparent via-transparent to-[#1a0f0f]/40"></div>
          <div class="absolute inset-0 opacity-10">
            <div class="absolute inset-0 bg-[url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMDAiIGhlaWdodD0iMTAwIj48ZGVmcz48cGF0dGVybiBpZD0idGV4dHVyZSIgd2lkdGg9IjUiIGhlaWdodD0iNSIgcGF0dGVyblVuaXRzPSJ1c2VyU3BhY2VPblVzZSI+PHBhdGggZD0iTSA1IDAgTCAwIDAgMCA1IiBmaWxsPSJub25lIiBzdHJva2U9IiMwMDAiIHN0cm9rZS13aWR0aD0iMSIvPjwvcGF0dGVybj48L2RlZnM+PHJlY3Qgd2lkdGg9IjEwMCIgaGVpZ2h0PSIxMDAiIGZpbGw9InVybCgjdGV4dHVyZSkiLz48L3N2Zz4=')]"></div>
          </div>
          <img 
            src="./assets/TheSwan.png"
            alt="The Swan" 
            class="w-full h-full object-contain brightness-90 drop-shadow-[0_0_10px_rgba(0,0,0,0.2)]"
          />
          </div>
        </div>
      </div>

      <div ref="parchmentContainer" class="fixed top-1/2 right-0 w-[35vw] max-w-[500px] transform translate-y-1/2 translate-x-full opacity-0">
        <div class="relative p-6 rounded-lg overflow-hidden bg-transparent">
          <img 
            :src="currentParchmentImage" 
            class="absolute inset-0 w-full h-full object-contain filter contrast-[0.85] brightness-[0.92] saturate-[0.8] sepia-[0.15]"
            alt="Parchment"
          />
          
          <div class="relative z-10 px-12 py-20">
            <div class="relative" :style="{ 
              opacity: currentParchmentIndex >= 7 ? 1 : 0
            }">
              <h2 class="text-2xl font-serif text-[#2a1f1f]/90 mb-1">The Swan</h2>
            </div>

            <div class="relative" :style="{ 
              opacity: currentParchmentIndex >= 7 ? 1 : 0
            }">
              <div class="space-y-1 text-[#2a1f1f]/80 mb-4">
                <div>
                  <h3 class="text-lg font-serif mb-1">Jan Jacob Spohler</h3>
                  <p class="text-base mb-0">1849</p>
                </div>
              </div>
            </div>

            <div class="relative" :style="{ 
              opacity: currentParchmentIndex >= 3 ? 1 : 0,
              transform: `translateY(${
                currentParchmentIndex >= 6 ? 0 : 
                currentParchmentIndex >= 5 ? 0 :
                currentParchmentIndex >= 3.5 ? 110 :
                currentParchmentIndex >= 3 ? 135 : 135
              }px)`,
              transition: 'opacity 0.03s ease-out, transform 0.1s ease-out'
            }">
              <div class="space-y-1 text-[#2a1f1f]/80 mb-4">
                <div>
                  <h3 class="text-lg font-serif mb-2">Key Details</h3>
                  <p class="text-base">Oil on Canvas by Dutch artist Jan Jacob Spohler. Depicts "Het Zwaantjie" (The Swan), an imagined inn with the St. Dionysius church of Tilburg in the background.</p>
                </div>
              </div>
            </div>

            <div class="relative" :style="{ 
              opacity: currentParchmentIndex >= 5 ? 1 : 0,
              transform: `translateY(${currentParchmentIndex >= 6 ? 0 : 20}px)`,
              transition: 'opacity 0.1s ease-out, transform 0.1s ease-out'
            }">
              <div class="space-y-1 text-[#2a1f1f]/80 mb-4">
                <div>
                  <h3 class="text-lg font-serif mb-2">Hidden Symbolism</h3>
                  <p class="text-base">Rich with symbols of death and transition: a ghostly figure at the entrance, a swan (carrying souls to the afterlife), a knotted bale of hay, and a black flag. The inn represents a threshold between life and the afterlife.</p>
                </div>
              </div>
            </div>

            <div class="relative" :style="{ 
              opacity: currentParchmentIndex >= 7 ? 1 : 0
            }">
              <div class="space-y-1 text-[#2a1f1f]/80">
                <div>
                  <h3 class="text-lg font-serif mb-2">Historical Significance</h3>
                  <p class="text-base">Commemorates the death of King Willem II of the Netherlands in Tilburg (1849), symbolized by the Dutch flag, Tilburg church, and death imagery throughout.</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>


<script setup lang="ts">
import { ref, onMounted, onUnmounted, computed } from 'vue'
import gsap from 'gsap'
import ScrollTrigger from 'gsap/ScrollTrigger'
import BackButton from "../UniversalComponents/BackButton.vue";
import ScrollProgress from "../UniversalComponents/ScrollProgress.vue";

gsap.registerPlugin(ScrollTrigger)

const isLoading = ref(true)
const assetsLoaded = ref(0)
const totalAssets = ref(0)

const loadAssets = () => {
  const assets = [
    './assets/sky-background.jpg',
    './assets/cloud.png',
    './assets/TheSwan.png',
    ...Array.from({ length: 7 }, (_, i) => `./assets/parchments/parchment-${i + 1}.png`)
  ]
  
  totalAssets.value = assets.length
  

  const loadingTimeout = setTimeout(() => {
    isLoading.value = false
  }, 5000) 
  
  assets.forEach(src => {
    const img = new Image()
    img.onload = () => {
      assetsLoaded.value++
      if (assetsLoaded.value === totalAssets.value) {
        clearTimeout(loadingTimeout)
        setTimeout(() => {
          isLoading.value = false
        }, 500) 
      }
    }
    img.onerror = () => {

      assetsLoaded.value++
      if (assetsLoaded.value === totalAssets.value) {
        clearTimeout(loadingTimeout)
        setTimeout(() => {
          isLoading.value = false
        }, 500)
      }
    }
    img.src = src
  })
}

const paintingContainer = ref<HTMLElement | null>(null)
const parchmentContainer = ref<HTMLElement | null>(null)
const skyBackground = ref<HTMLElement | null>(null)
const cloudContainer = ref<HTMLElement | null>(null)
const cloud1 = ref<HTMLElement | null>(null)
const cloud2 = ref<HTMLElement | null>(null)
const cloud3 = ref<HTMLElement | null>(null)
const titleText = ref<HTMLElement | null>(null)
const scrollIndicator = ref<HTMLElement | null>(null)

const currentParchmentIndex = ref(1)
const contentOpacity = ref(0)

const currentParchmentImage = computed(() => {
  return new URL(`./assets/parchments/parchment-${currentParchmentIndex.value}.png`, import.meta.url).href
})

const PAINTING_REVEAL_START = 0.1
const PAINTING_REVEAL_END = 0.3
const PARCHMENT_REVEAL_END = 0.9
const PARCHMENT_STAGES = 7
const PARCHMENT_MOVE_DURATION = 0.2

let scrollPosition = 0
let ticking = false

const animateOnScroll = () => {
  const maxScroll = document.body.scrollHeight - window.innerHeight;
  scrollPosition = maxScroll > 0 ? window.scrollY / maxScroll : 0;
  scrollPosition = Math.max(0, Math.min(1, scrollPosition));
  
  if (document.getElementById('scrollProgress')) {
    document.getElementById('scrollProgress').textContent = `${Math.round(scrollPosition * 100)}%`
  }
  
  if (!ticking) {
    window.requestAnimationFrame(() => {
      if (titleText.value && scrollIndicator.value) {
        const fadeProgress = Math.min(1, (scrollPosition - PAINTING_REVEAL_START) / 
                           (PAINTING_REVEAL_END - PAINTING_REVEAL_START));
        
        gsap.to(titleText.value, {
          opacity: Math.max(0, 1 - fadeProgress * 2),
          y: -50 * fadeProgress,
          duration: 0.1
        });

        gsap.to(scrollIndicator.value, {
          opacity: Math.max(0, 1 - fadeProgress * 3), 
          duration: 0.1
        });
      }

      if (cloud1.value && cloud2.value && cloud3.value) {
        const cloudAnimProgress = Math.min(1, (scrollPosition - PAINTING_REVEAL_START) / 
                                 (PAINTING_REVEAL_END - PAINTING_REVEAL_START));
        
        const cloud1X = 10 - (cloudAnimProgress * 110); 
        gsap.to(cloud1.value, {
          left: `${cloud1X}%`,
          opacity: Math.max(0, 1 - cloudAnimProgress), 
          duration: 0.1
        });
        
        const cloud2X = 20 + (cloudAnimProgress * 110);
        gsap.to(cloud2.value, {
          right: `${-cloud2X}%`,
          opacity: Math.max(0, 1 - cloudAnimProgress),
          duration: 0.1
        });
        
        const cloud3Y = 60 + (cloudAnimProgress * 70);
        gsap.to(cloud3.value, {
          top: `${cloud3Y}%`,
          opacity: Math.max(0, 1 - cloudAnimProgress),
          duration: 0.1
        });
      }
      
if (paintingContainer.value) {
  if (scrollPosition < PAINTING_REVEAL_END) {

    const paintingProgress = Math.max(0, Math.min(1, (scrollPosition - PAINTING_REVEAL_START) / 
                                     (PAINTING_REVEAL_END - PAINTING_REVEAL_START)));
    
    const paintingScale = 0.7 + (paintingProgress * 0.3); 
    const paintingOpacity = paintingProgress;
    
    gsap.to(paintingContainer.value, {
      scale: paintingScale,
      opacity: paintingOpacity,
      x: "0%",
      duration: 0.1
    });
  } else {
    const laterScrollProgress = Math.max(0, Math.min(1, (scrollPosition - PAINTING_REVEAL_END) / 0.1));
    
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

if (parchmentContainer.value) {
  const PAINTING_SHRINK_COMPLETE = PAINTING_REVEAL_END + 0.1
  
  if (scrollPosition > PAINTING_SHRINK_COMPLETE) {
    const moveProgress = Math.min(1, (scrollPosition - PAINTING_SHRINK_COMPLETE) / PARCHMENT_MOVE_DURATION);
    const parchmentX = 100 - (moveProgress * 150); 
    const parchmentY = -20 - (moveProgress * 30); 
    
    gsap.to(parchmentContainer.value, {
      x: `${parchmentX}%`,
      y: `${parchmentY}%`,
      opacity: 1,
      duration: 0.1
    });

    if (moveProgress >= 1) {
      const unrollProgress = (scrollPosition - (PAINTING_SHRINK_COMPLETE + PARCHMENT_MOVE_DURATION)) / 
                           (PARCHMENT_REVEAL_END - (PAINTING_SHRINK_COMPLETE + PARCHMENT_MOVE_DURATION));
      
      const parchmentStage = Math.min(
        PARCHMENT_STAGES,
        Math.max(1, Math.ceil(unrollProgress * PARCHMENT_STAGES))
      );
      currentParchmentIndex.value = parchmentStage;
      
      contentOpacity.value = Math.min(1, unrollProgress * 1.2);
    } else {
      currentParchmentIndex.value = 1;
      contentOpacity.value = 0;
    }
  } else {
    currentParchmentIndex.value = 1;
    contentOpacity.value = 0;
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

onMounted(() => {
  loadAssets()
  window.addEventListener('scroll', animateOnScroll)
  animateOnScroll()
})

onUnmounted(() => {
  window.removeEventListener('scroll', animateOnScroll);
})
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@600&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Raleway:wght@200&display=swap');

:root {
  scrollbar-width: none;
  -ms-overflow-style: none;
}

:root::-webkit-scrollbar {
  display: none;
}

body {
  scrollbar-width: none;
  -ms-overflow-style: none;
  overflow-y: scroll;
}

body::-webkit-scrollbar {
  display: none;
}

.transition-all {
  transition-property: all;
  transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
  transition-duration: 150ms;
}

html, body {
  overflow-x: hidden;
  height: 100%;
}

.bg-transition {
  transition: background-color 0.5s ease, background-image 0.5s ease;
}

p {
  line-height: 1.6;
  margin-bottom: 0.25rem;
  font-family: 'Dancing Script', cursive;
  font-size: 1.2rem;
  font-weight: 800;
  color: #2a1f1f;
  text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.05);
  filter: contrast(0.95) brightness(0.98);
}

.parchment-text h1,
.parchment-text h2,
.parchment-text h3,
.parchment-text p {
  font-family: 'Dancing Script', cursive;
  filter: contrast(0.95) brightness(0.98);
}

h1 {
  font-family: 'Raleway', sans-serif !important;
  text-shadow: 0 2px 8px rgba(0, 0, 0, 0.3);
  color: #E5E7EB !important;
  font-weight: 200 !important;
}

h2, h3 {
  font-family: 'Dancing Script', cursive;
  font-weight: 800;
  letter-spacing: 0.05em;
  color: #2a1f1f;
  text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.05);
  filter: contrast(0.95) brightness(0.98);
}

[ref="scrollIndicator"] {
  text-shadow: 0 1px 4px rgba(255, 255, 255, 0.5);
  font-weight: 200;
}

[ref="scrollIndicator"] span {
  font-family: 'Raleway', sans-serif !important;
}

@keyframes floatSlow {
  0%, 100% { 
    transform: translate(0, 0) rotate(0deg); 
  }
  25% {
    transform: translate(25px, 8px) rotate(1deg);
  }
  75% {
    transform: translate(-15px, -5px) rotate(-1deg);
  }
}

@keyframes floatMedium {
  0%, 100% { 
    transform: translate(0, 0) rotate(0deg); 
  }
  33% {
    transform: translate(-30px, 10px) rotate(-1deg);
  }
  66% {
    transform: translate(20px, -8px) rotate(1deg);
  }
}

@keyframes floatFast {
  0%, 100% { 
    transform: translate(0, 0) rotate(0deg); 
  }
  40% {
    transform: translate(35px, -12px) rotate(1.5deg);
  }
  60% {
    transform: translate(-25px, 8px) rotate(-1deg);
  }
}

.animate-float-slow {
  animation: floatSlow 12s ease-in-out infinite;
  will-change: transform;
}

.animate-float-medium {
  animation: floatMedium 14s ease-in-out infinite;
  will-change: transform;
}

.animate-float-fast {
  animation: floatFast 10s ease-in-out infinite;
  will-change: transform;
}

[ref="cloud1"],
[ref="cloud2"],
[ref="cloud3"] {
  transition: opacity 0.5s ease-in-out, transform 0.5s ease-in-out;
  transform-origin: center center;
}

@keyframes glowCloud1 {
  0%, 100% {
    transform: translate(0, 0) rotate(0deg) scale(1);
    opacity: 0.6;
  }
  25% {
    transform: translate(12px, -8px) rotate(4deg) scale(1.05);
    opacity: 0.8;
  }
  50% {
    transform: translate(-8px, 6px) rotate(-3deg) scale(0.98);
    opacity: 0.6;
  }
  75% {
    transform: translate(-10px, -6px) rotate(2deg) scale(1.02);
    opacity: 0.7;
  }
}

@keyframes glowCloud2 {
  0%, 100% {
    transform: translate(0, 0) rotate(0deg) scale(1);
    opacity: 0.5;
  }
  33% {
    transform: translate(-8px, 6px) rotate(-2deg) scale(1.03);
    opacity: 0.7;
  }
  66% {
    transform: translate(6px, -4px) rotate(2deg) scale(0.97);
    opacity: 0.5;
  }
}

@keyframes glowCloud3 {
  0%, 100% {
    transform: translate(0, 0) rotate(0deg);
    opacity: 0.4;
  }
  50% {
    transform: translate(4px, 4px) rotate(1.5deg);
    opacity: 0.6;
  }
}

@keyframes glowCloud4 {
  0%, 100% {
    transform: scale(1) rotate(0deg);
    opacity: 0.3;
  }
  50% {
    transform: scale(1.05) rotate(90deg);
    opacity: 0.5;
  }
}

.animate-glow-cloud-1 {
  animation: glowCloud1 10s ease-in-out infinite;
}

.animate-glow-cloud-2 {
  animation: glowCloud2 14s ease-in-out infinite;
}

.animate-glow-cloud-3 {
  animation: glowCloud3 12s ease-in-out infinite;
}

.animate-glow-cloud-4 {
  animation: glowCloud4 20s linear infinite;
}
</style> 