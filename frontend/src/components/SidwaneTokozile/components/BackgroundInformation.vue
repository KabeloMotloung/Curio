<template>
    <div class="last-container">
        <div class="content gradient-coffee">
            <div class="info-wrapper">
                <div class="info-container">
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

                    <div class="sculpture-image-container">
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
import { onMounted } from 'vue';
import gsap from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';

gsap.registerPlugin(ScrollTrigger);

export default {
    name: 'BackgroundInformation',
    setup() {
        onMounted(() => {
            gsap.registerPlugin(ScrollTrigger);
            
            gsap.set(".content", {
                clipPath: "polygon(50% 50%, 50% 50%, 50% 50%, 50% 50%)"
            });
            
            gsap.set(".info-wrapper", {
                opacity: 0
            });
            
            gsap.set(".sculpture-image-container", {
                x: 80,
                opacity: 0
            });
            
            gsap.set(".section-title, .main-description, .feature-list li, .fun-fact, .museum-info", {
                y: 20,
                opacity: 0
            });
            
            const mainTl = gsap.timeline({
                paused: true
            });
            
            mainTl
                .to(".content", {
                    clipPath: "polygon(0% 45%, 100% 45%, 100% 55%, 0% 55%)",
                    duration: 0.3,
                    ease: "power2.out"
                }, 0)
                .to(".content", {
                    clipPath: "polygon(0% 0%, 100% 0%, 100% 100%, 0% 100%)",
                    duration: 0.3,
                    ease: "power2.out"
                }, 0.3)
                .to(".info-wrapper", {
                    opacity: 1,
                    duration: 0.2,
                    ease: "power1.out"
                }, 0.5)
                .to(".sculpture-image-container", {
                    x: 0,
                    opacity: 1,
                    duration: 0.3,
                    ease: "back.out(1.7)"
                }, 0.6)
                .to(".section-title", {
                    y: 0,
                    opacity: 1,
                    duration: 0.3,
                    ease: "power2.out"
                }, 0.7)
                .to(".main-description", {
                    y: 0,
                    opacity: 1,
                    duration: 0.3,
                    ease: "power2.out"
                }, 0.8)
                .to(".feature-list li", {
                    y: 0,
                    opacity: 1,
                    duration: 0.3,
                    stagger: 0.05,
                    ease: "power2.out"
                }, 0.9)
                .to(".fun-fact", {
                    y: 0,
                    opacity: 1,
                    duration: 0.3,
                    ease: "power2.out"
                }, 1.0)
                .to(".museum-info", {
                    y: 0,
                    opacity: 1,
                    duration: 0.3,
                    ease: "power2.out"
                }, 1.1);
                
            ScrollTrigger.create({
                trigger: ".last-container",
                start: "top 80%", 
                end: "center center", 
                scrub: 0.5, 
                animation: mainTl,
                toggleActions: "play none none reverse",
                markers: false, 
                onEnter: () => {
                    console.log("ScrollTrigger entered");
                    mainTl.play();
                },
                onLeaveBack: () => {
                    console.log("ScrollTrigger left");
                    mainTl.reverse();
                }
            });

            return () => {
                ScrollTrigger.getAll().forEach(trigger => {
                    trigger.kill();
                });
                mainTl.kill();
            };
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
    background-color: #f5e9d9;
    display: flex;
    justify-content: center;
    align-items: center;
    overflow: hidden;
    color: #33261e;
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
    background: linear-gradient(to bottom, #e6d7c3, #d1bea0);
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
    color: #33261e; 
    letter-spacing: 1px;
}

.highlight {
    color: #5d3a22; 
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
    background: #5d3a22;
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
    background: #5d3a22;
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
    background: #8c5e40; 
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
    background: rgba(245, 233, 217, 0.8); 
    box-shadow: 0 10px 30px rgba(51, 38, 30, 0.25),
        inset 0 0 20px rgba(93, 58, 34, 0.05);
    border-left: 3px solid #5d3a22; 
    margin: 0 auto;
}

.main-description {
    font-size: 1.2rem;
    line-height: 1.8;
    color: #33261e; 
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
    color: #5d3a22;
    margin-right: 15px;
    font-size: 1.2rem;
}

.feature-text {
    color: #33261e;
    line-height: 1.5;
}

.feature-text strong {
    color: #412a1d;
    font-weight: 600;
}

.fun-fact {
    margin-top: 2rem;
    padding: 1rem;
    background: rgba(93, 58, 34, 0.1); 
    border-radius: 8px;
    position: relative;
    border-left: 3px solid #5d3a22; 
}

.fact-label {
    position: absolute;
    top: -10px;
    left: 15px;
    background: #5d3a22; 
    color: #f5e9d9; 
    font-size: 0.7rem;
    font-weight: 700;
    padding: 4px 10px;
    border-radius: 4px;
    letter-spacing: 1px;
}

.fun-fact p {
    color: #33261e;
    font-size: 1rem;
    line-height: 1.6;
    margin: 0;
    margin-top: 10px;
}

.museum-info {
    margin-top: 2rem;
    padding: 1rem;
    background: rgba(76, 48, 27, 0.1); 
    border-radius: 8px;
    position: relative;
    border-left: 3px solid #8c5e40;
}

.museum-label {
    position: absolute;
    top: -10px;
    left: 15px;
    background: #8c5e40; 
    color: #f5e9d9;
    font-size: 0.7rem;
    font-weight: 700;
    padding: 4px 10px;
    border-radius: 4px;
    letter-spacing: 1px;
}

.museum-content {
    color: #33261e;
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
    color: #8c5e40;
}

.artifact-id {
    position: relative;
    padding-left: 20px;
}

.artifact-id::before {
    content: "👨‍🎨";
    position: absolute;
    left: 0;
    color: #8c5e40;
}

.period-text {
    position: relative;
    padding-left: 20px;
}

.period-text::before {
    content: "📅";
    position: absolute;
    left: 0;
    color: #8c5e40; 
}

.museum-info:hover {
    box-shadow: 0 0 15px rgba(93, 58, 34, 0.2);
    transform: translateY(-2px);
    transition: all 0.3s ease;
}

.main-description strong {
    color: #5d3a22;
    font-weight: 600;
}

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
}

@media (max-width: 768px) {
    .sculpture-image-container {
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