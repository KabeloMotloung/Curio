<template>
  <BackButton />
  <ScrollProgress :totalSections="4" />
  <div class="intro-container">
    <div class="particle-container">
      <div v-for="n in 300" :key="n" class="particle"></div>
    </div>
    <div class="intro-content">
      <h1 ref="title" class="intro-title">The Spindle Whorl of Mapungubwe</h1>
      <p class="intro-description">
        Discover the rich history and craftsmanship of the ancient kingdom of Mapungubwe through this remarkable
        artifact.
      </p>
    </div>

    <div class="scroll-indicator">
      <p class="scroll-text">Scroll to explore</p>
      <div class="arrow-container">
        <div class="arrow"></div>
      </div>
    </div>
  </div>

  <div class="container">
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

  <div class="last-container">
    <div class="content gradient-yellow">
      <div class="info-wrapper">
        <div class="info-container">
          <div class="spindle-image-container left">
            <img alt="Spindle Whorl" class="spindle-image" src="./assets/spindle-og.png" />
            <div class="image-overlay">
              <div class="overlay-content">
                <span>Circa 1200 AD</span>
              </div>
            </div>
          </div>

          <div class="info-text">
            <h2 class="section-title"><span class="highlight">The Spindle Whorl</span></h2>
            <p class="main-description">
              The spindle whorl was a vital tool in ancient Mapungubwe, used for spinning fibers into thread. It
              highlights the advanced craftsmanship and trade practices of the time, symbolizing the ingenuity of the
              Mapungubwe people.
            </p>
            <ul class="feature-list">
              <li>
                <span class="feature-icon">✦</span>
                <span class="feature-text"><strong>Technical Innovation:</strong> Designs evolved to optimize thread
                  quality with perfect weight distribution and balance</span>
              </li>
            </ul>
            <div class="fun-fact">
              <span class="fact-label">ARCHAEOLOGICAL INSIGHT</span>
              <p>Chemical analysis of residue found on spindle whorls from Mapungubwe has identified traces of
                indigenous cotton, baobab fiber, and even wild silk, suggesting a sophisticated understanding of
                different fiber properties.</p>
            </div>
            <div class="museum-info">
              <span class="museum-label">EXHIBITION DETAILS</span>
              <div class="museum-content">
                <p class="location-text"><strong>Location:</strong> Mapungubwe Ceramics Gallery, Old Arts
                  2-5</p>
                <p class="artifact-id"><strong>Artist/Collection:</strong> Archaeological ceramic, Mapungubwe Collection
                </p>
                <p class="period-text"><strong>Dating:</strong> 1200 - 1290 AD (Radiocarbon dated)</p>
              </div>
            </div>
          </div>

          <div class="spindle-image-container right">
            <img alt="Spindle Whorl" class="spindle-image" src="./assets/spindle-og.png" />
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

  <div class="image-transition-section">
    <div class="slide-view base-slide" data-index="1">
      <div class="background-layer" style="background-image: url('./assets/decorated.png')"></div>
      <div class="sidebar-content">
        <div class="project-number">[01]</div>
        <h2 class="project-title">Decorated Spindle Whorls</h2>
        <div class="project-tags">
          <span>CULTURAL SYMBOLISM</span>
          <span>FEMALE IDENTITY</span>
          <span>ARTISTIC EXPRESSION</span>
        </div>
        <p class="slide-description">Beyond their practical function, decorated spindle whorls carried symbolic
          significance tied to female identity and status. The careful selection of materials and decorative patterns
          featuring parallel lines and triangular motifs created visually dynamic effects during spinning.</p>
        <a class="view-project-link" href="#">VIEW DETAILS <span class="arrow">→</span></a>
      </div>
      <div class="image-frame-container">
        <img alt="Early Designs" src="./assets/decorated.png">
        <div class="image-caption">Early Designs (900-1000 AD)</div>
      </div>
    </div>

    <div class="wipe-container" data-index="2">
      <div class="slide-view" data-index="2">
        <div class="background-layer" style="background-image: url('./assets/stones.png')"></div>
        <div class="sidebar-content">
          <div class="project-number">[02]</div>
          <h2 class="project-title">Blank Spindles</h2>
          <div class="project-tags">
            <span>PRODUCTION PROCESS</span>
            <span>CRAFTING TECHNIQUES</span>
            <span>MATERIAL TRANSFORMATION</span>
          </div>
          <p class="slide-description">Blank spindles represent the early manufacturing stage where clay fragments or
            potsherds were shaped into rough circles. Craftspeople would grind and reshape these discs on stone
            surfaces, with some receiving fine smoothing before the crucial central perforation was added to complete
            the functional spindle whorl.</p>
          <a class="view-project-link" href="#">VIEW DETAILS <span class="arrow">→</span></a>
        </div>
        <div class="image-frame-container">
          <img alt="Regional Variations" src="./assets/stones.png">
          <div class="image-caption">Regional Variations (1100 AD)</div>
        </div>
      </div>
    </div>

    <div class="wipe-container" data-index="3">
      <div class="slide-view" data-index="3">
        <div class="background-layer" style="background-image: url('./assets/spindles.png')"></div>
        <div class="sidebar-content">
          <div class="project-number">[03]</div>
          <h2 class="project-title">The Mechanics of Spinning</h2>
          <div class="project-tags">
            <span>FUNCTIONAL DESIGN</span>
            <span>TECHNOLOGICAL INNOVATION</span>
            <span>MATERIAL SCIENCE</span>
          </div>
          <p class="slide-description">The spindle whorl functions as a flywheel, maintaining spin momentum and twisting
            fibers into yarn. Its effectiveness depends on precise engineering attributes—size, weight, diameter, and
            shape working in harmony. Smaller whorls create finer threads by spinning faster, while heavier ones produce
            thicker materials by rotating more slowly, demonstrating how these tools were precisely calibrated for
            different textile applications.</p>
          <a class="view-project-link" href="#">VIEW DETAILS <span class="arrow">→</span></a>
        </div>
        <div class="image-frame-container">
          <img alt="Advanced Designs" src="./assets/spindles.png">
          <div class="image-caption">Advanced Designs (1200 AD)</div>
        </div>
      </div>
    </div>

    <div class="wipe-container" data-index="4">
      <div class="slide-view" data-index="4">
        <div class="background-layer" style="background-image: url('./assets/exhibit.png')"></div>
        <div class="sidebar-content">
          <div class="project-number">[04]</div>
          <h2 class="project-title">Stone Spindle Whorls</h2>
          <div class="project-tags">
            <span>RARE ARTIFACTS</span>
            <span>SPECIALIZED CRAFTSMANSHIP</span>
            <span>RITUAL SIGNIFICANCE</span>
          </div>
          <p class="slide-description">Stone whorls are relatively uncommon in the archaeological record of southern
            Africa compared to clay versions. They were difficult to break as well as to manufacture, using materials
            like siltstone, sandstone and mudstone. These disc-shaped, flat artifacts were carefully carved or chipped
            and perforated by hand. The laborious process of drilling holes through stone suggests these specialized
            tools may have been produced in limited quantities for specific needs or ritual purposes.</p>
          <a class="view-project-link" href="#">VIEW DETAILS <span class="arrow">→</span></a>
        </div>
        <div class="image-frame-container">
          <img alt="Legacy Designs" src="./assets/exhibit.png">
          <div class="image-caption">Legacy Designs (1300 AD)</div>
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
        <span class="total">04</span>
      </div>
    </div>
  </div>

  <div class="parallax-container">
    <div class="spindle-track">
      <div v-for="i in 5" :key="`top-${i}`" class="spindle-item top">
        <img alt="Spindle Whorl" class="spindle-parallax-image" src="./assets/spindle.png" />
      </div>
      <div v-for="i in 5" :key="`bottom-${i}`" class="spindle-item bottom">
        <img alt="Spindle Whorl" class="spindle-parallax-image" src="./assets/spindle.png" />
      </div>
    </div>

    <div class="impact-visualization">
      <div class="central-spindle">
        <img alt="Central Spindle Whorl" src="./assets/spindle.png" />
      </div>
      <div class="ripple-circles">
        <div class="ripple-circle" data-category="trade"></div>
        <div class="ripple-circle" data-category="technology"></div>
        <div class="ripple-circle" data-category="society"></div>
        <div class="ripple-circle" data-category="art"></div>
      </div>
      <div class="impact-cards">
        <div class="impact-card" data-category="trade">
          <h3>Trade Networks</h3>
          <p>Spindle whorls enabled textile production that became central to Mapungubwe's extensive trade networks
            across Africa and beyond.</p>
        </div>
        <div class="impact-card" data-category="technology">
          <h3>Technological Innovation</h3>
          <p>This simple tool represented sophisticated engineering knowledge, balancing weight and momentum for
            efficient fiber spinning.</p>
        </div>
        <div class="impact-card" data-category="society">
          <h3>Social Structure</h3>
          <p>Textile production influenced social organization, creating specialized roles and contributing to
            Mapungubwe's complex society.</p>
        </div>
        <div class="impact-card" data-category="art">
          <h3>Cultural Expression</h3>
          <p>The decorative patterns on spindle whorls reflected artistic traditions and cultural symbolism unique to
            the region.</p>
        </div>
      </div>
    </div>

    <div class="scroll-hint">
      <p>Continue scrolling</p>
      <div class="scroll-arrow"></div>
    </div>
  </div>
