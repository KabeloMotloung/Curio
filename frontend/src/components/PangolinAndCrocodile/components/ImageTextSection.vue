<script setup lang="ts">
import PangolinAndCrocodileNoBackground from "../assets/PangolinAndCrocodile.png";
import PangolinAndCrocodile from "../assets/PangolinAndCrocodile.png";
import PangolinAndCrocodileBottomView from "../assets/PangolinAndCrocodileBottomView.png";
import PangolinAndCrocodileBottomZoomedOut from "../assets/PangolinAndCrocodileBottomZoomedOutView.png";
import PangolinAndCrocodileLeftView from "../assets/PangolinAndCrocodileLeftView.png";
import PangolinAndCrocodileRightView from "../assets/PangolinAndCrocodileRightView.png";
import PangolinAndCrocodileInspiration from "../assets/pangolin-and-crocodile-inspiration.jpg";
import {gsap, ScrollTrigger} from "gsap/all";
import {onMounted, onUnmounted, ref} from "vue";

gsap.registerPlugin(ScrollTrigger);
const images = [
  {src: PangolinAndCrocodileInspiration, alt: "Pangolin and Crocodile in real life", title: "Art and Life", description: "A pangolin, armored in quiet grace, meets the cold gaze of a crocodile — ancient patience against ancient hunger. Scales shimmer, tension hums. It's a scene that feels painted, yet too raw to be planned. Art imitates life, life returns the favor — but life, unlike art, plays without mercy. Here, they are not friends, only echoes in a living tableau."},
  {
    src: PangolinAndCrocodileNoBackground,
    alt: "Pangolin and Crocodile",
    title: "The Encounter",
    description: "In this sculpted stillness, a pangolin meets a crocodile—an eternal moment carved in earthenware. Their forms entwine in symbolic tension, echoing nature's fragile balance. Sculpture, here, becomes a storyteller, turning clay into cautionary tale."
  },
  {
    src: PangolinAndCrocodileBottomView,
    alt: "Bottom View",
    title: "The Foundation",
    description: "Beneath the surface lies the artist’s devotion—each contour and curve whispering intention. As with all great sculpture, the foundation is not hidden, but revered. It reminds us: what supports beauty is often unseen but never unimportant."
  },
  {
    src: PangolinAndCrocodileLeftView,
    alt: "Left View",
    title: "The Pangolin's Perspective",
    description: "Coiled in quiet resistance, the pangolin stands armored not in steel, but in story. This side reveals the vulnerability beneath defense—scales etched like memory into clay. Through form, we glimpse the soul of a species teetering on extinction’s edge."
  },
  {
    src: PangolinAndCrocodileRightView,
    alt: "Right View",
    title: "The Crocodile's Domain",
    description: "From the right, the crocodile looms—a guardian of ancient waters, its power petrified in ceramic flow. Its sinewy mass speaks to a time before time, where survival was law. Art gives form to this dominance without needing roar or ripple."
  },
  {
    src: PangolinAndCrocodileBottomZoomedOut,
    alt: "Wide View",
    title: "The Complete Story",
    description: "Step back, and the full sculpture reveals itself: not a conflict, but a coexistence. Here lies the sculptor’s wisdom—capturing not just animals, but a shared fate. As all great art does, it invites us to witness, to reflect, and perhaps, to change."
  }
];
const main = ref();
let ctx: gsap.Context;

