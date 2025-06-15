<template>
  <BackButton />
  <ScrollProgress :sections="SECTIONS"/>

  <!-- Section 1 -->
  <div id="section-1" class="intro-container">
    <div class="particle-container">
      <div v-for="n in 300" :key="n" class="particle"></div>
    </div>
    <div class="intro-content">
      <h1 ref="title" class="intro-title">The Discovery</h1>
      <p class="intro-description">
        A monumental mural blending African and European imagery to reimagine the "Age of Discovery," challenging colonial narratives through mythological and symbolic representation..
      </p>
    </div>

    <ScrollArrow textColor="text-purple-500" arrowColor="text-purple-500" />
   
  </div>

  <!-- Section 2 -->
  <div id="section-2" class="container">
    <div v-for="(event, index) in timelineEvents" :key="index" class="timeline-item panel">
      <div class="timeline-content">
        <div class="timeline-date">{{ event.date }}</div>
        <div class="timeline-description">{{ event.description }}</div>
        <div class="timeline-details">
          {{ event.details }}
        </div>
        <div class="timeline-fact">{{ event.fact }}</div>
      </div>
    </div>
  </div>

  <!-- Section 3 -->
  <div id="section-3" class="last-container">
    <div class="content gradient-yellow">
      <div class="info-wrapper">
        <div class="info-container">
          <div class="spindle-image-container left">
           
            <div class="image-overlay">
              <div class="overlay-content">
                <span>Circa 1200 AD</span>
              </div>
            </div>
          </div>

          <!-- here -->
          <div class="symbolic-element">
            <img src="./assets/TheDiscoveryPaintingImage.jpg" alt="Symbolic Element" />
          </div>

           
          <div class="spindle-image-container right">
         
            <div class="image-overlay">
              <div class="overlay-content">
                <span>Circa 1200 AD</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Section 4 -->
  <div id="section-4" class="image-transition-section">
    <div class="slide-view base-slide" data-index="1">
      <div class="background-layer" style="background-image: url('./assets/TheDiscoveryPaintingImage.jpg')"></div>
      <div class="sidebar-content">
        <div class="project-number">[01]</div>
        <h2 class="project-title">The Discovery</h2>
        <div class="project-tags">
          <!-- <span>CULTURAL SYMBOLISM</span>
          <span>FEMALE IDENTITY</span>
          <span>ARTISTIC EXPRESSION</span> -->
        </div>
        <p class="slide-description">A monumental triptych mural by South African artist Alexis Preller, originally commissioned for the Transvaal 
          Provincial Administration. Measuring over 13 meters in width, the painting portrays an imagined encounter between European explorers and 
          African civilizations during the so-called "Age of Discovery." Rather than glorify colonization, Preller's work blends African and 
          classical European symbolism to challenge colonial narratives. Rich in surrealist and mythological imagery, it presents Africa as 
          culturally advanced and spiritually significant, questioning Western assumptions of superiority..</p>
        <a class="view-project-link" href="https://javettup.art/artworks/discovery">VIEW DETAILS <span class="arrow">→</span></a>
      </div>
      <div class="image-frame-container">
        <img alt="Early Designs" src="./assets/TheDiscoveryPaintingImage.jpg">
        <div class="image-caption">South African 1959</div>
      </div>
    </div>

    <div class="wipe-container" data-index="2">
      <div class="slide-view" data-index="2">
        <div class="background-layer"></div>
        <div class="sidebar-content">
          <div class="project-number">[02]</div>
          <h2 class="project-title">Alexis Preller</h2>
          <div class="project-tags">
            <!-- <span>PRODUCTION PROCESS</span>
            <span>CRAFTING TECHNIQUES</span>
            <span>MATERIAL TRANSFORMATION</span> -->
          </div>
          <p class="slide-description">Pretoria-born artist Alexis Preller studied art in London at the Westminster School of Art and expanded 
            his knowledge of art and art history by reading voraciously and travelling widely in Europe and Africa. He studied Egyptian, 
            ancient Greek, Etruscan, early Renaissance and southern and central African art and culture, in particular, and created an art 
            that was of his own place and time rather than a continuation of either traditional European practice or avant-garde Modernism. He
             visited Ndebele settlements near Pretoria in the late 1940s and early 1950s, and the ‘Mapogga’ women in their distinctive 
             traditional costume and the colourful geometric wall paintings that decorated the homesteads appear in his work from this time. 
             His work became progressively more abstract in later years, informed by his interest in space travel and discovery, and his focus
              shifted from the local and the African to encompass the universal.</p>
          <a class="view-project-link" href="https://www.straussart.co.za/artists/alexis-preller">VIEW DETAILS <span class="arrow">→</span></a>
        </div>
        <div class="image-frame-container">
          <img alt="South African 1911-1975" src="./assets/alexis-preller.jpg">
          <div class="image-caption">South African 1911-1975</div>
        </div>
      </div>
    </div>

    <div class="scroll-progress">
      <div class="progress-track">
        <div class="progress-fill"></div>
      </div>
      <div class="progress-numbers">
        <span class="current">01</span>
        <span class="separator">/</span>
        <span class="total">02</span>
      </div>
    </div>
  </div>


  <!-- Section 5 -->
   <TheDiscoveryPageEnd @resetAnimations="resetAnimations" />
  <!-- <div id="section-5" class="min-h-screen flex items-center justify-center bg-cover bg-center bg-[#313550]" >
    <button @click="onClick" class="relative group w-[600px] h-[650px] rounded-xl bg-black/70 backdrop-blur-md shadow-2xl text-white flex flex-col items-center justify-center transition hover:scale-105 duration-300">
      
   
      <img src="../Cards/assets/BattleOfTorquayImage.png" alt="Artifact" class="w-48 h-auto mb-6 transition group-hover:scale-105 duration-300" />

      <div class="text-center">
        <h3 class="text-sm tracking-widest text-gray-300">NEXT ARTIFACT</h3>
        <h2 class="text-2xl font-semibold mt-1">Sidwane Tokozile</h2>
        <p class="text-sm mt-4 tracking-wide text-gray-400">CLICK TO EXPLORE</p>
      </div>
    </button>
  </div> -->

