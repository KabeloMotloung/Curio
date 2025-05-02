<script setup>
import { onMounted, ref, onBeforeUnmount } from 'vue'
import { gsap } from 'gsap'
import { ScrollTrigger } from 'gsap/ScrollTrigger'
import TheDiscoveryCard from '../Cards/TheDiscoveryCard.vue'
import TheSwanCard from '../Cards/TheSwanCard.vue'
import PangolinAndCrocodileCard from '../Cards/PangolinAndCrocodileCard.vue'
import SpindleWhorlCard from '../Cards/SpindleWhorlCard.vue'
import TheKraalCard from '../Cards/TheKraalCard.vue'
import SidwaneTokozileCard from '../Cards/SidwaneTokozileCard.vue'
import BattleOfTorquayCard from '../Cards/BattleOfTorquayCard.vue'

gsap.registerPlugin(ScrollTrigger)

const scrollContainer = ref(null)
const cardContainer = ref(null)
const welcomeMessage = ref(null)
const scrollPrompt = ref(null)
const sections = ref([])
const currentSection = ref(-1)
const animations = ref([])
const glassRing = ref(null);
const glassHandle = ref(null);

const artifactInfo = {
  theDiscovery: {
    title: "The Discovery",
    artist: "Alexis Preller",
    description: "A significant painting that exemplifies the artist's distinctive style and approach to South African art.",
    year: "1959",
    type: "Painting",
    location: "Edoardo Villa Gallery, Old Merensky"
  },
  theSwan: {
    title: "The Swan",
    artist: "Jacob Spohler",
    description: "A detailed painting showcasing the artist's mastery of light and composition.",
    year: "1849",
    type: "Painting",
    location: "Van Tilburg Gallery, Old Arts 2-10"
  },
  pangolinAndCrocodile: {
    title: "Pangolin and Crocodile",
    artist: "Thulani Mntungwa & Jabu Nene",
    description: "A contemporary ceramic work depicting the relationship between these two species in African wildlife.",
    year: "2022",
    type: "Ceramic",
    location: "Gallery room 2-13, Old Arts"
  },
  spindleWhorl: {
    title: "Spindle whorls",
    artist: "Mapungubwe (Archaeological collection)",
    description: "Ancient ceramic artifacts used in textile production, showcasing the technological innovations of early societies.",
    year: "1200 - 1290 AD",
    type: "Archaeological ceramic",
    location: "Mapungubwe Ceramics Gallery, Old Arts 2-5"
  },
  theKraal: {
    title: "The Kraal",
    artist: "Josephine Memela & Mary Shabalala",
    description: "A tapestry representing traditional African living structures and community organization.",
    year: "1974",
    type: "Tapestry",
    location: "Bridge Gallery, Javett-UP Art Centre"
  },
  sidwaneTokozile: {
    title: "Sidwane Tokozile",
    artist: "Anton van Wouw",
    description: "A remarkable sculpture depicting indigenous South African culture, showcasing van Wouw's masterful attention to detail and expression.",
    year: "1910",
    type: "Sculpture",
    location: "Edoardo Villa Gallery, Old Merensky"
  },
  battleOfTorquay: {
    title: "Battle of Torquay",
    artist: "Abraham Storck",
    description: "A dramatic naval scene depicting historical maritime conflict with exceptional attention to detail and atmospheric effects.",
    year: "1688",
    type: "Painting",
    location: "Van Tilburg Gallery, Old Arts 2-10"
  }
}

