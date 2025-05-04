<script setup>
import {nextTick, onBeforeUnmount, onMounted, ref, watch} from 'vue'
import {gsap} from 'gsap'
import {ScrollTrigger} from 'gsap/ScrollTrigger'
import TheDiscoveryCard from '../Cards/TheDiscoveryCard.vue'
import TheSwanCard from '../Cards/TheSwanCard.vue'
import PangolinAndCrocodileCard from '../Cards/PangolinAndCrocodileCard.vue'
import SpindleWhorlCard from '../Cards/SpindleWhorlCard.vue'
import TheKraalCard from '../Cards/TheKraalCard.vue'
import SidwaneTokozileCard from '../Cards/SidwaneTokozileCard.vue'
import BattleOfTorquayCard from '../Cards/BattleOfTorquayCard.vue'

gsap.registerPlugin(ScrollTrigger)
const loading = ref(true);
const error = ref(null);

const artifactInfo = ref([]);
// Fallback data in case API fails
const artifactInfoFallback = [
  {
    "title": "The Discovery",
    "artist": "Alexis Preller",
    "description": "A significant painting that exemplifies the artist's distinctive style and approach to South African art.",
    "date": "1959",
    "type": "Painting",
    "location": "Edoardo Villa Gallery, Old Merensky",
    "artifact-id": "discovery-001"
  },
  {
    "title": "The Swan",
    "artist": "Jacob Spohler",
    "description": "A detailed painting showcasing the artist's mastery of light and composition.",
    "date": "1849",
    "type": "Painting",
    "location": "Van Tilburg Gallery, Old Arts 2-10",
    "artifact-id": "swan-002"
  },
  {
    "title": "Pangolin and Crocodile",
    "artist": "Thulani Mntungwa & Jabu Nene",
    "description": "A contemporary ceramic work depicting the relationship between these two species in African wildlife.",
    "date": "2022",
    "type": "Ceramic",
    "location": "Gallery room 2-13, Old Arts",
    "artifact-id": "pangolin-003"
  },
  {
    "title": "Spindle whorls",
    "artist": "Mapungubwe (Archaeological collection)",
    "description": "Ancient ceramic artifacts used in textile production, showcasing the technological innovations of early societies.",
    "date": "1200 - 1290 AD",
    "type": "Archaeological ceramic",
    "location": "Mapungubwe Ceramics Gallery, Old Arts 2-5",
    "artifact-id": "spindle-004"
  },
  {
    "title": "The Kraal",
    "artist": "Josephine Memela & Mary Shabalala",
    "description": "A tapestry representing traditional African living structures and community organization.",
    "date": "1974",
    "type": "Tapestry",
    "location": "Bridge Gallery, Javett-UP Art Centre",
    "artifact-id": "kraal-005"
  },
  {
    "title": "Sidwane Tokozile",
    "artist": "Anton van Wouw",
    "description": "A remarkable sculpture depicting indigenous South African culture, showcasing van Wouw's masterful attention to detail and expression.",
    "date": "1910",
    "type": "Sculpture",
    "location": "Edoardo Villa Gallery, Old Merensky",
    "artifact-id": "sidwane-006"
  },
  {
    "title": "Battle of Torquay",
    "artist": "Abraham Storck",
    "description": "A dramatic naval scene depicting historical maritime conflict with exceptional attention to detail and atmospheric effects.",
    "date": "1688",
    "type": "Painting",
    "location": "Van Tilburg Gallery, Old Arts 2-10",
    "artifact-id": "battle-007"
  }
];

const fetchData = async () => {
  loading.value = true;
  error.value = null;

  try {
    const response = await fetch('http://localhost:8080/api/v1/dynamoDB/');
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    artifactInfo.value = await response.json();
    console.log('Formatted artifact info:', artifactInfo.value);

  } catch (e) {
    console.error('Error fetching data, using fallback:', e);
    error.value = e;
    artifactInfo.value = artifactInfoFallback;
  } finally {
    loading.value = false;
  }
};