</template>

<script>
import { onMounted, ref } from "vue";
import { gsap } from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";
import BackButton from "../UniversalComponents/BackButton.vue";
import ScrollProgress from "../UniversalComponents/ScrollProgress.vue";

gsap.registerPlugin(ScrollTrigger);

export default {
  components: { ScrollProgress, BackButton },
  setup() {
    const bg = ref(null);
    const title = ref(null);
    const timelineEvents = [
      {
        date: "900 AD",
        description: "First evidence of fiber spinning in Mapungubwe.",
        details: "Archaeological excavations revealed simple spindle whorls made from clay, marking the earliest evidence of textile production in the region.",
        fact: "These early spindle whorls weighed between 15-30 grams - perfect for spinning indigenous cotton."
      },
      {
        date: "1000 AD",
        description: "Mapungubwe's rise as a key economic and political center.",
        details: "As Mapungubwe grew in importance, so did the craftsmanship of its spindle whorls, becoming more uniform and balanced for improved thread production.",
        fact: "Specialized spindle whorls for different fabric types began appearing around this time."
      },
      {
        date: "1100 AD",
        description: "Discovery of spindle whorls at Mutamba indicating active trade.",
        details: "Spindle whorls found at Mutamba and surrounding settlements show decorative patterns that suggest cultural exchange and artistic development.",
        fact: "Some whorls from this period show similarities to designs from as far as the East African coast."
      },
      {
        date: "1200 AD",
        description: "Regional trade with China and India through the east coast.",
        details: "At the height of Mapungubwe's trading power, spindle whorls became more sophisticated, with precise weight distributions and decorative elements reflecting elite status.",
        fact: "The finest spindle whorls were made from soapstone and adorned with intricate geometric patterns."
      },
      {
        date: "1300 AD",
        description: "Mapungubwe's influence over trade routes peaks.",
        details: "The spindle whorl technology reached its apex, with specialized forms for different fibers and a standardization of designs across the kingdom.",
        fact: "Excavations at the royal hill uncovered gold-adorned spindle whorls, suggesting their use in royal ceremonies."
      },
    ];

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

      gsap.set(".scroll-arrow", { opacity: 1 });

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
        .to(".scroll-hint p", {
          opacity: 0,
          duration: 0.5,
          ease: "power1.out"
        }, "-=0.7")
        .to(".scroll-arrow", {
          opacity: 0,
          duration: 0.5,
          ease: "power1.out"
        }, "-=0.7");

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


      setupParallaxEffect();

    });

    return { title, timelineEvents };
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
  background: linear-gradient(to bottom, #2d1e0f, #111);
  color: white;
  text-align: center;
  overflow: hidden;
}