const navigateToSection = (index) => {
  if (index === currentSection.value || index < -1 || index >= sections.value.length) return;

  const direction = index > currentSection.value ? 1 : -1;

  const isRapidScroll = Date.now() - lastScrollTime < 150;
  const animDuration = isRapidScroll ? 0.25 : 0.5;

  if (index === -1) {
    // Navigate back to the welcome message
    welcomeMessage.value.style.display = "flex";

    const welcomeAnim = gsap.fromTo(
      welcomeMessage.value,
      { opacity: 0, scale: 0.95 },
      { opacity: 1, scale: 1, duration: animDuration, ease: "power2.out" }
    );

    const promptAnim = gsap.fromTo(
      scrollPrompt.value,
      { opacity: 0, y: 20 },
      { opacity: 1, y: 0, duration: animDuration, ease: "power2.out" }
    );

    const sectionAnim = gsap.to(sections.value[currentSection.value], {
      autoAlpha: 0,
      x: "100%",
      duration: animDuration,
      ease: "power2.out",
    });

    const glassHandleAnim = gsap.fromTo(
      glassHandle.value,
      { strokeDasharray: "100", strokeDashoffset: "100" }, // Start hidden
      {
        strokeDashoffset: "0", // Draw the handle
        duration: 1.5,
        ease: "power2.out",
        delay: 0.5, // Start after the ring animation
        onComplete: () => {
          // Add glowing effect after drawing
          gsap.to(glassHandle.value, {
            filter: "drop-shadow(0 0 10px white)",
            duration: 0.5,
            repeat: 0,
            yoyo: true,
          });
        },
      }
    );

    const glassRingAnim  =  gsap.fromTo(
      glassRing.value,
      { strokeDasharray: "94.25", strokeDashoffset: "94.25" }, // Start hidden
      {
        strokeDashoffset: "0", // Draw the ring
        duration: 2,
        ease: "power2.out",
        onComplete: () => {
          // Add glowing effect after drawing
          gsap.to(glassRing.value, {
            filter: "drop-shadow(0 0 10px white)",
            duration: 0.5,
            repeat: 0,
            yoyo: true,
          });
        },
      }
    );

    animations.value.push(welcomeAnim, promptAnim, sectionAnim, glassHandleAnim, glassRingAnim);
  } else {
    if (currentSection.value === -1) {
      // Hide the welcome message
      const welcomeAnim = gsap.to(welcomeMessage.value, {
        opacity: 0,
        scale: 0.95,
        duration: animDuration,
        ease: "power2.out",
        onComplete: () => {
          welcomeMessage.value.style.display = "none";
        },
      });

      const promptAnim = gsap.to(scrollPrompt.value, {
        opacity: 0,
        y: 20,
        duration: animDuration,
        ease: "power2.out",
      });

      sections.value.forEach((section, idx) => {
        if (idx !== index) {
          gsap.set(section, { autoAlpha: 0, x: "100%", zIndex: 1 });
        }
      });

      const sectionAnim = gsap.fromTo(
        sections.value[index],
        { autoAlpha: 0, x: "100%", zIndex: 2 },
        { autoAlpha: 1, x: "0%", duration: animDuration + 0.1, ease: "power1.out" }
      );

      animations.value.push(welcomeAnim, promptAnim, sectionAnim);
    } else {
      // Navigate between sections
      if (direction > 0) {
        gsap.set(sections.value[currentSection.value], { zIndex: 1 });
        gsap.set(sections.value[index], { zIndex: 2 });

        const currentAnim = gsap.to(sections.value[currentSection.value], {
          autoAlpha: 0,
          x: "-100%",
          duration: animDuration,
          ease: "power1.out",
          onComplete: () => {
            gsap.set(sections.value[currentSection.value], { autoAlpha: 0 });
          },
        });

        const newAnim = gsap.fromTo(
          sections.value[index],
          { autoAlpha: 0, x: "100%" },
          { autoAlpha: 1, x: "0%", duration: animDuration, ease: "power1.out" }
        );

        animations.value.push(currentAnim, newAnim);
      } else {
        gsap.set(sections.value[currentSection.value], { zIndex: 1 });
        gsap.set(sections.value[index], { zIndex: 2 });

        const currentAnim = gsap.to(sections.value[currentSection.value], {
          autoAlpha: 0,
          x: "100%",
          duration: animDuration,
          ease: "power1.out",
          onComplete: () => {
            gsap.set(sections.value[currentSection.value], { autoAlpha: 0 });
          },
        });

        const newAnim = gsap.fromTo(
          sections.value[index],
          { autoAlpha: 0, x: "-100%" },
          { autoAlpha: 1, x: "0%", duration: animDuration, ease: "power1.out" }
        );

        animations.value.push(currentAnim, newAnim);
      }
    }
  }

  currentSection.value = index;
};

