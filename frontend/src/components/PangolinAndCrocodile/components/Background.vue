<template>
    <div class="last-container">
        <div class="content gradient-yellow">
            <div class="info-wrapper">
                <div class="info-container">
                    <div class="spindle-image-container left">
                        <img alt="Pangolin" class="spindle-image" src="../assets/DeWatermark.ai_1746301546207.png" />
                        <div class="image-overlay">
                            <div class="overlay-content">
                                <span>Critically Endangered</span>
                            </div>
                        </div>
                    </div>

                    <div class="info-text">
                        <h2 class="section-title"><span class="highlight">The Pangolin</span></h2>
                        <p class="main-description">
                            Pangolins are unique, scale-covered mammals found across Africa and Asia. Revered for their
                            distinctive appearance and behavior, they play a crucial role in controlling insect populations.
                            Sadly, they are among the most trafficked animals in the world today.
                        </p>
                        <ul class="feature-list">
                            <li>
                                <span class="feature-icon">✦</span>
                                <span class="feature-text"><strong>Natural Defense:</strong> Pangolins curl into a tight ball
                                    when threatened, using their armored scales as protection from predators.</span>
                            </li>
                        </ul>
                        <div class="fun-fact">
                            <span class="fact-label">ECOLOGICAL INSIGHT</span>
                            <p>One pangolin can consume up to 70 million ants and termites per year, making them essential
                                for maintaining ecological balance in their habitats.</p>
                        </div>
                        <div class="museum-info">
                            <span class="museum-label">EXHIBITION DETAILS</span>
                            <div class="museum-content">
                                <p class="location-text"><strong>Location:</strong> Biodiversity Hall, Natural World Exhibit</p>
                                <p class="artifact-id"><strong>Species:</strong> Ground Pangolin (Smutsia temminckii)</p>
                                <p class="period-text"><strong>Status:</strong> Critically Endangered (IUCN Red List)</p>
                            </div>
                        </div>
                    </div>

                    <div class="spindle-image-container right">
                        <img alt="Pangolin" class="spindle-image" src="../assets/Untitled design.png" />
                        <div class="image-overlay">
                            <div class="overlay-content">
                                <span>Critically Endangered</span>
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
            // Eye opening animation effect without pinning
            gsap.timeline({
                scrollTrigger: {
                    trigger: ".last-container",
                    start: "top bottom",
                    end: "top top",
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
                    start: "top 70%",
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
  display: flex;
  justify-content: center;
  align-items: center;
  overflow: hidden;
  color: #333;
  text-align: center;
  background-color: #f8f5f0;
}

.content {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 1;
}

.gradient-background {
  background: #f8f5f0;
  background: 
    radial-gradient(circle at 20% 30%, rgba(255,215,0,0.08) 0%, transparent 40%),
    radial-gradient(circle at 80% 70%, rgba(46,125,50,0.08) 0%, transparent 40%);
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
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1), 0 1px 8px rgba(0, 0, 0, 0.05);
  background: white;
  border-radius: 12px;
  transition: transform 0.5s ease, box-shadow 0.3s ease;
}

.spindle-image-container.left {
  transform: perspective(1000px) rotateY(5deg);
}

.spindle-image-container.right {
  transform: perspective(1000px) rotateY(-5deg);
}

.spindle-image-container:hover {
  transform: scale(1.05);
  box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15), 0 5px 15px rgba(0, 0, 0, 0.08);
}

.spindle-image {
  width: 100%;
  height: 100%;
  object-fit: contain;
  border-radius: 12px;
  transition: transform 0.5s ease;
  filter: drop-shadow(0 8px 15px rgba(0, 0, 0, 0.2));
}

.image-overlay {
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 30%;
  background: linear-gradient(to top, rgba(0, 0, 0, 0.7), transparent);
  display: flex;
  align-items: flex-end;
  padding: 1rem;
  opacity: 0;
  transition: opacity 0.3s ease;
  border-bottom-left-radius: 12px;
  border-bottom-right-radius: 12px;
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
  color: #2a3f5f;
  letter-spacing: 1px;
}

.highlight {
  background: linear-gradient(45deg, #2a3f5f, #2e7d32);
  -webkit-background-clip: text;
  background-clip: text;
  color: transparent;
  position: relative;
  display: inline-block;
  font-weight: 700;
}

.highlight::after {
  content: '';
  position: absolute;
  bottom: -5px;
  left: 0;
  width: 100%;
  height: 3px;
  background: linear-gradient(45deg, #2a3f5f, #2e7d32);
  transform: scaleX(1);
  transform-origin: left;
  transition: transform 0.5s ease;
}

.info-text {
  flex: 1;
  text-align: left;
  max-width: 600px;
  position: relative;
  padding: 30px;
  border-radius: 16px;
  background: white;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1), 0 1px 8px rgba(0, 0, 0, 0.05);
  border: 1px solid rgba(255, 255, 255, 0.3);
  margin: 0 auto;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  backdrop-filter: blur(8px);
  background: linear-gradient(135deg, rgba(255, 255, 255, 0.95), rgba(255, 255, 255, 0.8));
}

.info-text:hover {
  box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15), 0 5px 15px rgba(0, 0, 0, 0.08);
}

.main-description {
  font-size: 1.2rem;
  line-height: 1.8;
  color: #4a4a4a;
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
  color: #2e7d32;
  margin-right: 15px;
  font-size: 1.2rem;
}

.feature-text {
  color: #4a4a4a;
  line-height: 1.5;
}

.feature-text strong {
  color: #2a3f5f;
  font-weight: 600;
}

.fun-fact {
  margin-top: 2rem;
  padding: 1.5rem;
  background: rgba(46, 125, 50, 0.1);
  border-radius: 12px;
  position: relative;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.fun-fact:hover {
  transform: translateY(-3px);
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
}

.fact-label {
  position: absolute;
  top: -10px;
  left: 15px;
  background: linear-gradient(45deg, #2a3f5f, #2e7d32);
  color: white;
  font-size: 0.7rem;
  font-weight: 700;
  padding: 4px 10px;
  border-radius: 4px;
  letter-spacing: 1px;
}

.fun-fact p {
  color: #333;
  font-size: 1rem;
  line-height: 1.6;
  margin: 0;
  margin-top: 10px;
}

.museum-info {
  margin-top: 2rem;
  padding: 1.5rem;
  background: rgba(42, 63, 95, 0.1);
  border-radius: 12px;
  position: relative;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.museum-info:hover {
  transform: translateY(-3px);
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
}

.museum-label {
  position: absolute;
  top: -10px;
  left: 15px;
  background: linear-gradient(45deg, #2a3f5f, #2e7d32);
  color: white;
  font-size: 0.7rem;
  font-weight: 700;
  padding: 4px 10px;
  border-radius: 4px;
  letter-spacing: 1px;
}

.museum-content {
  color: #333;
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
  color: #2a3f5f;
}

.artifact-id {
  position: relative;
  padding-left: 20px;
}

.artifact-id::before {
  content: "🏺";
  position: absolute;
  left: 0;
  color: #2a3f5f;
}

.period-text {
  position: relative;
  padding-left: 20px;
}

.period-text::before {
  content: "📅";
  position: absolute;
  left: 0;
  color: #2a3f5f;
}

.main-description strong {
  color: #2e7d32;
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