onMounted(() => {
  ctx = gsap.context(() => {
    const cardContainers = gsap.utils.toArray('.card-container') as HTMLElement[];
    
    // Set initial states - all cards start invisible and transformed
    gsap.set(cardContainers, { 
      autoAlpha: 0,
      scale: 0.8,
      rotation: index => index % 2 === 0 ? -5 : 5
    });
    
    // Create animations for each card
    cardContainers.forEach((card, index) => {
      const cardInner = card.querySelector('.card-inner');
      const cardImage = card.querySelector('.card-image');
      const cardContent = card.querySelector('.card-content');
      if (!cardContent) return;
      const cardTitle = cardContent.querySelector('h2');
      const cardDescription = cardContent.querySelector('p');
      
      // Set initial states for inner elements with staggered positions
      gsap.set(cardInner, { 
        y: 100,
        opacity: 0,
        scale: 0.9,
        rotation: index % 2 === 0 ? -10 : 10
      });
      
      gsap.set(cardImage, { 
        x: index % 2 === 0 ? -100 : 100,
        opacity: 0,
        scale: 0.8,
        rotation: index % 2 === 0 ? -15 : 15
      });
      
      gsap.set(cardTitle, { 
        y: 50,
        opacity: 0,
        scale: 0.8
      });
      
      gsap.set(cardDescription, { 
        y: 30,
        opacity: 0,
        scale: 0.9
      });
      
      // Create entrance timeline with enhanced effects
      const tl = gsap.timeline({
        scrollTrigger: {
          trigger: card,
          start: "top 80%",
          end: "bottom 20%",
          toggleActions: "play none none reverse",
          markers: false,
          onEnter: () => {
            gsap.to(card, { 
              autoAlpha: 1,
              scale: 1,
              rotation: 0,
              duration: 0.8,
              ease: "power3.out"
            });
          },
          onLeaveBack: () => {
            gsap.to(card, { 
              autoAlpha: 0,
              scale: 0.8,
              rotation: index % 2 === 0 ? -5 : 5,
              duration: 0.5
            });
          }
        }
      });
      
      // Enhanced animation sequence
      tl.to(cardInner, {
        y: 0,
        opacity: 1,
        scale: 1,
        rotation: 0,
        duration: 1,
        ease: "back.out(1.7)"
      })
      .to(cardImage, {
        x: 0,
        opacity: 1,
        scale: 1,
        rotation: 0,
        duration: 0.8,
        ease: "back.out(1.7)"
      }, "-=0.6")
      .to(cardTitle, {
        y: 0,
        opacity: 1,
        scale: 1,
        duration: 0.6,
        ease: "power2.out"
      }, "-=0.4")
      .to(cardDescription, {
        y: 0,
        opacity: 1,
        scale: 1,
        duration: 0.6,
        ease: "power2.out"
      }, "-=0.3");

      // Add hover effect
      card.addEventListener('mouseenter', () => {
        gsap.to(cardInner, {
          scale: 1.02,
          rotation: index % 2 === 0 ? 2 : -2,
          duration: 0.3,
          ease: "power2.out"
        });
      });

      card.addEventListener('mouseleave', () => {
        gsap.to(cardInner, {
          scale: 1,
          rotation: 0,
          duration: 0.3,
          ease: "power2.out"
        });
      });
    });
    
    // Create page intro animation
    const introTl = gsap.timeline();
    introTl.fromTo(cardContainers[0], 
      { autoAlpha: 0 },
      { autoAlpha: 1, duration: 0.5 }
    );
    
    // Animate first card specially for page load
    const firstCard = cardContainers[0];
    const firstCardInner = firstCard.querySelector('.card-inner');
    const firstCardImage = firstCard.querySelector('.card-image');
    const firstCardContent = firstCard.querySelector('.card-content');
    if (!firstCardContent) return;
    const firstCardTitle = firstCardContent.querySelector('h2');
    const firstCardDescription = firstCardContent.querySelector('p');
    
    introTl
      .fromTo(firstCardInner, 
        { y: 100, opacity: 0, scale: 0.9 },
        { y: 0, opacity: 1, scale: 1, duration: 1.2, ease: "power3.out" },
        "-=0.3"
      )
      .fromTo(firstCardImage, 
        { x: -50, opacity: 0, scale: 0.8, rotation: -10 },
        { x: 0, opacity: 1, scale: 1, rotation: 0, duration: 0.8, ease: "back.out(1.7)" },
        "-=0.8"
      )
      .fromTo(firstCardTitle, 
        { y: 30, opacity: 0 },
        { y: 0, opacity: 1, duration: 0.6, ease: "power2.out" },
        "-=0.4"
      )
      .fromTo(firstCardDescription, 
        { y: 20, opacity: 0 },
        { y: 0, opacity: 1, duration: 0.6, ease: "power2.out" },
        "-=0.3"
      );     
  }, main.value);
});

onUnmounted(() => {
  // Clean up all GSAP animations when component is unmounted
  ctx.revert();
});
</script>

<template>
  <div ref="main" class="main-container">
    <section 
      v-for="(image, index) in images" 
      :key="index" 
      class="card-container h-screen w-screen flex items-center justify-center relative"
    >
      <div class="card-inner w-full h-full flex flex-col md:flex-row items-center p-8 rounded-xl"
           :class="{'md:flex-row-reverse': index % 2 !== 0}">
        <!-- Floating particles -->
        <div class="particle particle-1"></div>
        <div class="particle particle-2"></div>
        <div class="particle particle-3"></div>
        <div class="particle particle-4"></div>
        
        <div class="card-image-container md:w-1/2 flex justify-center items-center p-4">
          <img
            :src="image.src"
            :alt="image.alt"
            :class="['card-image', 'rounded-xl', 'max-h-[80vh]', 'object-contain', 'transition-all', 'duration-500']"
          />
        </div>
        <div class="card-content md:w-1/2 p-8 flex flex-col justify-center">
          <h2 class="text-4xl md:text-5xl font-bold text-gray-800 mb-6">{{ image.title }}</h2>
          <p class="text-xl text-gray-600 leading-relaxed">{{ image.description }}</p>
        </div>
      </div>
    </section>
  </div>
</template>