const handleWheel = (e) => {
  if (Math.abs(e.deltaY) < 5) return;

  e.preventDefault();

  const now = Date.now();
  const isRapidScroll = now - lastScrollTime < 150;
  lastScrollTime = now;

  const animationsActive = animations.value.some(
    (anim) => anim.isActive && anim.isActive() && anim.vars && anim.vars.onComplete
  );

  if (isRapidScroll && animationsActive) {
    animations.value.forEach((anim) => {
      if (anim.isActive && anim.isActive() && anim.progress) {
        anim.progress(1);
      }
    });
  } else if (animationsActive && !isRapidScroll) {
    return;
  }

  const direction = e.deltaY > 0 ? 1 : -1;

  if (currentSection.value === -1 && direction > 0) {
    navigateToSection(0);
    return;
  }

  if (currentSection.value === 0 && direction < 0) {
    navigateToSection(-1);
    return;
  }

  const nextSection = currentSection.value + direction;

  if (nextSection >= -1 && nextSection < sections.value.length) {
    navigateToSection(nextSection);
  }
};


let lastScrollTime = 0;

const handleKeydown = (e) => {
  if (e.key === 'ArrowRight' || e.key === 'ArrowDown') {
    if (currentSection.value === -1) {
      navigateToSection(0)
    } else if (currentSection.value < sections.value.length - 1) {
      navigateToSection(currentSection.value + 1)
    }
  } else if (e.key === 'ArrowLeft' || e.key === 'ArrowUp') {
    if (currentSection.value > 0) {
      navigateToSection(currentSection.value - 1)
    } else if (currentSection.value === 0) {
      currentSection.value = -1
      welcomeMessage.value.style.display = 'flex'
      
      const welcomeAnim = gsap.fromTo(welcomeMessage.value, 
        { opacity: 0, scale: 0.95 }, 
        { opacity: 1, scale: 1, duration: 0.5 }
      )
      
      const promptAnim = gsap.fromTo(scrollPrompt.value, 
        { opacity: 0, y: 20 }, 
        { opacity: 1, y: 0, duration: 0.5 }
      )
      
      animations.value.push(welcomeAnim, promptAnim)
    }
  }
}

onMounted(() => {

  const welcomeAnim = gsap.fromTo(
      welcomeMessage.value,
      { opacity: 0, scale: 0.95 },
      { opacity: 1, scale: 1, duration: 1, ease: "power2.out" }
    );

  const glassHandleAnim = gsap.fromTo(
      glassHandle.value,
      { strokeDasharray: "100", strokeDashoffset: "100" }, // Start hidden
      {
        strokeDashoffset: "0", // Draw the handle
        duration: 1.5,
        ease: "power2.out",
        delay: 0.5, // Start after the ring animation
        onComplete: () => {
          // Add glowing effect after drawing
          gsap.to(glassHandle.value, {
            filter: "drop-shadow(0 0 10px white)",
            duration: 0.5,
            repeat: 0,
            yoyo: true,
          });
        },
      }
    );

    const glassRingAnim  =  gsap.fromTo(
      glassRing.value,
      { strokeDasharray: "94.25", strokeDashoffset: "94.25" }, // Start hidden
      {
        strokeDashoffset: "0", // Draw the ring
        duration: 2,
        ease: "power2.out",
        onComplete: () => {
          // Add glowing effect after drawing
          gsap.to(glassRing.value, {
            filter: "drop-shadow(0 0 10px white)",
            duration: 0.5,
            repeat: 0,
            yoyo: true,
          });
        },
      }
    );

  sections.value = Array.from(cardContainer.value.querySelectorAll('.card-pair'))
  
  sections.value.forEach(section => {
    gsap.set(section, { autoAlpha: 0 })
  })
  
  const arrowAnim = gsap.to(scrollPrompt.value.querySelector('.scroll-arrow'), {
    x: 10,
    repeat: -1,
    yoyo: true,
    duration: 1,
    ease: 'power1.inOut'
  })
  
  animations.value.push(arrowAnim, welcomeAnim, glassHandleAnim, glassRingAnim)
  
  window.addEventListener('wheel', handleWheel, { passive: false })
  window.addEventListener('keydown', handleKeydown)
})

onBeforeUnmount(() => {
  window.removeEventListener('wheel', handleWheel)
  window.removeEventListener('keydown', handleKeydown)
  
  animations.value.forEach(anim => {
    if (anim && anim.kill) {
      anim.kill()
    }
  })
  
  if (ScrollTrigger) {
    ScrollTrigger.getAll().forEach(trigger => {
      trigger.kill()
    })
  }
})