</template>

<script>
import { onMounted, ref } from "vue";
import { gsap } from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";
import BackButton from "../UniversalComponents/BackButton.vue";
import ScrollProgress from "../UniversalComponents/ScrollProgress.vue";
import TheDiscoveryPageEnd from "./components/TheDiscoveryPageEnd.vue";
import ScrollArrow from "../UniversalComponents/ScrollArrow.vue";

gsap.registerPlugin(ScrollTrigger);

export default {

  methods: {
    onClick() {
      this.$router.push('/battle-of-torquay');
    }
  },

  components: {ScrollProgress, BackButton, TheDiscoveryPageEnd, ScrollArrow},
  setup() {
    const SECTIONS = [
      { position: 0.00, name: 'Landing' },
      { position: 0.07, name: 'Timeline Start' },
      { position: 0.35, name: 'Background Info' },
      { position: 0.72, name: 'Image Showcase' },
      { position: 1, name: 'Page End' }
    ];
    const bg = ref(null);
    const title = ref(null);
    const timelineEvents = [
      {
        "date": "1959",
        "description": "Commission of The Discovery",
        "details": "The Transvaal Provincial Administration (TPA) commissions Alexis Preller to create a mural for their boardroom.",
        "fact": "The painting was originally titled 'The Discovery of the Sea Route Around Africa'."
      },
      {
        "date": "1959–1960",
        "description": "Creation of the Mural",
        "details": "Alexis Preller completes the painting over the span of about a year, working on three separate canvas panels.",
        "fact": "Due to the size constraints of available canvas, Preller painted the mural in three parts totaling approximately 207 x 1300 cm."
      },
      {
        "date": "1960",
        "description": "Installation at TPA",
        "details": "The mural is installed in the boardroom of the Transvaal Provincial Administration in Pretoria.",
        "fact": "The artwork symbolically depicts European and Eastern explorers encountering African civilizations."
      },
      {
        "date": "Post-1960s (exact date unknown)",
        "description": "Mural removed from TPA building",
        "details": "The mural is removed from the original site, eventually leading to its preservation and relocation.",
        "fact": "Preller intended the piece to represent the richness of the African continent through a Renaissance-inspired lens."
      },
      {
        "date": "Present day",
        "description": "Exhibited at Javett Art Centre",
        "details": "The mural is housed and exhibited at the Javett Art Centre at the University of Pretoria.",
        "fact": "It remains one of Alexis Preller's most significant and monumental works."
      }
    ];

    function scrollToSection(index) {
    const section = document.getElementById(`section-${index}`)
    if (section) {
      section.scrollIntoView({ behavior: 'smooth' })
    }
}

    function setupTimelineAnimations() {
      const container = document.querySelector('.container');
      const panels = gsap.utils.toArray('.panel');

      // We don't need to set initial states to hidden anymore
      // Instead, create animations that trigger when each panel enters the viewport

      // Create animations for timeline dates when panels come into view
      panels.forEach((panel, i) => {
        // Create a pulse animation for the date when it's in view
        gsap.fromTo(panel.querySelector('.timeline-date'),
          { scale: 0.95 },
          {
            scale: 1,
            ease: "power1.out",
            duration: 0.8,
            scrollTrigger: {
              trigger: panel,
              containerAnimation: ScrollTrigger.getById("horizontalScroll"),
              start: "left center",
              toggleActions: "play none none reverse"
            }
          }
        );

        // Animate the fact tag with a slight delay
        gsap.fromTo(panel.querySelector('.timeline-fact'),
          { opacity: 0, y: 20 },
          {
            opacity: 1,
            y: 0,
            duration: 0.6,
            delay: 0.3,
            scrollTrigger: {
              trigger: panel,
              containerAnimation: ScrollTrigger.getById("horizontalScroll"),
              start: "left center",
              toggleActions: "play none none reverse"
            }
          }
        );
      });
    }
    


    function setupParallaxEffect() {
      const parallaxContainer = document.querySelector('.parallax-container');
      if (!parallaxContainer) return;

      const topSpindles = document.querySelectorAll('.spindle-item.top');
      const bottomSpindles = document.querySelectorAll('.spindle-item.bottom');
      const impactVisualization = document.querySelector('.impact-visualization');
      const centralSpindle = document.querySelector('.central-spindle');

      gsap.set(topSpindles, { autoAlpha: 0, rotation: -180 });
      gsap.set(bottomSpindles, { autoAlpha: 0, rotation: 180 });
      gsap.set(impactVisualization, { autoAlpha: 0 });
      gsap.set(centralSpindle, { scale: 0, opacity: 0 });

      const masterTimeline = gsap.timeline({
        scrollTrigger: {
          trigger: parallaxContainer,
          start: "top 0%",
          end: "+=250%",
          scrub: true,
          pin: true,
          pinSpacing: true
        }
      });

      const alignmentTl = gsap.timeline();

      topSpindles.forEach((spindle, i) => {
        alignmentTl.to(spindle, {
          top: "50%",
          y: "-50%",
          autoAlpha: 1,
          rotation: 0,
          duration: 2,
          ease: "power2.out"
        }, i * 0.2);
      });

      bottomSpindles.forEach((spindle, i) => {
        alignmentTl.to(spindle, {
          bottom: "50%",
          y: "50%",
          autoAlpha: 1,
          rotation: 0,
          duration: 2,
          ease: "power2.out"
        }, i * 0.2);
      });

      const convergenceTl = gsap.timeline();

      convergenceTl
        .to([topSpindles, bottomSpindles], {
          left: "50%",
          x: "-50%",
          duration: 3,
          stagger: 0.05,
          ease: "power3.inOut"
        })

        .to([topSpindles, bottomSpindles], {
          rotation: 360,
          duration: 2,
          stagger: 0.05,
          ease: "power2.inOut"
        })
        .to([topSpindles, bottomSpindles], {
          scale: 0.3,
          duration: 1.5,
          stagger: 0.03,
          ease: "power2.in"
        })
        // Show impact visualization container
        .to(impactVisualization, {
          autoAlpha: 1,
          duration: 0.5
        })
        // Make the spindles fade away
        .to([topSpindles, bottomSpindles], {
          opacity: 0,
          scale: 0,
          duration: 1,
          stagger: 0.02
        })
        .to(centralSpindle, {
          scale: 1,
          opacity: 1,
          rotation: 360,
          duration: 1.5,
          ease: "back.out(2)"
        });

      // PART 3: Ripple effect - circles and cards appear
      const rippleTl = gsap.timeline();

      gsap.set(".ripple-circle", { scale: 0, opacity: 0 });

      rippleTl
        // Expand ripple circles in sequence
        .to(".ripple-circle[data-category='trade']", {
          scale: 1,
          opacity: 0.9, // Increased opacity for better visibility
          duration: 1,
          ease: "power2.out"
        })
        .to(".ripple-circle[data-category='technology']", {
          scale: 1,
          opacity: 0.9, // Increased opacity for better visibility
          duration: 1,
          ease: "power2.out"
        }, "-=0.7")
        .to(".ripple-circle[data-category='society']", {
          scale: 1,
          opacity: 0.9, // Increased opacity for better visibility
          duration: 1,
          ease: "power2.out"
        }, "-=0.7")
        .to(".ripple-circle[data-category='art']", {
          scale: 1,
          opacity: 0.9, // Increased opacity for better visibility
          duration: 1,
          ease: "power2.out"
        }, "-=0.7")
        // Reveal impact cards
        .to(".impact-card[data-category='trade']", {
          opacity: 1,
          scale: 1,
          duration: 0.8,
          ease: "back.out(1.5)"
        }, "-=0.4")
        .to(".impact-card[data-category='technology']", {
          opacity: 1,
          scale: 1,
          duration: 0.8,
          ease: "back.out(1.5)"
        }, "-=0.6")
        .to(".impact-card[data-category='society']", {
          opacity: 1,
          scale: 1,
          duration: 0.8,
          ease: "back.out(1.5)"
        }, "-=0.6")
        .to(".impact-card[data-category='art']", {
          opacity: 1,
          scale: 1,
          duration: 0.8,
          ease: "back.out(1.5)"
        }, "-=0.6")

      // Add all timelines to the master timeline
      masterTimeline
        .add(alignmentTl)
        .add(convergenceTl)
        .add(rippleTl);


      // Add subtle perpetual animation to the ripple circles
      ScrollTrigger.create({
        trigger: ".parallax-container",
        start: "top top",
        end: "bottom top",
        onEnter: () => {
          // Clear any existing animations on ripple circles first
          gsap.killTweensOf(".ripple-circle");

          // Create a consistent animation that's less likely to be interrupted
          gsap.to(".ripple-circle", {
            scale: 1.05, // Small scale change for subtle effect
            opacity: (i) => 0.7 + (i * 0.05), // Higher base opacity
            duration: 1.5,
            repeat: -1,
            yoyo: true,
            ease: "sine.inOut",
            stagger: 0.2,
            overwrite: true // Important: ensures this animation takes precedence
          });
        },
        onLeaveBack: () => {
          // Kill the animations when scrolling back up
          gsap.killTweensOf(".ripple-circle");
        }
      });

      // Replace your current glow effect ScrollTrigger with this new implementation
      // Add this right after your existing ripple circle animation ScrollTrigger

      // Store a variable to track whether we're currently executing the glow effect
      let glowEffectRunning = false;

      ScrollTrigger.create({
        trigger: ".impact-cards",
        start: "center 80%",
        end: "bottom top",
        // Remove once: true to allow re-triggering
        onEnter: () => {
          if (!glowEffectRunning) {
            glowEffectRunning = true;
            console.log("Starting glow effect");

            // Delay slightly to ensure cards are fully visible
            setTimeout(() => {
              triggerGlowSequence();
            }, 3000);
          }
        },
        onLeaveBack: () => {
          // Reset the flag when scrolling back up past the end point
          glowEffectRunning = false;
        },
        onEnterBack: () => {
          // Also trigger when scrolling back down into view
          if (!glowEffectRunning) {
            glowEffectRunning = true;
            console.log("Re-entering section, starting glow effect");

            setTimeout(() => {
              triggerGlowSequence();
            }, 1000);
          }
        }
      });

      // Create a separate function for the glow sequence
      function triggerGlowSequence() {
        const glowTl = gsap.timeline({
          onComplete: () => {
            // Reset after the sequence completes
            setTimeout(() => {
              glowEffectRunning = false;
            }, 1000);
          }
        });

        // Add the glow effect for each card sequentially
        glowTl.call(() => {
          const tradeCard = document.querySelector('.impact-card[data-category="trade"]');
          tradeCard.classList.add('glow-effect');
          setTimeout(() => tradeCard.classList.remove('glow-effect'), 1200);
        })
          .call(() => {
            const techCard = document.querySelector('.impact-card[data-category="technology"]');
            techCard.classList.add('glow-effect');
            setTimeout(() => techCard.classList.remove('glow-effect'), 1200);
          }, [], "+=1.5") // Wait 1.5s after previous glow
          .call(() => {
            const societyCard = document.querySelector('.impact-card[data-category="society"]');
            societyCard.classList.add('glow-effect');
            setTimeout(() => societyCard.classList.remove('glow-effect'), 1200);
          }, [], "+=1.5")
          .call(() => {
            const artCard = document.querySelector('.impact-card[data-category="art"]');
            artCard.classList.add('glow-effect');
            setTimeout(() => artCard.classList.remove('glow-effect'), 1200);
          }, [], "+=1.5");
      }
    }

    onMounted(() => {
      const sections = gsap.utils.toArray(".panel");
      const timeline = gsap.timeline();

      timeline.fromTo(
        title.value,
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
          ease: "power2.out",
          textShadow: "0px 0px 60px rgba(255, 215, 0, 0.9), 0px 0px 20px rgba(255, 165, 0, 0.5)",
          color: "#FFD700",
        }
      );

      timeline.fromTo(
        ".intro-description",
        {
          opacity: 0,
          y: 30, // Start slightly below
        },
        {
          opacity: 1,
          y: 0, // Move to its final position
          duration: 1.2,
          ease: "power2.out", // Smooth easing
          color: "#fff",
        },
        "-=1" // Overlap with the title animation
      );

      // Horizontal scrolling logic
      gsap.to(sections, {
        xPercent: -100 * (sections.length - 1),
        ease: "none",
        scrollTrigger: {
          trigger: ".container",
          pin: true,
          scrub: 1,
          snap: 1 / (sections.length - 1),
          end: () => "+=" + document.querySelector(".container").offsetWidth,
        },
      });

      setupTimelineAnimations();

      const particles = document.querySelectorAll(".particle");
      particles.forEach((particle) => {
        const container = document.querySelector(".particle-container");
        const bounds = container.getBoundingClientRect();

        const posX = Math.random() * bounds.width;
        const posY = Math.random() * bounds.height;

        const size = 2 + Math.random() * 4;
        const blinkDuration = 1 + Math.random(); // 1 to 2 seconds
        const blinkDelay = Math.random() * 3;

        gsap.set(particle, {
          x: posX,
          y: posY,
          scale: size / 6,
          opacity: 0.2 + Math.random() * 0.6,
        });

        gsap.to(particle, {
          opacity: "+=0.3",
          duration: blinkDuration,
          delay: blinkDelay,
          yoyo: true,
          repeat: -1,
          ease: "sine.inOut",
        });

        gsap.to(particle, {
          y: `-=${50 + Math.random() * 100}`,
          x: `+=${Math.random() * 20 - 10}`,
          duration: 10 + Math.random() * 10,
          repeat: -1,
          yoyo: true,
          ease: "sine.inOut",
        });
      });

      gsap.registerPlugin(ScrollTrigger);

      gsap.timeline({
        scrollTrigger: {
          trigger: ".last-container",
          start: "top top",
          end: "+=100%",
          pin: true,
          scrub: true,
        },
      })
        .to(".content", {
          clipPath: "polygon(0% 45%, 100% 45%, 100% 55%, 0% 55%)",
          duration: 1,
        })
        .to(".content", {
          clipPath: "polygon(0% 0%, 100% 0%, 100% 100%, 0% 100%)",
          duration: 1,
        });

      const infoTimeline = gsap.timeline({
        scrollTrigger: {
          trigger: ".last-container",
          start: "top top",
          toggleActions: "restart none none reset"
        }
      });

      infoTimeline
        .to(".info-wrapper", {
          opacity: 1,
          duration: 0.8,
          delay: 0.5,
          ease: "power2.out"
        })
        .from(".spindle-image-container.left", {
          x: -80,
          opacity: 0,
          duration: 0.8,
          ease: "back.out(1.7)"
        }, "-=0.3")
        .from(".spindle-image-container.right", {
          x: 80,
          opacity: 0,
          duration: 0.8,
          ease: "back.out(1.7)"
        }, "-=0.6")
        .from(".section-title", {
          y: 30,
          opacity: 0,
          duration: 0.6,
          ease: "power2.out"
        }, "-=0.4")
        .from(".divider", {
          width: 0,
          duration: 0.6,
          ease: "power1.out"
        }, "-=0.2")
        .from(".main-description", {
          y: 20,
          opacity: 0,
          duration: 0.6,
          ease: "power2.out"
        }, "-=0.3")
        .from(".feature-list li", {
          x: -20,
          opacity: 0,
          stagger: 0.1,
          duration: 0.4,
          ease: "power1.out"
        }, "-=0.2");

      gsap.from(".spindle-image-container", {
        y: 20,
        scrollTrigger: {
          trigger: ".last-container",
          start: "top bottom",
          end: "bottom top",
          scrub: 1
        }
      });

      ScrollTrigger.create({
        trigger: ".last-container",
        start: "top 80%",
        end: "bottom top",
        onEnter: resetAnimation

      });

      function resetAnimation() {
        // Reset info wrapper opacity
        gsap.set(".info-wrapper", { opacity: 0 });

        // Reset all animated elements to their starting positions
        gsap.set(".spindle-image-container", { x: -100, opacity: 0 });
        gsap.set(".section-title", { y: 30, opacity: 0 });
        gsap.set(".divider", { width: 0 });
        gsap.set(".main-description", { y: 20, opacity: 0 });
        gsap.set(".feature-list li", { x: -20, opacity: 0 });
      }

      setupParallaxEffect();

      function setupImageTransitionSection() {
        const section = document.querySelector('.image-transition-section');
        const wipeContainers = gsap.utils.toArray('.wipe-container');
        const progressFill = document.querySelector('.progress-fill');
        const currentNumberEl = document.querySelector('.progress-numbers .current');
        const baseSlide = section.querySelector('.base-slide');


        // Create the timeline for full-screen wipe effect
        const revealTl = gsap.timeline({
          scrollTrigger: {
            trigger: section,
            start: "top top",
            end: "+=300%",
            pin: true,
            scrub: 1,
            onUpdate: self => {
              // Update progress bar
              progressFill.style.width = `${self.progress * 100}%`;

              // Update the current slide number
              const slideCount = wipeContainers.length + 1; // +1 for base slide
              let currentIndex;
              if (self.progress > 0.98) {
                currentIndex = slideCount; // Show 4 at the very end
              } else {
                currentIndex = Math.min(Math.floor(self.progress * (slideCount - 1) + 1), slideCount);
              }

              currentNumberEl.textContent = currentIndex.toString().padStart(2, '0');

            }
          }
        });

        // Hide all wipe containers' content initially except for active
        wipeContainers.forEach((wipe) => {
          gsap.set(wipe.querySelector('.sidebar-content'), { opacity: 0 });
          gsap.set(wipe.querySelector('.image-frame-container'), { opacity: 0 });
        });

        // Animate each wipe container from bottom to top
        wipeContainers.forEach((wipe, i) => {
          // Each wipe takes an equal portion of the scroll
          const startPosition = i / wipeContainers.length;
          const endPosition = (i + 1) / wipeContainers.length;

          // Animate the clip-path to reveal content from bottom to top
          revealTl.fromTo(wipe,
            { clipPath: "polygon(0% 100%, 100% 100%, 100% 100%, 0% 100%)" },
            {
              clipPath: "polygon(0% 0%, 100% 0%, 100% 100%, 0% 100%)",
              ease: "none",
              duration: 1 / wipeContainers.length,
              onStart: () => {
                // Fade in current slide content
                gsap.to(wipe.querySelector('.sidebar-content'), { opacity: 1, duration: 0.5, delay: 0.2 });
                gsap.to(wipe.querySelector('.image-frame-container'), { opacity: 1, duration: 0.5, delay: 0.2 });
              },
              onReverseComplete: () => {
                // Fade out when reversing
                gsap.to(wipe.querySelector('.sidebar-content'), { opacity: 0, duration: 0.3 });
                gsap.to(wipe.querySelector('.image-frame-container'), { opacity: 0, duration: 0.3 });
              }
            },
            startPosition
          );
        });

        return revealTl;
      }

      // Call the setup function
      setupImageTransitionSection();

      const el = document.querySelector('.symbolic-element');
      gsap.to('.symbolic-element', {
        scrollTrigger: {
          trigger: '.symbolic-element',
          start: 'top 60%', // start when element enters viewport
          toggleActions: 'play reverse play reverse',
        },
      scale: 1.05,
      repeat: 0,
      yoyo: true,
      ease: 'sine.inOut',
      duration: 1.5,
      boxShadow: '0px 0px 20px 5px rgba(118, 99, 255, 0.9)',
    });

    });

    return { title, timelineEvents , SECTIONS};
  },
};

