<template>
  <div>
    <!-- SVG Needle & Thread -->
    <svg ref="needleSVG" class="needle-svg" width="100%" height="100%">
      <!-- Thread path -->
      <path
        ref="visibleThreadPath"
        d="M50 0"
        stroke="#996300f3"
        stroke-width="3"
        fill="none"
        stroke-linecap="round"
        stroke-linejoin="round"
        stroke-dasharray="8 12"
      />
      <!-- Needle -->
      <g ref="needle" class="needle">
        <rect x="-5" y="-30" width="10" height="60" fill="silver" rx="5" />
        <circle cx="0" cy="-20" r="2" fill="black" />
      </g>
    </svg>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { gsap } from 'gsap'
import { ScrollTrigger } from 'gsap/ScrollTrigger'

gsap.registerPlugin(ScrollTrigger)

const needle = ref(null)
const visibleThreadPath = ref(null)
const visibleThreadD = ref(['M50 0']) // Store points as an array
let justCameBackAbove = true

onMounted(() => {
  const panels = document.querySelectorAll('.panel') // Use panels from Base.vue
  const totalScroll = panels.length * window.innerHeight

  // Animate needle & thread
  gsap.to(needle.value, {
    y: totalScroll,
    ease: 'none',
    scrollTrigger: {
      trigger: '.panel1', // Start animation in Panel 1
      start: 'top top',
      end: () => `+=${totalScroll}`,
      scrub: true,
      onUpdate: (self) => {
        const y = self.progress * totalScroll
        const sine = Math.sin(y / 30)
        const x = 50 + sine * 20
        const dipValue = sine
        const isAbove = dipValue > 0

        gsap.set(needle.value, { x, y })
        needle.value.style.opacity = isAbove ? 1 : 0

        const maxTilt = 45
        const tilt = -dipValue * maxTilt
        gsap.set(needle.value, {
          rotate: tilt,
          transformOrigin: 'center center',
        })

        const point = `${x.toFixed(2)} ${y.toFixed(2)}`
        if (isAbove) {
          if (justCameBackAbove) {
            visibleThreadD.value.push(`M${point}`) // Add a new move-to point
            justCameBackAbove = false
          } else {
            visibleThreadD.value.push(`L${point}`) // Add a new line-to point
          }
        } else {
          justCameBackAbove = true
        }

        // Update the path's `d` attribute
        visibleThreadPath.value.setAttribute('d', visibleThreadD.value.join(' '))

        // Remove points when scrolling back up
        if (self.direction < 0 && visibleThreadD.value.length > 1) {
          visibleThreadD.value.pop() // Remove the last point
          visibleThreadPath.value.setAttribute('d', visibleThreadD.value.join(' '))
        }
      },
    },
  })
})
</script>

<style scoped>
.needle-svg {
  position: fixed;
  top: 0;
  left: 0;
  pointer-events: none;
  z-index: 1000;
  height: 100vh;
  width: 100vw;
}

.needle {
  transform-box: fill-box;
  transform-origin: center;
}
</style>