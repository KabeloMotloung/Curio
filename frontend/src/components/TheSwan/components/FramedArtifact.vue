<template>
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

    <div id="painting" class="absolute inset-20 w-[calc(100%-10rem)] h-[calc(100%-10rem)]">
      <div class="absolute inset-0 bg-gradient-radial from-transparent via-transparent to-[#1a0f0f]/40"></div>
      <div class="absolute inset-0 opacity-10">
        <div class="absolute inset-0 bg-[url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMDAiIGhlaWdodD0iMTAwIj48ZGVmcz48cGF0dGVybiBpZD0idGV4dHVyZSIgd2lkdGg9IjUiIGhlaWdodD0iNSIgcGF0dGVyblVuaXRzPSJ1c2VyU3BhY2VPblVzZSI+PHBhdGggZD0iTSA1IDAgTCAwIDAgMCA1IiBmaWxsPSJub25lIiBzdHJva2U9IiMwMDAiIHN0cm9rZS13aWR0aD0iMSIvPjwvcGF0dGVybj48L2RlZnM+PHJlY3Qgd2lkdGg9IjEwMCIgaGVpZ2h0PSIxMDAiIGZpbGw9InVybCgjdGV4dHVyZSkiLz48L3N2Zz4=')]"></div>
      </div>
      <img 
        :src="paintingImageUrl"
        alt="The Swan" 
        class="w-full h-full object-contain brightness-90 drop-shadow-[0_0_10px_rgba(0,0,0,0.2)]"
      />
    </div>
  </div>
</template>

<script setup>
import { ref, defineExpose, computed } from 'vue';
import swanPainting from '../assets/TheSwan.png';

const paintingContainer = ref(null);

const paintingImageUrl = computed(() => {
  return swanPainting;
});

defineExpose({
  paintingContainer
});
</script>

<style scoped>
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