<style scoped>
.main-container {
  position: relative;
  width: 100%;
  height: 100%;
  background: linear-gradient(to bottom, #f8f9fa, #e9ecef);
  overflow-x: hidden;
}

.card-container {
  position: relative;
  width: 100vw;
  height: 100vh;
  background-size: cover;
  background-position: center;
  opacity: 0;
}

.card-inner {
  width: 100%;
  height: 100%;
  backdrop-filter: blur(8px);
  transition: transform 0.5s ease;
  box-shadow: 0 15px 35px rgba(0,0,0,0.2), 0 5px 15px rgba(0,0,0,0.1);
  background: rgba(255,255,255,0.7);
  border: 1px solid rgba(255,255,255,0.6);
  position: relative;
  overflow: hidden;
  z-index: 1;
}

.card-inner::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: 
    radial-gradient(circle at 20% 30%, rgba(42, 63, 95, 0.15) 0%, transparent 50%),
    radial-gradient(circle at 80% 70%, rgba(46, 125, 50, 0.15) 0%, transparent 50%);
  z-index: -1;
}

.card-inner::after {
  content: "";
  position: absolute;
  width: 200%;
  height: 200%;
  top: -50%;
  left: -50%;
  background: linear-gradient(45deg, 
    rgba(255,255,255,0) 0%, 
    rgba(255,255,255,0.2) 30%, 
    rgba(255,255,255,0.3) 40%, 
    rgba(255,255,255,0) 60%);
  transform: rotate(25deg);
  transition: transform 0.5s ease;
  z-index: -1;
  animation: shine 8s infinite linear;
}

@keyframes shine {
  0% { transform: translateX(-100%) rotate(25deg); }
  100% { transform: translateX(100%) rotate(25deg); }
}

.card-container:nth-child(1) .card-inner {
  background: linear-gradient(135deg, rgba(255,255,255,0.8), rgba(232, 234, 246, 0.8));
}

.card-container:nth-child(2) .card-inner {
  background: linear-gradient(135deg, rgba(255,255,255,0.8), rgba(225, 245, 254, 0.8));
}

.card-container:nth-child(3) .card-inner {
  background: linear-gradient(135deg, rgba(255,255,255,0.8), rgba(232, 245, 233, 0.8));
}

.card-container:nth-child(4) .card-inner {
  background: linear-gradient(135deg, rgba(255,255,255,0.8), rgba(255, 243, 224, 0.8));
}

.card-container:nth-child(5) .card-inner {
  background: linear-gradient(135deg, rgba(255,255,255,0.8), rgba(237, 231, 246, 0.8));
}

.card-container:nth-child(6) .card-inner {
  background: linear-gradient(135deg, rgba(255,255,255,0.8), rgba(225, 243, 240, 0.8));
}

.card-image {
  filter: drop-shadow(0 10px 15px rgba(0,0,0,0.2));
  max-width: 100%;
  height: auto;
  will-change: transform;
}

.card-content {
  position: relative;
  z-index: 2;
}

.card-content h2 {
  background: linear-gradient(45deg, #2a3f5f, #2e7d32);
  -webkit-background-clip: text;
  background-clip: text;
  color: transparent;
  font-weight: 700;
  letter-spacing: -0.5px;
}

.card-content p {
  text-shadow: 0 1px 2px rgba(255,255,255,0.8);
}

/* Particle effects for enhanced visual experience */
@keyframes float {
  0%, 100% { transform: translateY(0) translateX(0); }
  25% { transform: translateY(-15px) translateX(10px); }
  50% { transform: translateY(0) translateX(15px); }
  75% { transform: translateY(15px) translateX(5px); }
}

.card-container:before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: 
    radial-gradient(circle at 20% 30%, rgba(42, 63, 95, 0.08) 0%, transparent 60%),
    radial-gradient(circle at 80% 70%, rgba(46, 125, 50, 0.08) 0%, transparent 60%);
  z-index: -1;
}

.particle {
  position: absolute;
  border-radius: 50%;
  background: linear-gradient(135deg, rgba(255,255,255,0.8), rgba(255,255,255,0.2));
  box-shadow: 0 0 10px rgba(255,255,255,0.8), 0 0 20px rgba(255,255,255,0.4);
  pointer-events: none;
  z-index: 0;
}

.particle-1 {
  width: 80px;
  height: 80px;
  top: 15%;
  left: 10%;
  animation: float 8s ease-in-out infinite;
  opacity: 0.6;
}

.particle-2 {
  width: 60px;
  height: 60px;
  bottom: 20%;
  right: 15%;
  animation: float 12s ease-in-out infinite;
  animation-delay: -2s;
  opacity: 0.5;
}

.particle-3 {
  width: 40px;
  height: 40px;
  top: 70%;
  left: 20%;
  animation: float 10s ease-in-out infinite;
  animation-delay: -4s;
  opacity: 0.4;
}

.particle-4 {
  width: 30px;
  height: 30px;
  top: 30%;
  right: 20%;
  animation: float 9s ease-in-out infinite;
  animation-delay: -6s;
  opacity: 0.3;
}

@keyframes float {
  0%, 100% { transform: translateY(0) translateX(0); }
  25% { transform: translateY(-15px) translateX(10px); }
  50% { transform: translateY(0) translateX(15px); }
  75% { transform: translateY(15px) translateX(5px); }
}
</style>