const cardMap = {
  'Battle of Torquay': BattleOfTorquayCard,
  'Pangolin and Crocodile': PangolinAndCrocodileCard,
  'Sidwane Tokozile': SidwaneTokozileCard,
  'Spindle whorls': SpindleWhorlCard,
  'The Discovery': TheDiscoveryCard,
  'The Kraal': TheKraalCard,
  'The Swan': TheSwanCard,
};

const getComponentName = (title) => {
  return cardMap[title] || null;
};
ref(null);
const cardContainer = ref(null)
const welcomeMessage = ref(null)
const scrollPrompt = ref(null)
const navArrows = ref(null)
const sections = ref([])
const currentSection = ref(-1)
const animations = ref([])

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
        {opacity: 0, scale: 0.95},
        {opacity: 1, scale: 1, duration: animDuration, ease: "power2.out"}
    );

    const promptAnim = gsap.fromTo(
        scrollPrompt.value,
        {opacity: 0, y: 20},
        {opacity: 1, y: 0, duration: animDuration, ease: "power2.out"}
    );

    if (currentSection.value >= 0 && currentSection.value < sections.value.length) {
      const sectionAnim = gsap.to(sections.value[currentSection.value], {
        autoAlpha: 0,
        x: "100%",
        duration: animDuration,
        ease: "power2.out",
      });
      animations.value.push(sectionAnim);
    }

    animations.value.push(welcomeAnim, promptAnim);
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
          gsap.set(section, {autoAlpha: 0, x: "100%", zIndex: 1});
        }
      });

      const sectionAnim = gsap.fromTo(
          sections.value[index],
          {autoAlpha: 0, x: "100%", zIndex: 2},
          {autoAlpha: 1, x: "0%", duration: animDuration + 0.1, ease: "power1.out"}
      );

      animations.value.push(welcomeAnim, promptAnim, sectionAnim);
    } else {
      // Navigate between sections
      if (direction > 0) {
        gsap.set(sections.value[currentSection.value], {zIndex: 1});
        gsap.set(sections.value[index], {zIndex: 2});

        const currentAnim = gsap.to(sections.value[currentSection.value], {
          autoAlpha: 0,
          x: "-100%",
          duration: animDuration,
          ease: "power1.out",
          onComplete: () => {
            gsap.set(sections.value[currentSection.value], {autoAlpha: 0});
          },
        });

        const newAnim = gsap.fromTo(
            sections.value[index],
            {autoAlpha: 0, x: "100%"},
            {autoAlpha: 1, x: "0%", duration: animDuration, ease: "power1.out"}
        );

        animations.value.push(currentAnim, newAnim);
      } else {
        gsap.set(sections.value[currentSection.value], {zIndex: 1});
        gsap.set(sections.value[index], {zIndex: 2});

        const currentAnim = gsap.to(sections.value[currentSection.value], {
          autoAlpha: 0,
          x: "100%",
          duration: animDuration,
          ease: "power1.out",
          onComplete: () => {
            gsap.set(sections.value[currentSection.value], {autoAlpha: 0});
          },
        });

        const newAnim = gsap.fromTo(
            sections.value[index],
            {autoAlpha: 0, x: "-100%"},
            {autoAlpha: 1, x: "0%", duration: animDuration, ease: "power1.out"}
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
      navigateToSection(-1);
    }
  }
}

const initSections = () => {
  nextTick(() => {
    sections.value = Array.from(document.querySelectorAll('.card-pair'));
    if (sections.value.length > 0) {
      console.log('Sections initialized:', sections.value.length);
      sections.value.forEach(section => {
        gsap.set(section, {autoAlpha: 0});
      });
    } else {
      console.error('No sections found');
      // Try again after a small delay
      setTimeout(initSections, 200);
    }
  });
}

const handleWelcomeClick = () => {
  navigateToSection(0);
}

