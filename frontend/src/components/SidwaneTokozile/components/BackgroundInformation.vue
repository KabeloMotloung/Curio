<template>
    <div class="last-container">
        <div class="content gradient-coffee">
            <div class="info-wrapper">
                <div class="info-container">
                    <div class="sculpture-image-container left">
                        <img alt="Sidwane Tokozile Sculpture" class="sculpture-image" src="../assets/sculpture-1.png" />
                        <div class="image-overlay">
                            <div class="overlay-content">
                                <span>Circa 1907</span>
                            </div>
                        </div>
                    </div>

                    <div class="info-text">
                        <h2 class="section-title"><span class="highlight">Sidwane Tokozile</span></h2>
                        <p class="main-description">
                            "Sidwane Tokozile" (Coffee Drinker), created by Anton van Wouw circa 1907, depicts a Zulu man with
                            pronounced cheekbones and an angular beard in a contemplative pose, clasping both hands around a coffee mug.
                            This bronze sculpture represents van Wouw's careful observation of everyday life and his skillful portrayal
                            of human emotion and dignity.
                        </p>
                        <ul class="feature-list">
                            <li>
                                <span class="feature-icon">✦</span>
                                <span class="feature-text"><strong>Artistic Detail:</strong> The figure wears a traditional head cloth and
                                tattered shirt, showing van Wouw's attention to realistic detail and texture</span>
                            </li>
                        </ul>
                        <div class="fun-fact">
                            <span class="fact-label">HISTORICAL CONTEXT</span>
                            <p>This sculpture was created during South Africa's colonial period when van Wouw's work often portrayed
                                subjects through a colonial lens. The resigned posture of the coffee drinker speaks to the social 
                                conditions of the time while still maintaining the subject's dignity.</p>
                        </div>
                        <div class="museum-info">
                            <span class="museum-label">EXHIBITION DETAILS</span>
                            <div class="museum-content">
                                <p class="location-text"><strong>Location:</strong> South African Art Collection, Gallery 7</p>
                                <p class="artifact-id"><strong>Artist:</strong> Anton van Wouw (1862-1945)</p>
                                <p class="period-text"><strong>Dating:</strong> c. 1907 (Early 20th Century)</p>
                            </div>
                        </div>
                    </div>

                    <div class="sculpture-image-container right">
                        <img alt="Anton van Wouw" class="sculpture-image" src="../assets/anton-van-wouw.jpg" />
                        <div class="image-overlay">
                            <div class="overlay-content">
                                <span>Anton van Wouw (1862-1945)</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { onMounted, ref } from 'vue';
import { gsap } from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';

gsap.registerPlugin(ScrollTrigger);