</script>

<style scoped>



html,
body {
  overflow-x: hidden;
  margin: 0;
  height: 100%;
  width: 100%;
}

.intro-container {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 100vh;
  width: 100vw;
  background: linear-gradient(to bottom, #313550, #ffffff);
  color: white;
  text-align: center;
  overflow: hidden;
}

.intro-title {
  font-size: 3rem;
  font-weight: bold;
  color: #4e83ff;
  text-shadow: 0px 0px 20px rgba(255, 255, 255, 0.7);
  /* Gold color for the title */
  margin-bottom: 1rem;
  text-transform: uppercase;
  letter-spacing: 0.1rem;
  text-shadow: 0px 0px 20px rgba(255, 255, 255, 0.7);
}

/* Subtitle Styling */
.intro-description {
  font-size: 1.5rem;
  line-height: 1.8;
  color: #3c63c0;
  max-width: 800px;
  margin: 0 auto;
  opacity: 0;
  transition: color 0.3s ease;
}

.intro-description:hover {
  color: #4e83ff;
  /* Gold color on hover */
}

/* Scroll Indicator */
.scroll-indicator {
  position: absolute;
  bottom: 2rem;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.5rem;
}

.scroll-text {

  color: #3c63c0;
 
}

/* Arrow Animation */
.arrow-container {
  width: 2rem;
  height: 2rem;
  display: flex;
  justify-content: center;
  align-items: center;
  position: relative;
}

.arrow {
  width: 1rem;
  height: 1rem;
  border-left: 2px solid #4e83ff;
  border-bottom: 2px solid #4e83ff;
  transform: rotate(-45deg);
  animation: bounce 1.5s infinite;
}

/* Arrow Bounce Animation */
@keyframes bounce {

  0%,
  20%,
  50%,
  80%,
  100% {
    transform: translateY(0) rotate(-45deg);
  }

  40% {
    transform: translateY(10px) rotate(-45deg);
  }

  60% {
    transform: translateY(5px) rotate(-45deg);
  }
}

.container {
  width: 500%;
  /* Adjust based on the number of timeline items */
  height: 100vh;
  display: flex;
  flex-wrap: nowrap;
}

.timeline-item {
  min-width: 100vw;
  height: 100vh;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  background: linear-gradient(145deg, #2d1e0f, #111);
  color: white;
  text-align: center;
  position: relative;
  overflow: hidden;
  padding: 2rem;
}

.timeline-item::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  /* background-image: url('./assets/TheSwan.png'); */
  background-size: 300px;
  background-position: center;
  opacity: 0.05;
  filter: blur(2px);
  z-index: 1;
  transform: rotate(-5deg) scale(1.2);
}

.timeline-item:nth-child(odd) {
  background: linear-gradient(135deg, #313550 40%, #1a130a);
}

.timeline-item:nth-child(even) {
  background: linear-gradient(135deg, #111 40%, #1e1e1e);
}

.timeline-content {
  position: relative;
  z-index: 2;
  max-width: 800px;
  border-left: 3px solid #d4d5ff;
  padding-left: 2rem;
  transform: translateY(0);
  opacity: 1;
}

.panel.active .timeline-content {
  transform: translateY(0);
  opacity: 1;
}

.timeline-date {
  font-size: 3.2rem;
  font-weight: bold;
  color: #ffffff;
  margin-bottom: 1.5rem;
  position: relative;
  text-shadow: 0 0 15px rgba(117, 83, 252, 0.5);
  display: inline-block;
}

.timeline-date::after {
  content: '';
  position: absolute;
  bottom: -10px;
  left: 0;
  width: 60px;
  height: 3px;
  background: #4e83ff;
  box-shadow: 0 0 10px rgba(96, 130, 255, 0.7);
}

.timeline-description {
  font-size: 1.4rem;
  line-height: 1.6;
  color: white;
  margin-bottom: 1.5rem;
  max-width: 80%;
  margin-left: auto;
  margin-right: auto;
}

.timeline-details {
  color: #ccc;
  font-size: 1.1rem;
  line-height: 1.5;
  margin-top: 1.5rem;
  padding: 0 1rem;
}

.timeline-fact {
  display: inline-block;
  background: rgba(89, 96, 193, 0.7);
  border: 1px solid rgba(96, 130, 255, 0.7);
  padding: 0.5rem 1rem;
  border-radius: 4px;
  font-size: 0.9rem;
  margin-top: 1.5rem;
  /* Start visible but with small offset */
  transform: translateY(10px);
  opacity: 0.7;
  transition: transform 0.4s ease, opacity 0.4s ease;
}

.timeline-item:hover .timeline-fact {
  transform: translateY(0);
  opacity: 1;
}

/* Add this to create a highlight effect when hovering over timeline items */
.timeline-item:hover .timeline-date {
  color: #fff;
  text-shadow: 0 0 20px rgba(118, 99, 255, 0.9);
}

.panel.active .timeline-fact {
  transform: translateY(0);
  opacity: 1;
}

.timeline-icon {
  font-size: 2rem;
  color: #4e83ff;
  margin-bottom: 1rem;
  display: block;
}

.last-container {
  position: relative;
  width: 100%;
  height: 100vh;
  background-color: #201a25;
  display: flex;
  justify-content: center;
  align-items: center;
  overflow: hidden;
  color: white;
  text-align: center;
}

.content {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: linear-gradient(to bottom, #313550, #111);
  clip-path: polygon(50% 50%, 50% 50%, 50% 50%, 50% 50%);
  z-index: 1;
}

.info-wrapper {
  position: relative;
  z-index: 2;
  width: 100%;
  max-width: 1200px;
  opacity: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
  margin: 0 auto;
}

.info-container {
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: space-between;
  gap: 2rem;
  padding: 0 2rem;
  text-align: center;
  width: 100%;
  max-width: 1400px;
  margin: 0 auto;
}

.spindle-image-container {
  position: relative;
  width: 25%;
  max-width: 250px;
  flex-shrink: 0;
  overflow: hidden;
  box-shadow: none;
  background: transparent;
  border-radius: 0;
}

.spindle-image-container.left {
  transform: perspective(1000px) rotateY(5deg);
}

.spindle-image-container.right {
  transform: perspective(1000px) rotateY(-5deg);
}

.spindle-image-container:hover {
  transform: perspective(1000px) rotateY(0);
}


.spindle-image {
  width: 100%;
  height: 100%;
  object-fit: contain;
  border-radius: 0;
  transition: transform 0.5s ease;
  filter: drop-shadow(0 8px 20px rgba(0, 0, 0, 0.3));
}

.image-overlay {
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 30%;
  background: linear-gradient(to top, rgba(0, 0, 0, 0.8), transparent);
  display: flex;
  align-items: flex-end;
  padding: 1rem;
  opacity: 0;
  transition: opacity 0.3s ease;
}

.overlay-content {
  color: white;
  font-size: 0.9rem;
  font-weight: 500;
  letter-spacing: 1px;
}

/* Text styling */

.section-title {
  font-size: 3rem;
  font-weight: 700;
  margin-bottom: 1rem;
  color: white;
}

.highlight {
  color: white;
  position: relative;
  display: inline-block;
}

.highlight::after {
  content: '';
  position: absolute;
  bottom: -5px;
  left: 0;
  width: 100%;
  height: 3px;
  background: #4e83ff;
  /* Yellow underline */
  transform: scaleX(1);
  /* Start with the underline visible */
  transform-origin: left;
  transition: transform 0.5s ease;
}

@keyframes underlinePulse {
  0% {
    opacity: 0.6;
    box-shadow: 0 0 5px rgba(255, 239, 0, 0.5);
  }

  50% {
    opacity: 1;
    box-shadow: 0 0 12px rgba(255, 239, 0, 0.8);
  }

  100% {
    opacity: 0.6;
    box-shadow: 0 0 5px rgba(255, 239, 0, 0.5);
  }
}


.highlight::after {
  animation: underlinePulse 2s infinite;
}

.highlight {
  color: #4e83ff;
  /* Match the underline color for consistency */
}

/* Remove the hover effect since we want the underline always visible */
.info-text:hover .highlight::after {
  transform: scaleX(1);
  /* Always show full underline */
}

.info-text {
  flex: 1;
  text-align: left;
  max-width: 600px;
  position: relative;
  padding: 30px;
  border-radius: 8px;
  backdrop-filter: blur(5px);
  background: rgba(29, 19, 9, 0.7);
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3),
    inset 0 0 20px rgba(255, 215, 0, 0.05);
  border-left: 3px solid #4e83ff;
  margin: 0 auto;
}

@media (max-width: 1200px) {
  .info-container {
    flex-wrap: wrap;
    justify-content: center;
    gap: 1rem;
  }

  .spindle-image-container {
    width: 20%;
    min-width: 150px;
  }

  .info-text {
    order: 0;
    /* Keep text in middle position */
    width: 100%;
    margin: 0 auto 1rem auto;
  }

  .spindle-image-container.left {
    order: -1;
    /* Move left image first */
  }

  .spindle-image-container.right {
    order: 1;
    /* Move right image last */
  }
}

@media (max-width: 768px) {
  .spindle-image-container.right {
    display: none;
    /* Hide right image on mobile */
  }

  .spindle-image-container.left {
    width: 40%;
    max-width: 180px;
    margin: 0 auto 1rem auto;
  }

  .info-container {
    flex-direction: column;
  }
}

.section-title {
  font-size: 3rem;
  font-weight: 700;
  margin-bottom: 0.5rem;
  color: white;
  letter-spacing: 1px;
}

.highlight {
  color: #4e83ff;
  position: relative;
  display: inline-block;
  text-shadow: 0 0 15px rgba(118, 99, 255, 0.9);
  transition: text-shadow 0.3s ease;
}

.highlight::after {
  content: '';
  position: absolute;
  bottom: -5px;
  left: 0;
  width: 100%;
  height: 3px;
  background: #4e83ff;
  transform: scaleX(1);
  transform-origin: left;
  transition: transform 0.5s ease;
}

.divider {
  width: 80px;
  height: 3px;
  background: #4e83ff;
  margin: 1.5rem 0;
  position: relative;
  overflow: hidden;
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

  0%,
  100% {
    left: -100%;
  }

  50% {
    left: 100%;
  }
}

.main-description {
  font-size: 1.2rem;
  line-height: 1.8;
  color: rgba(255, 255, 255, 0.9);
  margin-bottom: 2rem;
}

.info-text:hover .highlight::after {
  transform: scaleX(1);
  transform-origin: left;
}

.feature-list {
  list-style-type: none;
  padding: 0;
  margin: 2rem 0;
  display: flex;
  flex-direction: column;
  gap: 1.2rem;
}

.feature-list li {
  display: flex;
  align-items: flex-start;
  margin-bottom: 0.5rem;
  font-size: 1.1rem;
  transition: transform 0.3s ease;
}

.feature-list li:hover {
  transform: translateX(5px);
}

.feature-icon {
  display: inline-block;
  color: #4e83ff;
  margin-right: 15px;
  font-size: 1.2rem;
}

.feature-text {
  color: rgba(255, 255, 255, 0.9);
  line-height: 1.5;
}

.feature-text strong {
  color: white;
  font-weight: 600;
}

.fun-fact {
  margin-top: 2rem;
  padding: 1rem;
  background: rgba(98, 96, 119, 0.1);
  border-radius: 8px;
  position: relative;
  border-left: 3px solid #4e83ff;
}

.fact-label {
  position: absolute;
  top: -10px;
  left: 15px;
  background: #4e83ff;
  color: #313550;
  font-size: 0.7rem;
  font-weight: 700;
  padding: 4px 10px;
  border-radius: 4px;
  letter-spacing: 1px;
}

.fun-fact p {
  color: white;
  font-size: 1rem;
  line-height: 1.6;
  margin: 0;
  margin-top: 10px;
}

/* Media queries for responsive design */
@media (max-width: 768px) {
  .info-container {
    gap: 1.5rem;
    padding: 2rem;
  }

  .spindle-image-container {
    width: 70%;
    max-width: 250px;
    margin: 0 auto;
  }
}


h2 {
  position: relative;
  z-index: 2;
  /* Ensure the text is above the split effect */
  color: black;
  font-size: 2rem;
}

.particle {
  position: absolute;
  width: 6px;
  height: 6px;
  background: rgba(255, 255, 200, 0.8);
  border-radius: 50%;
  filter: blur(1px);
  z-index: 6;
}

@keyframes floatUp {
  to {
    transform: translateY(-200px);
    opacity: 0;
  }
}

/* Parallax Section */
.parallax-container {
  position: relative;
  height: 100vh;
  width: 100%;
  overflow: hidden;
  background: linear-gradient(to bottom, #111, #313550);
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  margin-top: -1px;
  /* Eliminate any gap caused by rounding */
  z-index: 10;
}

.spindle-track {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  z-index: 1;
  /* Make sure this is above background but below content */
}

.spindle-item {
  position: absolute;
  width: 150px;
  height: 150px;
  transform: translateX(-50%);
  /* Center horizontally */
  transition: all 0.5s ease;
}

/* Ripple Effect Section */
.impact-visualization {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  opacity: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 20;
  pointer-events: none;
}

.central-spindle {
  position: absolute;
  width: 200px;
  height: 200px;
  z-index: 25;
  filter: drop-shadow(0 0 20px rgba(118, 99, 255, 0.9));
  transform: scale(0.8);
  opacity: 0;
}

.central-spindle img {
  width: 100%;
  height: 100%;
  object-fit: contain;
}

.ripple-circles {
  position: absolute;
  width: 100%;
  height: 100%;
  z-index: 22;
}

/* Responsive adjustments for smaller screens */
@media (max-width: 768px) {
  .ripple-circle[data-category="trade"] {
    width: 200px;
    height: 200px;
  }

  .ripple-circle[data-category="technology"] {
    width: 320px;
    height: 320px;
  }

  .ripple-circle[data-category="society"] {
    width: 440px;
    height: 440px;
  }

  .ripple-circle[data-category="art"] {
    width: 560px;
    height: 560px;
  }

  .impact-card {
    width: 200px;
  }

  .impact-card[data-category="trade"] {
    top: calc(50% - 120px);
    left: calc(50% + 120px);
  }

  .impact-card[data-category="technology"] {
    top: calc(50% + 80px);
    left: calc(50% + 180px);
  }

  .impact-card[data-category="society"] {
    top: calc(50% - 200px);
    left: calc(50% - 240px);
  }

  .impact-card[data-category="art"] {
    top: calc(50% + 150px);
    left: calc(50% - 220px);
  }
}

.scroll-hint {
  position: absolute;
  bottom: 30px;
  left: 50%;
  transform: translateX(-50%);
  text-align: center;
  opacity: 0;
  animation: fadeInOut 3s infinite;
  z-index: 15;
}

.scroll-hint p {
  color: #4e83ff;
  font-size: 0.9rem;
  text-transform: uppercase;
  letter-spacing: 2px;
  margin-bottom: 5px;
}

.scroll-arrow {
  width: 15px;
  height: 15px;
  border-right: 2px solid #4e83ff;
  border-bottom: 2px solid #4e83ff;
  transform: rotate(45deg);
  margin: 0 auto;
}

@keyframes fadeInOut {

  0%,
  100% {
    opacity: 0.3;
  }

  50% {
    opacity: 1;
  }
}

/* Add sequential glow effect for cards */
@keyframes cardGlow {
  0% {
    box-shadow: 0 0 5px rgba(255, 215, 0, 0.3);
  }

  50% {
    box-shadow: 0 0 25px rgba(255, 215, 0, 0.8);
  }

  100% {
    box-shadow: 0 0 5px rgba(255, 215, 0, 0.3);
  }
}

.glow-effect {
  animation: cardGlow 1s ease-in-out;
  transform: scale(1.05);
}

/* Make sure this doesn't conflict with the hover effect */
.impact-card.glow-effect:hover {
  transform: scale(1.05);
  box-shadow: 0 0 25px rgba(118, 99, 255, 0.9);
}

.project-number {
  font-size: 1rem;
  color: #888;
  margin-bottom: 0.8rem;
  font-family: monospace;
  margin-top: -40px;
}

.project-title {
  font-size: 3.2rem;
  color: #4e83ff;
  margin-bottom: 1.8rem;
  line-height: 1.1;
}

.project-tags {
  display: flex;
  flex-direction: column;
  margin-bottom: 2.5rem;
}

.project-tags span {
  font-size: 0.8rem;
  color: #bbb;
  margin-bottom: 0.5rem;
  letter-spacing: 0.05rem;
}

.view-project-link {
  display: inline-block;
  color: white;
  text-decoration: none;
  font-size: 0.9rem;
  letter-spacing: 0.1rem;
  padding-bottom: 0.5rem;
  border-bottom: 1px solid #4e83ff;
  transition: all 0.3s ease;
}

.view-project-link:hover {
  color: #4e83ff;
}

.view-project-link .arrow {
  display: inline-block;
  transition: transform 0.3s ease;
}

.view-project-link:hover .arrow {
  transform: translateX(5px);
}

.image-frame {
  width: 100%;
  height: 100%;
  position: relative;
}

.image-item {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  opacity: 0;
  visibility: hidden;
  transition: opacity 0.8s ease, visibility 0.8s ease;
}

.image-item.active {
  opacity: 1;
  visibility: visible;
}

.image-item img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.image-caption {
  position: absolute;
  bottom: 1.5rem;
  left: 1.5rem;
  color: white;
  font-size: 1.2rem;
  font-weight: 300;
  background-color: rgba(0, 0, 0, 0.5);
  padding: 0.5rem 1rem;
  border-radius: 4px;
  backdrop-filter: blur(5px);
}

.progress-track {
  width: 150px;
  height: 2px;
  background-color: rgba(255, 255, 255, 0.3);
  margin-right: 1rem;
  overflow: hidden;
}

.progress-fill {
  height: 100%;
  width: 0%;
  background-color: #4e83ff;
  transition: width 0.3s ease;
}

.progress-numbers {
  font-family: monospace;
  color: white;
  font-size: 0.9rem;
}

.current {
  color: #4e83ff;
}

.separator {
  margin: 0 0.3rem;
}

.slide-content {
  position: absolute;
  opacity: 0;
  visibility: hidden;
  transform: translateY(20px);
  transition: opacity 0.8s ease, transform 0.8s ease, visibility 0.8s;
  width: 100%;
}

.slide-content.active {
  opacity: 1;
  visibility: visible;
  transform: translateY(0);
}

.slide-description {
  font-size: 1.1rem;
  line-height: 1.5;
  color: #ccc;
  margin-bottom: 1.5rem;
}

/* Enhance the transitions to be smoother */
.project-title {
  transition: opacity 0.5s ease-out, transform 0.5s ease-out;
  transform: translateY(0);
}

.project-tags span {
  display: inline-block;
  padding: 3px 0;
  transition: opacity 0.5s ease-out, transform 0.5s ease-out;
  transform: translateY(0);
}

.img-mask {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  overflow: hidden;
}

.base-image {
  z-index: 1;
}

/* Ensure images cover the entire container */
.img-mask img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  display: block;
}

/* Ensure captions stay within their masks */
.image-caption {
  position: absolute;
  bottom: 1.5rem;
  left: 1.5rem;
  color: white;
  font-size: 1.2rem;
  font-weight: 300;
  background-color: rgba(0, 0, 0, 0.5);
  padding: 0.5rem 1rem;
  border-radius: 4px;
  backdrop-filter: blur(5px);
  z-index: 5;
}

/* Full-screen wipe effect styling */
.image-transition-section {
  position: relative;
  height: 100vh;
  width: 100%;
  background-color: #111;
  overflow: hidden;
}

/* Each slide contains a full view */
.slide-view {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  z-index: 1;
  background-color: #111;
}


/* Base slide is always visible at the bottom */
.base-slide {
  z-index: 1;
  transition: opacity 0.3s ease, visibility 0.3s ease;
}

/* Wipe containers cover the entire screen */
.wipe-container {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  /* Start from bottom (fully hidden) */
  clip-path: polygon(0% 100%, 100% 100%, 100% 100%, 0% 100%);
  z-index: 10;
  background-color: #111;
}

.wipe-container[data-index="2"] {
  z-index: 10;
}

.wipe-container[data-index="3"] {
  z-index: 11;
}

.wipe-container[data-index="4"] {
  z-index: 12;
}

/* Create a visible wipe line with glow effect */
.wipe-container::after {
  content: '';
  position: absolute;
  left: 0;
  right: 0;
  height: 2px;
  background: rgba(118, 99, 255, 0.9);
  top: 0;
  box-shadow: 0 0 15px rgba(118, 99, 255, 0.9);
  z-index: 100;
}

/* Background styling */
.background-layer {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-position: center;
  background-size: cover;
  opacity: 0.2;
}

/* Sidebar content styling */
.sidebar-content {
  position: absolute;
  left: 5%;
  top: 50%;
  transform: translateY(-50%);
  color: white;
  z-index: 10;
  width: 35%;
}

/* Image frame styling */
.image-frame-container {
  position: absolute;
  width: 50%;
  height: 60vh;
  right: 5%;
  overflow: hidden;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
  border-radius: 2px;
  z-index: 5;
}

.image-frame-container img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

/* Progress indicator at the bottom right */
.scroll-progress {
  position: absolute;
  bottom: 1.5rem;
  right: 1.5rem;
  display: flex;
  align-items: center;
  z-index: 101;
  /* Above all wipe effects */
}


.location-text {
  position: relative;
  padding-left: 20px;
}

.location-text::before {
  content: "📍";
  position: absolute;
  left: 0;
  color: #4e83ff;
}

.artifact-id {
  position: relative;
  padding-left: 20px;
}

.artifact-id::before {
  content: "🏺";
  position: absolute;
  left: 0;
  color: #4e83ff;
}

.period-text {
  position: relative;
  padding-left: 20px;
}

.period-text::before {
  content: "📅";
  position: absolute;
  left: 0;
  color: #4e83ff;
}

/* Enhance the main description to highlight the dating information */
.main-description strong {
  color: #4e83ff;
  font-weight: 600;
}

.symbolic-element {
  width: 120px;
  height: 120px;
  margin: 50px auto;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
  opacity: 0.9;
  transform: scale(7);
}

.symbolic-element img {
  max-width: 100%;
  border-radius: 50%;
}

h1 {
  text-shadow: 0 2px 8px rgba(118, 99, 255, 0.9) !important;
  color: #ffffff !important;
  /* font-weight: 200 !important; */
}

</style>