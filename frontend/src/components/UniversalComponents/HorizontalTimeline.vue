<template>
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
    isolation: isolate; /* Add this for CSS isolation */
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

/* Rest of the CSS remains unchanged */
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