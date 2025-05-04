<template>
  <div class="min-h-screen w-full flex justify-center items-center bg-gradient-to-br from-[#2d1e0f] to-[#1a1209] text-white relative overflow-hidden">
    <!-- Background overlay with coffee texture -->
    <div class="absolute inset-0 bg-[url('../assets/background-texture.jpg')] bg-cover opacity-20 mix-blend-overlay"></div>
    
    <!-- Coffee stain overlays -->
    <div class="absolute inset-0 opacity-15">
      <div class="coffee-stain stain-1"></div>
      <div class="coffee-stain stain-2"></div>
      <div class="coffee-stain stain-3"></div>
    </div>
    
    <!-- Coffee beans background with parallax -->
    <div class="absolute inset-0 overflow-hidden">
      <div class="coffee-bean bean-1" ref="bean1"></div>
      <div class="coffee-bean bean-2" ref="bean2"></div>
      <div class="coffee-bean bean-3" ref="bean3"></div>
      <div class="coffee-bean bean-4" ref="bean4"></div>
      <div class="coffee-bean bean-5" ref="bean5"></div>
      <div class="coffee-bean bean-6" ref="bean6"></div>
      <div class="coffee-bean bean-7" ref="bean7"></div>
    </div>
    
    <!-- Coffee steam effect -->
    <div class="absolute top-[10%] left-1/2 transform -translate-x-1/2 opacity-10">
      <div class="coffee-steam steam-1"></div>
      <div class="coffee-steam steam-2"></div>
      <div class="coffee-steam steam-3"></div>
    </div>
    
    <div class="flex flex-col justify-center items-center z-10 p-8 text-center max-w-4xl">
      <div class="mb-16">
        <h1 class="text-6xl md:text-7xl font-bold leading-tight mb-6 tracking-tight main-title font-['Raleway']">
          Sidwane <span class="text-[#A67C52] relative inline-block coffee-text">
            'The Coffee Drinker'
          </span> Tokozile
        </h1>
        
        <div class="w-2/5 mx-auto h-[3px] bg-[#A67C52] my-6 relative overflow-hidden divider"></div>
        
        <p class="text-2xl font-normal text-gray-200 mt-4 italic subtitle font-['Raleway']">
          A masterpiece by Anton van Wouw
        </p>
      </div>
      
      <ScrollArrow :arrowColor="'white'" :textColor="'white'" />

    </div>
  </div>
</template>

<script setup>
import { onMounted, ref, onUnmounted } from 'vue';
import { gsap } from 'gsap';
import ScrollArrow from '../../UniversalComponents/ScrollArrow.vue';

// Refs for coffee beans
const bean1 = ref(null);
const bean2 = ref(null);
const bean3 = ref(null);
const bean4 = ref(null);
const bean5 = ref(null);
const bean6 = ref(null);
const bean7 = ref(null);

// Collect all bean refs in an array for easier handling
const beanRefs = [bean1, bean2, bean3, bean4, bean5, bean6, bean7];

// Track mouse position for parallax effect
let mouseX = 0;
let mouseY = 0;
let windowWidth = window.innerWidth;
let windowHeight = window.innerHeight;

// Handle mouse movement for parallax
const handleMouseMove = (e) => {
  mouseX = e.clientX;
  mouseY = e.clientY;
  
  // Apply parallax effect to coffee beans
  animateBeans();
};

// Handle window resize
const handleResize = () => {
  windowWidth = window.innerWidth;
  windowHeight = window.innerHeight;
};

// Animate beans based on mouse position
const animateBeans = () => {
  const moveX = (mouseX - windowWidth / 2) / 50;
  const moveY = (mouseY - windowHeight / 2) / 50;
  
  beanRefs.forEach((bean, index) => {
    const depth = (index + 1) * 0.4; // Different depth for each bean
    if (bean.value) {
      gsap.to(bean.value, {
        x: moveX * depth,
        y: moveY * depth,
        rotation: moveX * (index % 2 ? 0.5 : -0.5),
        duration: 1,
        ease: 'power2.out'
      });
    }
  });
};