export default {
    name: 'Background',
    setup() {
        const isAnimating = ref(false);
        const hasAnimated = ref(false);
        
        onMounted(() => {
            // Eye opening animation effect - happens when section becomes visible
            const eyeOpeningTl = gsap.timeline({
                paused: true,
                onComplete: () => {
                    isAnimating.value = false;
                    hasAnimated.value = true;
                    infoAnimation();
                }
            });

            // Eye opening animation setup
            eyeOpeningTl
                .set(".content", {
                    clipPath: "polygon(50% 50%, 50% 50%, 50% 50%, 50% 50%)"
                })
                .to(".content", {
                    clipPath: "polygon(0% 45%, 100% 45%, 100% 55%, 0% 55%)",
                    duration: 1,
                    ease: "power2.out"
                })
                .to(".content", {
                    clipPath: "polygon(0% 0%, 100% 0%, 100% 100%, 0% 100%)",
                    duration: 1,
                    ease: "power2.out"
                });

            // Create the scroll trigger for the background section
            ScrollTrigger.create({
                trigger: ".last-container",
                start: "top 80%", 
                end: "bottom 20%",
                onEnter: () => {
                    // Only play the opening animation if it hasn't played before
                    if (!hasAnimated.value && !isAnimating.value) {
                        isAnimating.value = true;
                        eyeOpeningTl.restart();
                    } else if (hasAnimated.value) {
                        // If we've already animated once, just ensure content is visible
                        gsap.set(".content", {
                            clipPath: "polygon(0% 0%, 100% 0%, 100% 100%, 0% 100%)"
                        });
                        gsap.set(".info-wrapper", { opacity: 1 });
                    }
                },
                onLeave: () => {
                    // Don't do anything when scrolling down away from this section
                    // We want to keep the content visible
                },
                onEnterBack: () => {
                    // When scrolling back up to this section, make sure content is visible
                    if (hasAnimated.value) {
                        gsap.set(".content", {
                            clipPath: "polygon(0% 0%, 100% 0%, 100% 100%, 0% 100%)"
                        });
                        gsap.set(".info-wrapper", { opacity: 1 });
                    }
                },
                onLeaveBack: () => {
                    // Only hide content when we scroll back above this section 
                    // (going to previous sections)
                    fadeOutContent();
                }
            });

            function infoAnimation() {
                // Don't animate info content if it's already been shown
                if (gsap.getProperty(".info-wrapper", "opacity") === 1) {
                    return;
                }
                
                // Content reveal animations - these start after eye opening
                const infoTl = gsap.timeline({
                    onComplete: () => isAnimating.value = false
                });

                infoTl
                    .to(".info-wrapper", {
                        opacity: 1,
                        duration: 0.8,
                        ease: "power2.out"
                    })
                    .from(".sculpture-image-container.left", {
                        x: -80,
                        opacity: 0,
                        duration: 0.8,
                        ease: "back.out(1.7)"
                    }, "-=0.3")
                    .from(".sculpture-image-container.right", {
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
                    }, "-=0.2")
                    .from(".fun-fact", {
                        y: 20,
                        opacity: 0,
                        duration: 0.6,
                        ease: "power2.out"
                    }, "-=0.2")
                    .from(".museum-info", {
                        y: 20,
                        opacity: 0,
                        duration: 0.6,
                        ease: "power2.out"
                    }, "-=0.4");
            }

            function fadeOutContent() {
                // Only fade out when leaving upward to previous sections
                gsap.timeline()
                    .to(".content", {
                        clipPath: "polygon(50% 50%, 50% 50%, 50% 50%, 50% 50%)",
                        duration: 0.8,
                        ease: "power2.in"
                    });
            }

            // Create a special listener for parent section activation
            const observer = new MutationObserver((mutations) => {
                mutations.forEach((mutation) => {
                    if (mutation.type === 'attributes' && mutation.attributeName === 'class') {
                        const targetElement = mutation.target;
                        if (targetElement.id === 'background' && targetElement.classList.contains('active')) {
                            // Parent section is active, ensure our animations start or content is visible
                            if (!hasAnimated.value && !isAnimating.value) {
                                isAnimating.value = true;
                                eyeOpeningTl.restart();
                            } else if (hasAnimated.value) {
                                // If we've already animated once, just ensure content is visible
                                gsap.set(".content", {
                                    clipPath: "polygon(0% 0%, 100% 0%, 100% 100%, 0% 100%)"
                                });
                                gsap.set(".info-wrapper", { opacity: 1 });
                            }
                        }
                    }
                });
            });

            // Start observing the parent section for class changes
            const backgroundSection = document.querySelector('#background');
            if (backgroundSection) {
                observer.observe(backgroundSection, { attributes: true });
            }

            // Cleanup on component unmount
            return () => {
                observer.disconnect();
                ScrollTrigger.getAll().forEach(trigger => {
                    if (trigger.vars.trigger === ".last-container") {
                        trigger.kill();
                    }
                });
            };
        });

        return {
            isAnimating,
            hasAnimated
        };
    }
};
</script>

<style scoped>
.last-container {
    position: relative;
    width: 100%;
    height: 100vh;
    background-color: #f5e9d9; /* Lighter latte background for the container */
    display: flex;
    justify-content: center;
    align-items: center;
    overflow: hidden;
    color: #33261e; /* Darker coffee text color */
    text-align: center;
}

.content {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    clip-path: polygon(50% 50%, 50% 50%, 50% 50%, 50% 50%);
    z-index: 1;
}