onBeforeUnmount(() => {

  ScrollTrigger.getAll().forEach(trigger => trigger.kill())

  gsap.globalTimeline.clear()
})
</script>


<template>
    <div class="background-blur"></div>
  
    <div class="welcome-message" ref="welcomeMessage">
      <div class="logo-container">
        <svg
          class="modern-magnifying-glass"
          xmlns="http://www.w3.org/2000/svg"
          viewBox="0 0 100 100"
        >
          <!-- Glass Ring -->
          <circle
            ref="glassRing"
            cx="50"
            cy="50"
            r="15"
            stroke="white"
            stroke-width="3"
            fill="none"
            stroke-linecap="round"
          />
          <!-- Glass Handle -->
          <line
            ref="glassHandle"
            x1="65"
            y1="65"
            x2="80"
            y2="80"
            stroke="white"
            stroke-width="3"
            stroke-linecap="round"
          />
        </svg>
        <div class="modern-logo-text">Curio</div>
      </div>
      <h1>A Virtual Tour of The University of Pretoria's Museum</h1>
    </div>

    <div class="scroll-prompt" ref="scrollPrompt">
      <p>Scroll to Begin Tour</p>
      <div class="scroll-arrow">→</div>
    </div>
  
    <div ref="scrollContainer" class="card-container-wrapper">
      <div ref="cardContainer" class="card-container">
        <div class="card-pair">
          <div class="artifact-container">
            <div class="artifact-image-container">
              <TheDiscoveryCard class="artifact-card" />
            </div>
            <div class="info-card">
              <h2>{{ artifactInfo.theDiscovery.title }}</h2>
              <h3>{{ artifactInfo.theDiscovery.artist }}</h3>
              <p>{{ artifactInfo.theDiscovery.description }}</p>
              <div class="info-details">
                <p><strong>Year:</strong> {{ artifactInfo.theDiscovery.year }}</p>
                <p><strong>Type:</strong> {{ artifactInfo.theDiscovery.type }}</p>
                <p><strong>Location:</strong> {{ artifactInfo.theDiscovery.location }}</p>
              </div>
            </div>
          </div>
        </div>
        
        <div class="card-pair">
          <div class="artifact-container">
            <div class="artifact-image-container">
              <TheSwanCard class="artifact-card" />
            </div>
            <div class="info-card">
              <h2>{{ artifactInfo.theSwan.title }}</h2>
              <h3>{{ artifactInfo.theSwan.artist }}</h3>
              <p>{{ artifactInfo.theSwan.description }}</p>
              <div class="info-details">
                <p><strong>Year:</strong> {{ artifactInfo.theSwan.year }}</p>
                <p><strong>Type:</strong> {{ artifactInfo.theSwan.type }}</p>
                <p><strong>Location:</strong> {{ artifactInfo.theSwan.location }}</p>
              </div>
            </div>
          </div>
        </div>
        
        <div class="card-pair">
          <div class="artifact-container">
            <div class="artifact-image-container">
              <PangolinAndCrocodileCard class="artifact-card" />
            </div>
            <div class="info-card">
              <h2>{{ artifactInfo.pangolinAndCrocodile.title }}</h2>
              <h3>{{ artifactInfo.pangolinAndCrocodile.artist }}</h3>
              <p>{{ artifactInfo.pangolinAndCrocodile.description }}</p>
              <div class="info-details">
                <p><strong>Year:</strong> {{ artifactInfo.pangolinAndCrocodile.year }}</p>
                <p><strong>Type:</strong> {{ artifactInfo.pangolinAndCrocodile.type }}</p>
                <p><strong>Location:</strong> {{ artifactInfo.pangolinAndCrocodile.location }}</p>
              </div>
            </div>
          </div>
        </div>
        
        <div class="card-pair">
          <div class="artifact-container">
            <div class="artifact-image-container">
              <SpindleWhorlCard class="artifact-card" />
            </div>
            <div class="info-card">
              <h2>{{ artifactInfo.spindleWhorl.title }}</h2>
              <h3>{{ artifactInfo.spindleWhorl.artist }}</h3>
              <p>{{ artifactInfo.spindleWhorl.description }}</p>
              <div class="info-details">
                <p><strong>Year:</strong> {{ artifactInfo.spindleWhorl.year }}</p>
                <p><strong>Type:</strong> {{ artifactInfo.spindleWhorl.type }}</p>
                <p><strong>Location:</strong> {{ artifactInfo.spindleWhorl.location }}</p>
              </div>
            </div>
          </div>
        </div>
        
        <div class="card-pair">
          <div class="artifact-container">
            <div class="artifact-image-container">
              <TheKraalCard class="artifact-card" />
            </div>
            <div class="info-card">
              <h2>{{ artifactInfo.theKraal.title }}</h2>
              <h3>{{ artifactInfo.theKraal.artist }}</h3>
              <p>{{ artifactInfo.theKraal.description }}</p>
              <div class="info-details">
                <p><strong>Year:</strong> {{ artifactInfo.theKraal.year }}</p>
                <p><strong>Type:</strong> {{ artifactInfo.theKraal.type }}</p>
                <p><strong>Location:</strong> {{ artifactInfo.theKraal.location }}</p>
              </div>
            </div>
          </div>
        </div>

        <div class="card-pair">
          <div class="artifact-container">
            <div class="artifact-image-container">
              <SidwaneTokozileCard class="artifact-card" />
            </div>
            <div class="info-card">
              <h2>{{ artifactInfo.sidwaneTokozile.title }}</h2>
              <h3>{{ artifactInfo.sidwaneTokozile.artist }}</h3>
              <p>{{ artifactInfo.sidwaneTokozile.description }}</p>
              <div class="info-details">
                <p><strong>Year:</strong> {{ artifactInfo.sidwaneTokozile.year }}</p>
                <p><strong>Type:</strong> {{ artifactInfo.sidwaneTokozile.type }}</p>
                <p><strong>Location:</strong> {{ artifactInfo.sidwaneTokozile.location }}</p>
              </div>
            </div>
          </div>
        </div>

        <div class="card-pair">
          <div class="artifact-container">
            <div class="artifact-image-container">
              <BattleOfTorquayCard class="artifact-card" />
            </div>
            <div class="info-card">
              <h2>{{ artifactInfo.battleOfTorquay.title }}</h2>
              <h3>{{ artifactInfo.battleOfTorquay.artist }}</h3>
              <p>{{ artifactInfo.battleOfTorquay.description }}</p>
              <div class="info-details">
                <p><strong>Year:</strong> {{ artifactInfo.battleOfTorquay.year }}</p>
                <p><strong>Type:</strong> {{ artifactInfo.battleOfTorquay.type }}</p>
                <p><strong>Location:</strong> {{ artifactInfo.battleOfTorquay.location }}</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <div class="navigation-controls">
      <button 
        class="nav-button prev" 
        @click="navigateToSection(currentSection <= 0 ? -1 : currentSection - 1)"
        :disabled="currentSection < 0"
      >
        <span>←</span>
      </button>
      <button 
        class="nav-button next" 
        @click="navigateToSection(currentSection === -1 ? 0 : currentSection + 1)"
        :disabled="currentSection >= sections.length - 1"
      >
        <span>→</span>
      </button>
    </div>