onMounted(() => {
  fetchData();

  const welcomeAnim = gsap.fromTo(
      welcomeMessage.value,
      {opacity: 0, scale: 0.95},
      {opacity: 1, scale: 1, duration: 1, ease: "power2.out"}
  );

  const promptAnim = gsap.fromTo(
      scrollPrompt.value,
      {opacity: 0, y: 20},
      {opacity: 1, y: 0, duration: 1, ease: "power2.out", delay: 0.5}
  );

  const arrowAnim = gsap.to(scrollPrompt.value.querySelector('.scroll-arrow'), {
    y: 10,
    repeat: -1,
    yoyo: true,
    duration: 1,
    ease: 'power1.inOut'
  });

  animations.value.push(arrowAnim, welcomeAnim, promptAnim);

  // Add event listeners
  window.addEventListener('wheel', handleWheel, {passive: false});
  window.addEventListener('keydown', handleKeydown);

  // Initialize sections after data is loaded
  watch(artifactInfo, () => {
    if (artifactInfo.value.length) {
      console.log('Artifact info updated, initializing sections');
      initSections();
    }
  }, { immediate: false });

  // Just in case the data loads too quickly
  setTimeout(initSections, 1000);
});

onBeforeUnmount(() => {
  window.removeEventListener('wheel', handleWheel);
  window.removeEventListener('keydown', handleKeydown);

  animations.value.forEach(anim => {
    if (anim && anim.kill) {
      anim.kill();
    }
  });

  if (ScrollTrigger) {
    ScrollTrigger.getAll().forEach(trigger => {
      trigger.kill();
    });
  }

  gsap.globalTimeline.clear();
});
</script>

<template>
  <div class="background-blur">
    <div class="background-color"></div>
  </div>

  <nav class="top-navigation">
    <div class="nav-container">
      <div
          v-for="(info, index) in artifactInfo"
          :key="info['artifact-id'] || index"
          class="nav-item"
          @click="navigateToSection(index)"
          :class="{ active: currentSection === index }"
      >
        {{ info.title }}
      </div>
    </div>
  </nav>

  <div class="welcome-message" ref="welcomeMessage" @click="handleWelcomeClick">
    <h2>A Virtual Tour of:</h2>
    <h1>The University of Pretoria Museum</h1>
  </div>

  <div class="scroll-prompt" ref="scrollPrompt" @click="handleWelcomeClick">
    <p>Click to Begin Tour</p>
    <div class="scroll-arrow">↓</div>
  </div>

  <div class="card-container" ref="cardContainer">
    <div
        v-if="artifactInfo.length"
        v-for="(artifact, index) in artifactInfo"
        :key="artifact['artifact-id'] || index"
        class="card-pair"
    >
      <div class="artifact-container">
        <div class="artifact-image-container">
          <component
              :is="getComponentName(artifact.title)"
              v-if="getComponentName(artifact.title)"
              :image-url="artifact.image_url"
          />
          <div v-else class="placeholder-image">
            {{ artifact.title }}
          </div>
        </div>
        <div class="info-card">
          <h2>{{ artifact.title }}</h2>
          <h3>{{ artifact.artist }}</h3>
          <p>{{ artifact.description || 'No description available.' }}</p>
          <div class="info-details">
            <p><strong>Year:</strong> {{ artifact.date }}</p>
            <p><strong>Type:</strong> {{ artifact.type }}</p>
            <p><strong>Location:</strong> {{ artifact.location }}</p>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="navigation-controls" ref="navArrows">
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
        :class="{ 'glow-pulse': currentSection === -1 }"
    >
      <span>→</span>
    </button>
  </div>
</template>

<style>
.welcome-message {
  position: fixed;
  top: 45%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 2;
  color: white;
  text-align: center;
  padding: 2rem 3rem;
  border-radius: 15px;
  max-width: 80%;
  display: flex;
  flex-direction: column;
  align-items: center;
  cursor: pointer;
  transition: transform 0.3s ease;
}

.welcome-message:hover {
  transform: translate(-50%, -50%) scale(1.02);
}