.gradient-coffee {
    background: linear-gradient(to bottom, #e6d7c3, #d1bea0); /* Latte gradient background */
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

.sculpture-image-container {
    position: relative;
    width: 25%;
    max-width: 250px;
    flex-shrink: 0;
    overflow: hidden;
    box-shadow: none;
    background: transparent;
    border-radius: 0;
}

.sculpture-image-container.left {
    transform: perspective(1000px) rotateY(5deg);
}

.sculpture-image-container.right {
    transform: perspective(1000px) rotateY(-5deg);
}

.sculpture-image-container:hover {
    transform: perspective(1000px) rotateY(0);
}

.sculpture-image-container:hover .image-overlay {
    opacity: 1;
}

.sculpture-image {
    width: 100%;
    height: 100%;
    object-fit: contain;
    border-radius: 0;
    transition: transform 0.5s ease;
    filter: drop-shadow(0 8px 20px rgba(51, 38, 30, 0.25)); /* Updated shadow color */
}

.image-overlay {
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 30%;
    background: linear-gradient(to top, rgba(51, 38, 30, 0.8), transparent); /* Darker coffee overlay */
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

.section-title {
    font-size: 3rem;
    font-weight: 700;
    margin-bottom: 0.5rem;
    color: #33261e; /* Darker coffee text color */
    letter-spacing: 1px;
}

.highlight {
    color: #5d3a22; /* Darker coffee accent color */
    position: relative;
    display: inline-block;
    text-shadow: 0 0 15px rgba(93, 58, 34, 0.3);
    transition: text-shadow 0.3s ease;
}

.highlight::after {
    content: '';
    position: absolute;
    bottom: -5px;
    left: 0;
    width: 100%;
    height: 3px;
    background: #5d3a22; /* Darker coffee accent color */
    transform: scaleX(1);
    transform-origin: left;
    transition: transform 0.5s ease;
    animation: underlinePulse 2s infinite;
}

@keyframes underlinePulse {
    0% {
        opacity: 0.6;
        box-shadow: 0 0 5px rgba(93, 58, 34, 0.5);
    }

    50% {
        opacity: 1;
        box-shadow: 0 0 12px rgba(93, 58, 34, 0.8);
    }

    100% {
        opacity: 0.6;
        box-shadow: 0 0 5px rgba(93, 58, 34, 0.5);
    }
}

.divider {
    width: 80px;
    height: 3px;
    background: #5d3a22; /* Darker coffee accent color */
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
    background: #8c5e40; /* Lighter coffee accent for animation */
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

.info-text {
    flex: 1;
    text-align: left;
    max-width: 600px;
    position: relative;
    padding: 30px;
    border-radius: 8px;
    backdrop-filter: blur(5px);
    background: rgba(245, 233, 217, 0.8); /* Latte background with transparency */
    box-shadow: 0 10px 30px rgba(51, 38, 30, 0.25),
        inset 0 0 20px rgba(93, 58, 34, 0.05);
    border-left: 3px solid #5d3a22; /* Darker coffee accent color */
    margin: 0 auto;
}

.main-description {
    font-size: 1.2rem;
    line-height: 1.8;
    color: #33261e; /* Darker coffee text color */
    margin-bottom: 2rem;
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
    color: #5d3a22; /* Darker coffee accent color */
    margin-right: 15px;
    font-size: 1.2rem;
}

.feature-text {
    color: #33261e; /* Darker coffee text color */
    line-height: 1.5;
}

.feature-text strong {
    color: #412a1d; /* Even darker coffee text for emphasis */
    font-weight: 600;
}

.fun-fact {
    margin-top: 2rem;
    padding: 1rem;
    background: rgba(93, 58, 34, 0.1); /* Darker coffee accent with transparency */
    border-radius: 8px;
    position: relative;
    border-left: 3px solid #5d3a22; /* Darker coffee accent color */
}

.fact-label {
    position: absolute;
    top: -10px;
    left: 15px;
    background: #5d3a22; /* Darker coffee accent color */
    color: #f5e9d9; /* Latte text color for contrast */
    font-size: 0.7rem;
    font-weight: 700;
    padding: 4px 10px;
    border-radius: 4px;
    letter-spacing: 1px;
}

.fun-fact p {
    color: #33261e; /* Darker coffee text color */
    font-size: 1rem;
    line-height: 1.6;
    margin: 0;
    margin-top: 10px;
}

.museum-info {
    margin-top: 2rem;
    padding: 1rem;
    background: rgba(76, 48, 27, 0.1); /* Darker coffee accent with transparency */
    border-radius: 8px;
    position: relative;
    border-left: 3px solid #8c5e40; /* Lighter coffee accent color */
}

.museum-label {
    position: absolute;
    top: -10px;
    left: 15px;
    background: #8c5e40; /* Lighter coffee accent color */
    color: #f5e9d9; /* Latte text color for contrast */
    font-size: 0.7rem;
    font-weight: 700;
    padding: 4px 10px;
    border-radius: 4px;
    letter-spacing: 1px;
}

.museum-content {
    color: #33261e; /* Darker coffee text color */
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
    color: #8c5e40; /* Lighter coffee accent color */
}

.artifact-id {
    position: relative;
    padding-left: 20px;
}

.artifact-id::before {
    content: "👨‍🎨";
    position: absolute;
    left: 0;
    color: #8c5e40; /* Lighter coffee accent color */
}

.period-text {
    position: relative;
    padding-left: 20px;
}

.period-text::before {
    content: "📅";
    position: absolute;
    left: 0;
    color: #8c5e40; /* Lighter coffee accent color */
}

.museum-info:hover {
    box-shadow: 0 0 15px rgba(93, 58, 34, 0.2);
    transform: translateY(-2px);
    transition: all 0.3s ease;
}

.main-description strong {
    color: #5d3a22; /* Darker coffee accent color */
    font-weight: 600;
}

/* Media queries for responsive design */
@media (max-width: 1200px) {
    .info-container {
        flex-wrap: wrap;
        justify-content: center;
        gap: 1rem;
    }

    .sculpture-image-container {
        width: 20%;
        min-width: 150px;
    }

    .info-text {
        order: 0;
        width: 100%;
        margin: 0 auto 1rem auto;
    }

    .sculpture-image-container.left {
        order: -1;
    }

    .sculpture-image-container.right {
        order: 1;
    }
}

@media (max-width: 768px) {
    .sculpture-image-container.right {
        display: none;
    }

    .sculpture-image-container.left {
        width: 40%;
        max-width: 180px;
        margin: 0 auto 1rem auto;
    }

    .info-container {
        flex-direction: column;
    }

    .section-title {
        font-size: 2.5rem;
    }
}
</style>