</template>
  

<style>
.welcome-message {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 2;
  color: white;
  text-align: center;
  pointer-events: none;
  transition: opacity 0.3s ease;
  background-color: rgba(0, 0, 0, 0.5);
  padding: 2rem 3rem;
  border-radius: 15px;
  backdrop-filter: blur(10px);
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
  max-width: 80%;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.welcome-message h1 {
  margin: 0;
  font-size: 2.4rem;
  font-weight: 600;
  letter-spacing: 1px;
  text-shadow: 0 2px 10px rgba(0, 0, 0, 0.5);
  line-height: 1.2;
}

.logo-container {
  display: flex;
  align-items: center;
  justify-content: center;
  margin-bottom: 1.5rem;
}

.modern-logo-text {
  font-size: 2rem;
  font-weight: bold;
  color: white;
  text-shadow: 0 0 10px rgba(255, 255, 255, 0.8);
}

.modern-magnifying-glass {
  width: 80px;
  height: 80px;
  margin-bottom: 1rem;
}

.glass-ring {
  position: absolute;
  top: 0;
  left: 0;
  width: 35px;
  height: 35px;
  border-radius: 50%;
  border: 3px solid transparent;
  background: linear-gradient(135deg, #f0f0f0, #a0a0a0) border-box;
  -webkit-mask: 
    linear-gradient(#fff 0 0) padding-box, 
    linear-gradient(#fff 0 0);
  -webkit-mask-composite: xor;
  mask-composite: exclude;
  box-shadow: 
    0 0 10px rgba(255, 255, 255, 0.5),
    0 0 20px rgba(200, 200, 200, 0.3);
}

.glass-handle {
  position: absolute;
  width: 4px;
  height: 22px;
  background: linear-gradient(135deg, #f0f0f0, #a0a0a0);
  border-radius: 4px;
  transform: rotate(-45deg);
  bottom: 10px;
  right: 15px;
  box-shadow: 0 0 10px rgba(255, 255, 255, 0.5);
}

.scroll-prompt {
  position: fixed;
  bottom: 30px;
  left: 50%;
  transform: translateX(-50%);
  color: white;
  z-index: 2;
  text-align: center;
  font-size: 1.2rem;
  text-shadow: 0 2px 5px rgba(0, 0, 0, 0.5);
  animation: fade-in 1.5s ease-in-out;
}

.scroll-arrow {
  font-size: 2rem;
  margin-top: 5px;
  color: #f0f0f0;
}

@keyframes fade-in {
  0% { opacity: 0; transform: translate(-50%, 20px); }
  100% { opacity: 1; transform: translate(-50%, 0); }
}

.card-container-wrapper {
  width: 100vw;
  height: 100vh;
  overflow: hidden;
  position: relative;
}

.card-container {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100vh;
  display: flex;
  align-items: center;
}

.card-pair {
  width: 100vw;
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  position: absolute;
  left: 0;
  top: 0;
  will-change: transform, opacity;
  visibility: hidden; 
  opacity: 0;
}

.artifact-container {
  display: flex;
  width: 80%;
  max-width: 1400px;
  background-color: rgba(0, 0, 0, 0.5);
  padding: 30px;
  border-radius: 15px;
  backdrop-filter: blur(5px);
}

.artifact-image-container {
  flex: 1;
  height: 500px;
}

.artifact-card {
  width: 100%;
  height: 100%;
  border-radius: 10px;
  overflow: hidden;
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
}

.info-card {
  flex: 1;
  color: white;
  background-color: rgba(0, 0, 0, 0.4);
  padding: 30px;
  border-radius: 10px;
  backdrop-filter: blur(5px);
  margin-left: 30px;
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.info-card h2 {
  font-size: 2.2rem;
  margin-bottom: 5px;
  color: #f0f0f0;
}

.info-card h3 {
  font-size: 1.4rem;
  margin-bottom: 20px;
  color: #d0d0d0;
  font-style: italic;
}

.info-card p {
  font-size: 1.1rem;
  line-height: 1.6;
  margin-bottom: 20px;
}

.info-details {
  margin-top: 20px;
  padding-top: 15px;
  border-top: 1px solid rgba(255, 255, 255, 0.3);
}

.info-details p {
  margin-bottom: 5px;
  font-size: 1rem;
}

body {
  margin: 0;
  height: 100vh;
  overflow-x: hidden;
  overflow-y: auto;
}

.background-blur {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-image: url('./assets/ImageOfMuseum.jpeg');
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  filter: blur(25px);
  opacity: 0.7;
  z-index: 0;
}

.navigation-controls {
  position: fixed;
  bottom: 40px;
  right: 40px;
  z-index: 10;
  display: flex;
  gap: 15px;
}

.nav-button {
  background-color: rgba(40, 40, 40, 0.6);
  color: rgba(240, 240, 240, 0.9);
  border: none;
  width: 40px;
  height: 40px;
  border-radius: 50%;
  font-size: 1.2rem;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  transition: all 0.2s;
  backdrop-filter: blur(5px);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  padding: 0;
  line-height: 1;
}

.nav-button span {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 100%;
  height: 100%;
  margin-top: -2px;
}

.nav-button:hover:not(:disabled) {
  background-color: rgba(80, 80, 80, 0.8);
  transform: scale(1.1);
}

.nav-button:disabled {
  opacity: 0.3;
  cursor: not-allowed;
}
</style>