onMounted(() => {
  // Add event listeners
  window.addEventListener('mousemove', handleMouseMove);
  window.addEventListener('resize', handleResize);
  
  // Initial positions for beans with random rotation
  beanRefs.forEach((bean, index) => {
    if (bean.value) {
      gsap.set(bean.value, {
        rotation: Math.random() * 360,
      });
    }
  });
  
  // Title reveal animation
  const tl = gsap.timeline();
  
  tl.fromTo(
    '.main-title',
    {
      opacity: 0,
      y: 50,
      scale: 0.8,
    },
    {
      opacity: 1,
      y: 0,
      scale: 1,
      duration: 1.5,
      ease: 'power2.out',
    }
  )
  .fromTo(
    '.divider',
    { width: 0 },
    { 
      width: '40%', 
      duration: 1, 
      ease: 'power1.out' 
    },
    '-=0.8'
  )
  .fromTo(
    '.subtitle',
    { opacity: 0, y: 20 },
    { 
      opacity: 1, 
      y: 0, 
      duration: 1, 
      ease: 'power2.out' 
    },
    '-=0.6'
  )
  .fromTo(
    '.scroll-indicator',
    { opacity: 0 },
    { 
      opacity: 1, 
      duration: 0.8,
      delay: 0.5
    },
    '-=0.4'
  );

  // Arrow bounce animation
  gsap.to('.arrow', {
    y: 10,
    repeat: -1,
    yoyo: true,
    duration: 1.2,
    ease: 'sine.inOut'
  });
  
  // Add text glow pulse animation without using box-shadow
  gsap.to('.coffee-text', {
    textShadow: '0 0 8px rgba(166, 124, 82, 0.8)',
    repeat: -1,
    yoyo: true,
    duration: 2,
  });
  
  // Add highlight underline animation
  gsap.fromTo('.coffee-text::after', 
    { 
      width: '0%',
      left: '0',
    },
    {
      width: '100%',
      duration: 1,
      ease: 'power1.out',
      delay: 0.5
    }
  );
  
  // Floating animation for coffee beans
  beanRefs.forEach((bean, index) => {
    if (bean.value) {
      gsap.to(bean.value, {
        y: `+=${Math.random() * 30 - 15}`,
        x: `+=${Math.random() * 30 - 15}`,
        rotation: `+=${Math.random() * 40 - 20}`,
        duration: 3 + Math.random() * 4,
        repeat: -1,
        yoyo: true,
        ease: 'sine.inOut',
        delay: index * 0.2
      });
    }
  });
});

// Clean up event listeners
onUnmounted(() => {
  window.removeEventListener('mousemove', handleMouseMove);
  window.removeEventListener('resize', handleResize);
});
</script>

<style scoped>
.coffee-text::after {
  content: '';
  position: absolute;
  bottom: -5px;
  left: 0;
  width: 100%;
  height: 2px;
  background: #A67C52;
  transform-origin: left;
}

.divider::after {
  content: '';
  position: absolute;
  top: 0;
  left: -100%;
  width: 100%;
  height: 100%;
  background: white;
  animation: dividerGlow 3s infinite;
}

@keyframes dividerGlow {
  0%, 100% {
    left: -100%;
  }
  
  50% {
    left: 100%;
  }
}

/* Add an initial text shadow for coffee text */
.coffee-text {
  text-shadow: 0 0 4px rgba(166, 124, 82, 0.4);
}

/* Coffee beans styling */
.coffee-bean {
  position: absolute;
  background-image: url('../assets/coffee-bean.png');
  background-size: contain;
  background-repeat: no-repeat;
  background-position: center;
  opacity: 0.18;
  filter: drop-shadow(0 0 8px rgba(166, 124, 82, 0.3));
  will-change: transform;
  pointer-events: none;
}