.intro-title {
  font-size: 3rem;
  font-weight: bold;
  color: #ffd700;
  /* Gold color for the title */
  margin-bottom: 1rem;
  text-transform: uppercase;
  letter-spacing: 0.1rem;
  text-shadow: 0px 0px 20px rgba(255, 215, 0, 0.7);
}

/* Subtitle Styling */
.intro-description {
  font-size: 1.5rem;
  line-height: 1.8;
  color: #fff;
  max-width: 800px;
  margin: 0 auto;
  opacity: 0;
  transition: color 0.3s ease;
}

.intro-description:hover {
  color: #ffd700;
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
  font-size: 1rem;
  color: #fff;
  text-transform: uppercase;
  letter-spacing: 0.1rem;
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
  border-left: 2px solid #fff;
  border-bottom: 2px solid #fff;
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
  background-image: url('./assets/spindle.png');
  background-size: 300px;
  background-position: center;
  opacity: 0.05;
  filter: blur(2px);
  z-index: 1;
  transform: rotate(-5deg) scale(1.2);
}

.timeline-item:nth-child(odd) {
  background: linear-gradient(135deg, #2d1e0f 40%, #1a130a);
}

.timeline-item:nth-child(even) {
  background: linear-gradient(135deg, #111 40%, #1e1e1e);
}

.timeline-content {
  position: relative;
  z-index: 2;
  max-width: 800px;
  border-left: 3px solid #ffd700;
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
  color: #ffd700;
  margin-bottom: 1.5rem;
  position: relative;
  text-shadow: 0 0 15px rgba(255, 215, 0, 0.5);
  display: inline-block;
}

.timeline-date::after {
  content: '';
  position: absolute;
  bottom: -10px;
  left: 0;
  width: 60px;
  height: 3px;
  background: #ffd700;
  box-shadow: 0 0 10px rgba(255, 215, 0, 0.7);
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
  background: rgba(45, 30, 15, 0.7);
  border: 1px solid rgba(255, 215, 0, 0.3);
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
  text-shadow: 0 0 20px rgba(255, 215, 0, 0.9);
}

.panel.active .timeline-fact {
  transform: translateY(0);
  opacity: 1;
}

.timeline-icon {
  font-size: 2rem;
  color: #ffd700;
  margin-bottom: 1rem;
  display: block;
}

.last-container {
  position: relative;
  width: 100%;
  height: 100vh;
  background-color: #333;
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
  background: linear-gradient(to bottom, #2d1e0f, #111);
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
  background: #FFEF00;
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
  color: #FFEF00;
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
  border-left: 3px solid #ffd700;
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
  color: #ffd700;
  position: relative;
  display: inline-block;
  text-shadow: 0 0 15px rgba(255, 215, 0, 0.3);
  transition: text-shadow 0.3s ease;
}

.highlight::after {
  content: '';
  position: absolute;
  bottom: -5px;
  left: 0;
  width: 100%;
  height: 3px;
  background: #ffd700;
  transform: scaleX(1);
  transform-origin: left;
  transition: transform 0.5s ease;
}

.divider {
  width: 80px;
  height: 3px;
  background: #ffd700;
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
  color: #ffd700;
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
  background: rgba(255, 215, 0, 0.1);
  border-radius: 8px;
  position: relative;
  border-left: 3px solid #ffd700;
}

.fact-label {
  position: absolute;
  top: -10px;
  left: 15px;
  background: #ffd700;
  color: #2d1e0f;
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

.particle-container {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  overflow: hidden;
  pointer-events: none;
  z-index: 5;
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
  background: linear-gradient(to bottom, #111, #2d1e0f);
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

.spindle-item.top {
  top: -150px;
  /* Start above viewport */
}

.spindle-item.bottom {
  bottom: -150px;
  /* Start below viewport */
}

/* Position each spindle horizontally */
.spindle-item:nth-child(1) {
  left: 10%;
}

.spindle-item:nth-child(2) {
  left: 30%;
}

.spindle-item:nth-child(3) {
  left: 50%;
}

.spindle-item:nth-child(4) {
  left: 70%;
}

.spindle-item:nth-child(5) {
  left: 90%;
}

.spindle-item:nth-child(6) {
  left: 10%;
}

.spindle-item:nth-child(7) {
  left: 30%;
}

.spindle-item:nth-child(8) {
  left: 50%;
}

.spindle-item:nth-child(9) {
  left: 70%;
}

.spindle-item:nth-child(10) {
  left: 90%;
}

.spindle-parallax-image {
  width: 100%;
  height: 100%;
  object-fit: contain;
  filter: drop-shadow(0 0 10px rgba(255, 215, 0, 0.5));
}

.parallax-content {
  position: relative;
  z-index: 10;
  text-align: center;
  color: white;
  padding: 2rem;
  max-width: 800px;
  opacity: 0;
  margin-top: 200px;
  /* Make space for spindles */
}

.parallax-content h2 {
  font-size: 3rem;
  color: #ffd700;
  margin-bottom: 1rem;
}

.parallax-content p {
  font-size: 1.2rem;
  line-height: 1.6;
  color: white;
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
  filter: drop-shadow(0 0 20px rgba(255, 215, 0, 0.7));
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

.ripple-circle {
  position: absolute;
  border-radius: 50%;
  border: 2px solid rgba(255, 215, 0, 0.5);
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%) scale(0);
  opacity: 0;
}

.ripple-circle[data-category="trade"] {
  width: 300px;
  height: 300px;
  border-color: rgba(255, 215, 0, 0.6);
}

.ripple-circle[data-category="technology"] {
  width: 500px;
  height: 500px;
  border-color: rgba(255, 215, 0, 0.5);
}

.ripple-circle[data-category="society"] {
  width: 700px;
  height: 700px;
  border-color: rgba(255, 215, 0, 0.4);
}

.ripple-circle[data-category="art"] {
  width: 900px;
  height: 900px;
  border-color: rgba(255, 215, 0, 0.3);
}

.impact-cards {
  position: absolute;
  width: 100%;
  height: 100%;
  z-index: 23;
}

.impact-card {
  position: absolute;
  width: 250px;
  padding: 20px;
  background: rgba(45, 30, 15, 0.8);
  backdrop-filter: blur(5px);
  border: 1px solid rgba(255, 215, 0, 0.3);
  border-radius: 10px;
  opacity: 0;
  transform: scale(0.8);
  pointer-events: auto;
  /* Make cards clickable */
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.impact-card:hover {
  transform: scale(1.05);
  box-shadow: 0 0 20px rgba(255, 215, 0, 0.5);
}

.impact-card[data-category="trade"] {
  top: calc(50% - 150px);
  left: calc(50% + 200px);
}

.impact-card[data-category="technology"] {
  top: calc(50% + 100px);
  left: calc(50% + 300px);
}

.impact-card[data-category="society"] {
  top: calc(50% - 250px);
  left: calc(50% - 400px);
}

.impact-card[data-category="art"] {
  top: calc(50% + 120px);
  left: calc(50% - 375px);
}

.impact-card h3 {
  color: #ffd700;
  margin-bottom: 10px;
  font-size: 1.5rem;
}

.impact-card p {
  color: white;
  font-size: 1rem;
  line-height: 1.5;
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
    top: calc(50% + 50px);
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
  color: #ffd700;
  font-size: 0.9rem;
  text-transform: uppercase;
  letter-spacing: 2px;
  margin-bottom: 5px;
}

.scroll-arrow {
  width: 15px;
  height: 15px;
  border-right: 2px solid #ffd700;
  border-bottom: 2px solid #ffd700;
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
  box-shadow: 0 0 25px rgba(255, 215, 0, 0.8);
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
  color: #ffd700;
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
  border-bottom: 1px solid #ffd700;
  transition: all 0.3s ease;
}

.view-project-link:hover {
  color: #ffd700;
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
  background-color: #ffd700;
  transition: width 0.3s ease;
}

.progress-numbers {
  font-family: monospace;
  color: white;
  font-size: 0.9rem;
}

.current {
  color: #ffd700;
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
  background: rgba(255, 215, 0, 0.8);
  top: 0;
  box-shadow: 0 0 15px rgba(255, 215, 0, 0.8);
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

.museum-info {
  margin-top: 2rem;
  padding: 1rem;
  background: rgba(45, 30, 15, 0.6);
  border-radius: 8px;
  position: relative;
  border-left: 3px solid #FFEF00;
}

.museum-label {
  position: absolute;
  top: -10px;
  left: 15px;
  background: #FFEF00;
  color: #2d1e0f;
  font-size: 0.7rem;
  font-weight: 700;
  padding: 4px 10px;
  border-radius: 4px;
  letter-spacing: 1px;
}

.museum-content {
  color: white;
  font-size: 1rem;
  line-height: 1.6;
  margin: 0;
  margin-top: 10px;
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
}

.location-text {
  position: relative;
  padding-left: 20px;
}

.location-text::before {
  content: "📍";
  position: absolute;
  left: 0;
  color: #FFEF00;
}

.artifact-id {
  position: relative;
  padding-left: 20px;
}

.artifact-id::before {
  content: "🏺";
  position: absolute;
  left: 0;
  color: #FFEF00;
}

.period-text {
  position: relative;
  padding-left: 20px;
}

.period-text::before {
  content: "📅";
  position: absolute;
  left: 0;
  color: #FFEF00;
}

/* Add a subtle hover effect to the museum info */
.museum-info:hover {
  box-shadow: 0 0 15px rgba(255, 239, 0, 0.2);
  transform: translateY(-2px);
  transition: all 0.3s ease;
}

/* Enhance the main description to highlight the dating information */
.main-description strong {
  color: #FFEF00;
  font-weight: 600;
}
</style>