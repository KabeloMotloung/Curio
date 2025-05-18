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
    },
};
</script>

<style scoped>
.container {
    display: flex;
    flex-wrap: nowrap;
    isolation: isolate;
    position: relative;
    z-index: 1;
    background: url('../assets/timeline-background.jpeg') fixed center/cover no-repeat;
    min-width: 100vw;
}

.timeline-item {
    min-width: 100vw;
    height: 100vh;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    color: #3a2718;
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
    background-color: rgba(20, 12, 8, 0.65);
    z-index: 1;
}

.timeline-content {
    position: relative;
    z-index: 2;
    max-width: 800px;
    border-left: 3px solid #6b4226;
    padding: 2rem;
    padding-left: 2.5rem;
    transform: translateY(0);
    opacity: 1;
    background-color: rgba(242, 235, 225, 0.9);
    border-radius: 12px;
    box-shadow: 0 4px 20px rgba(30, 20, 10, 0.4);
    backdrop-filter: blur(5px);
}

.panel.active .timeline-content {
    transform: translateY(0);
    opacity: 1;
}

.timeline-date {
    font-size: 3.2rem;
    font-weight: bold;
    color: #6b4226; 
    margin-bottom: 1.5rem;
    position: relative;
    text-shadow: 0 2px 4px rgba(107, 66, 38, 0.2);
    display: inline-block;
}

.timeline-date::after {
    content: '';
    position: absolute;
    bottom: -10px;
    left: 0;
    width: 60px;
    height: 3px;
    background: #6b4226;
    box-shadow: 0 0 10px rgba(107, 66, 38, 0.5);
}

.timeline-description {
    font-size: 1.4rem;
    line-height: 1.6;
    color: #3a2718;
    margin-bottom: 1.5rem;
    max-width: 80%;
    margin-left: auto;
    margin-right: auto;
    font-weight: 600;
}

.timeline-details {
    color: #5a483a; 
    font-size: 1.1rem;
    line-height: 1.5;
    margin-top: 1.5rem;
    padding: 0 1rem;
}

.timeline-fact {
    display: inline-block;
    background: #e0d2c0;
    border: 1px solid #6b4226;
    padding: 0.5rem 1rem;
    border-radius: 4px;
    font-size: 0.9rem;
    margin-top: 1.5rem;
    transform: translateY(10px);
    opacity: 0.7;
    transition: transform 0.4s ease, opacity 0.4s ease;
    color: #3a2718;
}

.timeline-item:hover .timeline-fact {
    transform: translateY(0);
    opacity: 1;
}

.timeline-item:hover .timeline-date {
    color: #3a2718;
    text-shadow: 0 0 10px rgba(248, 240, 229, 0.6);
}

.panel.active .timeline-fact {
    transform: translateY(0);
    opacity: 1;
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