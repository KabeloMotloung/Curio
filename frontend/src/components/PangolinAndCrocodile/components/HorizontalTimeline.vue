<template>
    <div class="timeline-container">
        <div class="timeline-background"></div>
        <div class="container">
            <div v-for="(event, index) in events" :key="index" class="timeline-item panel">
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
    </div>
</template>

<script>
import { onMounted } from "vue";
import { gsap } from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";

gsap.registerPlugin(ScrollTrigger);

export default {
    name: "TimelineScroll",
    props: {
        events: {
            type: Array,
            required: true
        }
    },

    setup(props) {
        function setupTimelineAnimations(containerAnimation) {
            setTimeout(() => {
                const panels = gsap.utils.toArray('.panel');
                
                if (panels.length === 0) {
                    console.warn('No panel elements found');
                    return;
                }

                // Create animations for timeline dates when panels come into view
                panels.forEach((panel, i) => {
                    const dateElement = panel.querySelector('.timeline-date');
                    const factElement = panel.querySelector('.timeline-fact');
                    
                    if (!dateElement || !factElement) {
                        console.warn('Required elements not found in panel', i);
                        return;
                    }

                    // Create a pulse animation for the date when it's in view
                    gsap.fromTo(dateElement,
                        { scale: 0.95 },
                        {
                            scale: 1,
                            ease: "power1.out",
                            duration: 0.8,
                            scrollTrigger: {
                                trigger: panel,
                                containerAnimation: containerAnimation,
                                start: "left center",
                                toggleActions: "play none none reverse"
                            }
                        }
                    );

                    // Animate the fact tag with a slight delay
                    gsap.fromTo(factElement,
                        { opacity: 0, y: 20 },
                        {
                            opacity: 1,
                            y: 0,
                            duration: 0.6,
                            delay: 0.3,
                            scrollTrigger: {
                                trigger: panel,
                                containerAnimation: containerAnimation,
                                start: "left center",
                                toggleActions: "play none none reverse"
                            }
                        }
                    );
                });
            }, 500); // Small delay to ensure DOM elements are ready
        }

        onMounted(() => {
            // Clear any existing ScrollTriggers with this ID
            ScrollTrigger.getAll().forEach(st => {
                if (st.vars.id === "timelineScroll") {
                    st.kill();
                }
            });
            
            // Create a fresh ScrollTrigger
            setTimeout(() => {
                const sections = gsap.utils.toArray(".panel");
                
                if (sections.length === 0) {
                    console.warn('No panel elements found for horizontal scrolling');
                    return;
                }
                
                // Horizontal scrolling logic with unique ID
                const horizontalScrollTL = gsap.to(sections, {
                    xPercent: -100 * (sections.length - 1),
                    ease: "none",
                    scrollTrigger: {
                        id: "timelineScroll", // Unique ID
                        trigger: ".container",
                        pin: true,
                        anticipatePin: 1, // This helps with smoother pinning
                        scrub: 1,
                        snap: 1 / (sections.length - 1),
                        end: () => "+=" + document.querySelector(".container")?.offsetWidth || 1000,
                        invalidateOnRefresh: true, // Recalculate on window resize
                    },
                });

                setupTimelineAnimations(horizontalScrollTL.scrollTrigger);
            }, 300);
        });
    },
};
</script>

<style scoped>
.container {
    width: 500%;
    height: 100vh;
    display: flex;
    flex-wrap: nowrap;
    isolation: isolate;
    position: relative;
    z-index: 1;
}

