<template>
  <div class="painter-container relative w-full h-full">
    <!-- 🖌️ Button -->
    <div class="absolute top-4 right-4 z-10">
      <button
        @click="activatePainter"
        class="bg-white shadow-lg p-3 rounded-full text-2xl hover:scale-105 transition-transform"
      >
        🖌️
      </button>
    </div>

    <!-- Popups -->
    <transition name="fade">
      <div
        v-if="showStartPopup"
        class="absolute bottom-6 right-6 bg-white shadow-xl rounded-xl p-4 text-center z-10"
      >
        <p class="text-lg font-medium text-black">Let's paint!</p>
      </div>
    </transition>

    <transition name="fade">
      <div
        v-if="showSoundPopup"
        class="absolute bottom-6 right-6 bg-white shadow-xl rounded-xl p-4 text-center z-10"
      >
        <p class="text-lg font-medium text-black">Can you hear that sound?</p>
      </div>
    </transition>

    <!-- Canvas -->
    <div class="canvas-wrapper border border-gray-300 rounded-md w-full h-full">
      <canvas v-show="isActive" ref="paintCanvas" class="w-full h-full cursor-paintbrush"></canvas>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, onBeforeUnmount, nextTick } from 'vue'

const paintCanvas = ref()
const isActive = ref(false)
const showStartPopup = ref(false)
const showSoundPopup = ref(false)
const isPainting = ref(false)
const hasPaintedOnce = ref(false)

let ctx
let paintSound = new Audio('../assets/sounds/tapestry.mp3')

function getMousePos(event) {
  const rect = paintCanvas.value.getBoundingClientRect()
  return {
    x: event.clientX - rect.left,
    y: event.clientY - rect.top,
  }
}

function startPainting(event) {
  isPainting.value = true

  if (!hasPaintedOnce.value) {
    hasPaintedOnce.value = true
    showSoundPopup.value = true
    paintSound.play()
    setTimeout(() => {
      showSoundPopup.value = false
    }, 3000)
  }

  const pos = getMousePos(event)
  ctx.beginPath()
  ctx.moveTo(pos.x, pos.y)
}

function paint(event) {
  if (!isPainting.value) return
  const pos = getMousePos(event)
  ctx.lineTo(pos.x, pos.y)
  ctx.stroke()
}

function stopPainting() {
  isPainting.value = false
  ctx.closePath()
}

function activatePainter() {
  isActive.value = true
  showStartPopup.value = true
  setTimeout(() => {
    showStartPopup.value = false
  }, 3000)
}

onMounted(async () => {
  await nextTick()
  const canvas = paintCanvas.value
  const container = canvas.parentElement

  canvas.width = container.clientWidth
  canvas.height = container.clientHeight
  ctx = canvas.getContext('2d')

  ctx.lineCap = 'round'
  ctx.lineWidth = 5
  ctx.strokeStyle = '#1f2937'

  canvas.addEventListener('mousedown', startPainting)
  canvas.addEventListener('mousemove', paint)
  window.addEventListener('mouseup', stopPainting)
})

onBeforeUnmount(() => {
  const canvas = paintCanvas.value
  canvas.removeEventListener('mousedown', startPainting)
  canvas.removeEventListener('mousemove', paint)
  window.removeEventListener('mouseup', stopPainting)
})
</script>

<style scoped>
.cursor-paintbrush {
  cursor: url('data:image/svg+xml;utf8,<svg width="32" height="32" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"><path fill="black" d="M2 30 L30 2" stroke="black" stroke-width="4"/></svg>') 0 32, auto;
}

.canvas-wrapper {
  width: 100%;
  height: 100%;
  background-image: url('../assets/textures/tapesty-texture.jpg');
  background-repeat: repeat;
  background-size: cover;
}

.painter-container {
  width: 100%;
  height: 100%;
  position: relative;
}
</style>
