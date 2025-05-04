<template>
    <div class="last-container">
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

                    <div class="info-text">
                        <h2 class="section-title"><span class="highlight">The Spindle Whorl</span></h2>
                        <p class="main-description">
                            The spindle whorl was a vital tool in ancient Mapungubwe, used for spinning fibers into
                            thread. These archaeological ceramic artifacts, dated precisely to 1200-1290 AD, highlight
                            the advanced craftsmanship and trade practices of the time, symbolizing the ingenuity of the
                            Mapungubwe people.
                        </p>
                        <ul class="feature-list">
                            <li>
                                <span class="feature-icon">✦</span>
                                <span class="feature-text"><strong>Technical Innovation:</strong> Designs evolved to
                                    optimize thread
                                    quality with perfect weight distribution and balance</span>
                            </li>
                        </ul>
                        <div class="fun-fact">
                            <span class="fact-label">ARCHAEOLOGICAL INSIGHT</span>
                            <p>Chemical analysis of residue found on spindle whorls from Mapungubwe has identified
                                traces of indigenous cotton, baobab fiber, and even wild silk, suggesting a
                                sophisticated understanding of different fiber properties.</p>
                        </div>
                        <div class="museum-info">
                            <span class="museum-label">EXHIBITION DETAILS</span>
                            <div class="museum-content">
                                <p class="location-text"><strong>Location:</strong> Mapungubwe Ceramics Gallery, Old
                                    Arts 2-5</p>
                                <p class="artifact-id"><strong>Artist/Collection:</strong> Archaeological ceramic,
                                    Mapungubwe Collection</p>
                                <p class="period-text"><strong>Dating:</strong> 1200 - 1290 AD (Radiocarbon dated)</p>
                            </div>
                        </div>
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
</template>

<script>
import { onMounted } from 'vue';
import { gsap } from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';

gsap.registerPlugin(ScrollTrigger);

export default {
    name: 'Background',
    setup() {
        onMounted(() => {
            // Eye opening animation effect
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

            // Info container reveal animation
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

            // Parallax effect on images
            gsap.from(".spindle-image-container", {
                y: 20,
                scrollTrigger: {
                    trigger: ".last-container",
                    start: "top bottom",
                    end: "bottom top",
                    scrub: 1
                }
            });

            // Reset animation when container enters viewport
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
                gsap.set(".spindle-image-container.left", { x: -80, opacity: 0 });
                gsap.set(".spindle-image-container.right", { x: 80, opacity: 0 });
                gsap.set(".section-title", { y: 30, opacity: 0 });
                gsap.set(".divider", { width: 0 });
                gsap.set(".main-description", { y: 20, opacity: 0 });
                gsap.set(".feature-list li", { x: -20, opacity: 0 });
                gsap.set(".fun-fact", { y: 20, opacity: 0 });
                gsap.set(".museum-info", { y: 20, opacity: 0 });
            }
        });

        return {};
    }
};
</script>

<style scoped>
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

.gradient-yellow {
    background: linear-gradient(to bottom, #2d1e0f, #111);
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
    animation: underlinePulse 2s infinite;
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

.main-description {
    font-size: 1.2rem;
    line-height: 1.8;
    color: rgba(255, 255, 255, 0.9);
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

.museum-info:hover {
    box-shadow: 0 0 15px rgba(255, 239, 0, 0.2);
    transform: translateY(-2px);
    transition: all 0.3s ease;
}

.main-description strong {
    color: #FFEF00;
    font-weight: 600;
}

/* Media queries for responsive design */
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
        width: 100%;
        margin: 0 auto 1rem auto;
    }

    .spindle-image-container.left {
        order: -1;
    }

    .spindle-image-container.right {
        order: 1;
    }
}

@media (max-width: 768px) {
    .spindle-image-container.right {
        display: none;
    }

    .spindle-image-container.left {
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