.welcome-message h1 {
  margin: 0;
  margin-top: 1rem;
  font-size: 2.4rem;
  font-weight: 600;
  letter-spacing: 1px;
  text-shadow: 0 2px 50px rgb(255, 255, 255);
  line-height: 1.2;
}

.welcome-message h2 {
  margin: 0;
  font-size: 1.2rem;
  letter-spacing: 1px;
  text-shadow: 0 2px 50px rgb(255, 255, 255);
  line-height: 1.2;
}

.scroll-prompt {
  position: fixed;
  bottom: 100px;
  left: 50%;
  transform: translateX(-50%);
  color: white;
  z-index: 2;
  text-align: center;
  font-size: 1.2rem;
  text-shadow: 0 2px 5px rgba(0, 0, 0, 0.5);
  cursor: pointer;
  animation: fade-in 1.5s ease-in-out;
}

.scroll-arrow {
  font-size: 2rem;
  margin-top: 5px;
  color: #f0f0f0;
}

@keyframes fade-in {
  0% {
    opacity: 0;
    transform: translate(-50%, 20px);
  }
  100% {
    opacity: 1;
    transform: translate(-50%, 0);
  }
}

.card-container {
  position: relative;
  width: 100%;
  height: 100vh;
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
  width: 60%;
  max-width: 1000px;
  background-color: rgba(0, 0, 0, 0.5);
  padding: 30px;
  border-radius: 15px;
  backdrop-filter: blur(5px);
  border: 1px solid rgba(255, 255, 255, 0.3);
}

.artifact-image-container {
  flex: 1;
  height: 400px;
}

.placeholder-image {
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: rgba(0, 0, 0, 0.3);
  border-radius: 10px;
  color: white;
  font-size: 1.5rem;
  text-align: center;
  padding: 20px;
  border: 1px dashed rgba(255, 255, 255, 0.3);
}

.info-card {
  flex: 1;
  color: white;
  background-color: rgba(0, 0, 0, 0.4);
  border: 1px solid rgba(255, 255, 255, 0.3);
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
  z-index: 0;
}

.background-color {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgb(0, 0, 0);
  opacity: 0.8;
  z-index: 1;
}

.navigation-controls {
  position: fixed;
  bottom: 40px;
  left: 50%;
  transform: translateX(-50%);
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

@keyframes glow-pulse {
  0% {
    box-shadow: 0 0 10px rgba(255, 255, 255, 0.5), 0 0 20px rgba(255, 255, 255, 0.3);
    transform: scale(1);
  }
  50% {
    box-shadow: 0 0 20px rgba(255, 255, 255, 0.8), 0 0 30px rgba(255, 255, 255, 0.5);
    transform: scale(1.1);
  }
  100% {
    box-shadow: 0 0 10px rgba(255, 255, 255, 0.5), 0 0 20px rgba(255, 255, 255, 0.3);
    transform: scale(1);
  }
}

.nav-button.glow-pulse {
  animation: glow-pulse 2.5s infinite ease-in-out;
}

.top-navigation {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 100;
  padding: 0px 0 1rem;
}

.nav-container {
  max-width: 1300px;
  margin: 0 auto;
  display: flex;
  justify-content: center;
  gap: 2rem;
  padding: 1rem 1rem;
  border: 1px solid rgba(255, 255, 255, 0.2);
  border-bottom-left-radius: 12px;
  border-bottom-right-radius: 12px;
  background-color: rgba(0, 0, 0, 0.5);
  backdrop-filter: blur(5px);
}

.nav-item {
  color: white;
  cursor: pointer;
  padding: 0.5rem 1rem;
  border-radius: 4px;
  transition: all 0.3s ease;
  font-size: 0.75rem;
  text-transform: uppercase;
  letter-spacing: 1px;
}

.nav-item:hover {
  background-color: rgba(255, 255, 255, 0.1);
  transform: translateY(-2px);
}

.nav-item.active {
  background-color: rgba(255, 255, 255, 0.2);
  box-shadow: 0 0 10px rgba(255, 255, 255, 0.3);
}
</style>