<template>
    <div class="container">
        <div v-for="(event, index) in events" :key="index" class="timeline-item panel" :class="{ 'empty-slide': isEmptyEvent(event) }">
            <div v-if="!isEmptyEvent(event)" class="timeline-content">
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
        function isEmptyEvent(event) {
            return !event.date && !event.description && !event.details && !event.fact;
        }

        function setupTimelineAnimations(containerAnimation) {
            setTimeout(() => {
                const panels = gsap.utils.toArray('.panel').filter(panel => !panel.classList.contains('empty-slide'));
                
                if (panels.length === 0) {
                    console.warn('No non-empty panel elements found');
                    return;
                }

                panels.forEach((panel, i) => {
                    const dateElement = panel.querySelector('.timeline-date');
                    const factElement = panel.querySelector('.timeline-fact');
                    
                    if (!dateElement || !factElement) {
                        console.warn('Required elements not found in panel', i);
                        return;
                    }

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
            }, 500);
        }

        onMounted(() => {
            ScrollTrigger.getAll().forEach(st => {
                if (st.vars.id === "timelineScroll") {
                    st.kill();
                }
            });
            
            setTimeout(() => {
                const sections = gsap.utils.toArray(".panel");
                
                if (sections.length === 0) {
                    console.warn('No panel elements found for horizontal scrolling');
                    return;
                }
                
                const horizontalScrollTL = gsap.to(sections, {
                    xPercent: -100 * (sections.length - 1),
                    ease: "none",
                    scrollTrigger: {
                        id: "timelineScroll",
                        trigger: ".container",
                        pin: true,
                        anticipatePin: 1,
                        scrub: 1,
                        snap: 1 / (sections.length - 1),
                        end: () => "+=" + document.querySelector(".container")?.offsetWidth || 1000,
                        invalidateOnRefresh: true,
                    },
                });

                setupTimelineAnimations(horizontalScrollTL.scrollTrigger);
            }, 300);
        });

        return {
            isEmptyEvent
        };
    },
};
</script>

<style scoped>
@font-face {
  font-family: 'Raleway';
  font-style: normal;
  font-weight: 200;
  src: local('Raleway'),
       url('/fonts/Raleway/static/Raleway-ExtraLight.ttf') format('truetype');
  font-display: swap;
}

@font-face {
  font-family: 'Raleway';
  font-style: normal;
  font-weight: 400;
  src: local('Raleway'),
       url('/fonts/Raleway/static/Raleway-Regular.ttf') format('truetype');
  font-display: swap;
}

@font-face {
  font-family: 'Raleway';
  font-style: normal;
  font-weight: 600;
  src: local('Raleway'),
       url('/fonts/Raleway/static/Raleway-SemiBold.ttf') format('truetype');
  font-display: swap;
}

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
    background: transparent;
    color: #e8d7bc;
    text-align: center;
    position: relative;
    overflow: hidden;
    padding: 2rem;
    font-family: 'Playfair Display', serif;
}

.empty-slide {
    background: transparent;
}

.empty-slide::before {
    display: none;
}

.timeline-item:nth-child(odd) {
    background: transparent;
}

.timeline-item:nth-child(even) {
    background: transparent;
}

.timeline-content {
    position: relative;
    z-index: 2;
    max-width: 800px;
    padding: 2rem;
    transform: translateY(0);
    opacity: 1;
    overflow: visible;
    background: transparent;
    border-radius: 0;
    box-shadow: none;
}

.timeline-content::before {
    content: "";
    position: absolute;
    top: -70%;
    left: -70%;
    width: 220%;
    height: 220%;
    background-image: url('../assets/cloud.png');
    background-size: contain;
    background-position: center;
    background-repeat: no-repeat;
    opacity: 1;
    z-index: -1;
    border-radius: 0;
    filter: grayscale(0.2) brightness(0.6);
    transform: scale(1.5);
}

.panel.active .timeline-content {
    transform: translateY(0);
    opacity: 1;
}

.timeline-date {
    font-size: 3.5rem;
    font-weight: 300;
    color: #d4b494;
    margin-bottom: 1.5rem;
    position: relative;
    text-shadow: 0 0 18px rgba(212, 180, 148, 0.9),
                 0 4px 8px rgba(0, 0, 0, 0.7);
    display: block;
    font-family: 'Raleway', sans-serif;
    font-variant-numeric: normal;
    letter-spacing: 0.15em;
    font-style: normal;
    text-align: center;
    width: 100%;
    line-height: 1;
}

.timeline-date::after {
    content: '';
    position: absolute;
    bottom: -10px;
    left: 50%;
    transform: translateX(-50%);
    width: 60px;
    height: 2px;
    background: #9c6b3c;
    box-shadow: 0 0 8px rgba(156, 107, 60, 0.7);
}

.timeline-description {
    font-size: 1.6rem;
    line-height: 1.6;
    color: #ffffff;
    margin-bottom: 1.5rem;
    max-width: 80%;
    margin-left: auto;
    margin-right: auto;
    font-family: 'Raleway', sans-serif;
    font-weight: 500;
    text-shadow: 0 2px 6px rgba(0, 0, 0, 0.8),
                 0 0 15px rgba(0, 0, 0, 0.6);
}

.timeline-details {
    color: #ffffff;
    font-size: 1.15rem;
    line-height: 1.8;
    font-style: italic;
    margin-top: 1.5rem;
    padding: 0 1rem;
    font-family: 'Raleway', sans-serif;
    font-weight: 400;
    letter-spacing: 0.03em;
    opacity: 0.85;
    text-shadow: 0 2px 4px rgba(0, 0, 0, 0.7);
}

.timeline-fact {
    display: inline-block;
    background: rgba(45, 30, 15, 0.85);
    border: 1px solid rgba(185, 149, 108, 0.7);
    padding: 0.5rem 1.2rem;
    border-radius: 4px;
    font-size: 0.95rem;
    margin-top: 1.5rem;
    transform: translateY(10px);
    opacity: 0.85;
    transition: transform 0.4s ease, opacity 0.4s ease;
    font-family: 'Raleway', sans-serif;
    font-weight: 400;
    color: #ffffff;
    text-shadow: 0 1px 3px rgba(0, 0, 0, 0.8);
    position: relative;
}

.timeline-fact::before,
.timeline-fact::after {
    content: none;
}

.timeline-item:hover .timeline-fact {
    transform: translateY(0);
    opacity: 1;
}

.timeline-item:hover .timeline-date {
    color: #E5E7EB;
    text-shadow: 0 0 20px rgba(212, 180, 148, 0.9);
}

.panel.active .timeline-fact {
    transform: translateY(0);
    opacity: 1;
}

.timeline-icon {
    font-size: 2rem;
    color: #b9956c;
    margin-bottom: 1rem;
    display: block;
}

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