.timeline-item {
    min-width: 100vw;
    height: 100vh;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    text-align: center;
    position: relative;
    overflow: hidden;
    padding: 2rem;
    border: 1px solid rgba(255,255,255,0.3); /* Match card border */
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

/* New styling to match cards */
.timeline-item:nth-child(odd) {
    background: linear-gradient(to bottom, #f8f9fa, #e9ecef);
}

.timeline-item:nth-child(even) {
    background: linear-gradient(to bottom, #f8f9fa, #e9ecef);
}

.timeline-content {
    position: relative;
    z-index: 2;
    max-width: 800px;
    border-left: 3px solid #2a3f5f; /* Match card heading gradient start color */
    padding: 2rem 2rem 2rem 3rem;
    transform: translateY(0);
    opacity: 1;
    backdrop-filter: blur(8px); /* Match card backdrop filter */
    border-radius: 15px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.1), 0 1px 8px rgba(0,0,0,0.05); /* Match card shadow */
    will-change: transform, opacity;
}

.panel.active .timeline-content {
    transform: translateY(0);
    opacity: 1;
}

.timeline-date {
    font-size: 3.2rem;
    font-weight: bold;
    background: linear-gradient(45deg, #2a3f5f, #2e7d32); /* Match card heading gradient */
    -webkit-background-clip: text;
    background-clip: text;
    color: transparent;
    margin-bottom: 1.5rem;
    position: relative;
    text-shadow: 0 2px 5px rgba(0,0,0,0.1);
    display: inline-block;
    letter-spacing: -0.5px; /* Match card heading */
}

.timeline-date::after {
    content: '';
    position: absolute;
    bottom: -10px;
    left: 0;
    width: 60px;
    height: 3px;
    background: linear-gradient(90deg, #2a3f5f, #2e7d32); /* Match heading gradient */
    border-radius: 2px;
    transform-origin: left;
    transition: width 0.6s ease;
}

.timeline-description {
    font-size: 1.4rem;
    line-height: 1.6;
    color: #333; /* Match card text color */
    margin-bottom: 1.5rem;
    max-width: 80%;
    margin-left: auto;
    margin-right: auto;
    text-shadow: 0 1px 2px rgba(255,255,255,0.8); /* Match card paragraph */
}

.timeline-details {
    color: #666; /* Lighter but still readable */
    font-size: 1.1rem;
    line-height: 1.5;
    margin-top: 1.5rem;
    padding: 0 1rem;
}

.timeline-fact {
    display: inline-block;
    background: rgba(255, 255, 255, 0.7);
    border: 1px solid rgba(42, 63, 95, 0.3); /* Match card heading gradient start */
    padding: 0.8rem 1.5rem;
    border-radius: 8px;
    font-size: 1rem;
    margin-top: 1.5rem;
    transform: translateY(10px);
    opacity: 0.7;
    transition: all 0.4s ease;
    box-shadow: 0 4px 10px rgba(0,0,0,0.05);
    color: #2a3f5f; /* Match card heading gradient start */
}

.timeline-item:hover .timeline-fact {
    transform: translateY(0);
    opacity: 1;
    box-shadow: 0 6px 15px rgba(0,0,0,0.1);
}

/* Add shine effect on hover like cards */
.timeline-content:after {
    content: "";
    position: absolute;
    top: -50%;
    left: -50%;
    width: 200%;
    height: 200%;
    background: linear-gradient(
        to right,
        rgba(255,255,255,0) 0%,
        rgba(255,255,255,0.3) 50%,
        rgba(255,255,255,0) 100%
    );
    transform: rotate(30deg);
    opacity: 0;
    transition: opacity 0.6s ease;
    pointer-events: none;
}

.timeline-content:hover:after {
    animation: shine 1.5s ease;
}

@keyframes shine {
    0% {
        opacity: 0;
        transform: translateX(-100%) rotate(30deg);
    }
    20% {
        opacity: 0.5;
    }
    100% {
        opacity: 0;
        transform: translateX(100%) rotate(30deg);
    }
}

/* Add this to create a highlight effect when hovering over timeline items */
.timeline-item:hover .timeline-date {
    text-shadow: 0 0 10px rgba(46, 125, 50, 0.4);
}

.panel.active .timeline-fact {
    transform: translateY(0);
    opacity: 1;
}

/* Floating animation for subtle movement */
@keyframes float {
    0%, 100% { transform: translateY(0) rotate(0deg); }
    25% { transform: translateY(-5px) rotate(0.5deg); }
    75% { transform: translateY(5px) rotate(-0.5deg); }
}

/* Background patterns matching card style */
.timeline-item:before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: 
        radial-gradient(circle at 20% 30%, rgba(42, 63, 95, 0.05) 0%, transparent 40%),
        radial-gradient(circle at 80% 70%, rgba(46, 125, 50, 0.05) 0%, transparent 40%);
    z-index: -1;
}

/* Responsive styles */
@media (max-width: 768px) {
    .timeline-date {
        font-size: 2.5rem;
    }

    .timeline-description {
        font-size: 1.2rem;
        max-width: 90%;
    }

    .timeline-details {
        font-size: 1rem;
    }

    .timeline-content {
        padding-left: 1.5rem;
    }
}
</style>