/* Coffee stain styling */
.coffee-stain {
  position: absolute;
  background-image: url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyMDAgMjAwIj48cGF0aCBmaWxsPSIjQTY3QzUyIiBkPSJNMTAwIDEwYzQ5LjcgMCA5MCA0MC4zIDkwIDkwYzAgNDkuNy00MC4zIDkwLTkwIDkwYy00OS43IDAtOTAtNDAuMy05MC05MEMxMCA1MC4zIDUwLjMgMTAgMTAwIDEwWiIgc3R5bGU9Im9wYWNpdHk6MC44OyBmaWx0ZXI6Ymx1cig4cHgpOyIvPjwvc3ZnPg==');
  background-size: contain;
  background-repeat: no-repeat;
  background-position: center;
  filter: blur(8px);
}

.stain-1 {
  width: 350px;
  height: 350px;
  top: 10%;
  left: 5%;
  opacity: 0.2;
  transform: rotate(20deg);
}

.stain-2 {
  width: 400px;
  height: 400px;
  bottom: 5%;
  right: 10%;
  opacity: 0.15;
  transform: rotate(-15deg);
}

.stain-3 {
  width: 300px;
  height: 300px;
  top: 50%;
  right: 25%;
  opacity: 0.1;
  transform: rotate(45deg) scale(1.5, 0.8);
}

/* Coffee steam styling */
.coffee-steam {
  position: absolute;
  width: 8px;
  border-radius: 50%;
  background-color: rgba(255, 255, 255, 0.6);
  filter: blur(5px);
  animation: steam-rise 3s infinite ease-in-out;
}

.steam-1 {
  height: 80px;
  left: -20px;
  animation-delay: 0.2s;
}

.steam-2 {
  height: 60px;
  left: 0;
  animation-delay: 0.7s;
}

.steam-3 {
  height: 70px;
  left: 20px;
  animation-delay: 0.4s;
}

@keyframes steam-rise {
  0% {
    transform: translateY(0) scaleX(1);
    opacity: 0;
  }
  15% {
    opacity: 1;
  }
  50% {
    transform: translateY(-100px) scaleX(2);
  }
  95% {
    opacity: 0;
  }
  100% {
    transform: translateY(-120px) scaleX(3);
    opacity: 0;
  }
}

.bean-1 {
  width: 120px;
  height: 120px;
  top: 15%;
  left: 10%;
}

.bean-2 {
  width: 180px;
  height: 180px;
  top: 60%;
  left: 15%;
}

.bean-3 {
  width: 100px;
  height: 100px;
  top: 30%;
  right: 12%;
}

.bean-4 {
  width: 150px;
  height: 150px;
  bottom: 20%;
  right: 15%;
}

.bean-5 {
  width: 90px;
  height: 90px;
  top: 10%;
  right: 35%;
}

.bean-6 {
  width: 200px;
  height: 200px;
  bottom: 10%;
  left: 40%;
  opacity: 0.1;
}

.bean-7 {
  width: 130px;
  height: 130px;
  top: 40%;
  left: 35%;
}

/* Subtle coffee grain texture overlay */
.min-h-screen::after {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-image: url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMDAiIGhlaWdodD0iMjAwIj48ZmlsdGVyIGlkPSJub2lzZSIgeD0iMCIgeT0iMCIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSI+PGZlVHVyYnVsZW5jZSB0eXBlPSJmcmFjdGFsTm9pc2UiIGJhc2VGcmVxdWVuY3k9IjAuNjUiIG51bU9jdGF2ZXM9IjMiIHN0aXRjaFRpbGVzPSJzdGl0Y2giIHJlc3VsdD0ibm9pc2UiLz48L2ZpbHRlcj48cmVjdCB3aWR0aD0iMTAwJSIgaGVpZ2h0PSIxMDAlIiBmaWx0ZXI9InVybCgjbm9pc2UpIiBvcGFjaXR5PSIwLjA1Ii8+PC9zdmc+');
  opacity: 0.2;
  mix-blend-mode: overlay;
  pointer-events: none;
}
</style>