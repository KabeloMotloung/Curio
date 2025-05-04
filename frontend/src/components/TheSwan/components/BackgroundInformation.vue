<template>
    <div class="last-container">
        <div class="content gradient-yellow" :style="clipPathStyle">
            <div class="info-wrapper" :style="{opacity: contentOpacity}">
                <div class="info-container">
                    <!-- Artist Image - Left Side -->
                    <div class="artist-image-container" :style="leftImageStyle">
                        <img alt="Jan Jacob Spohler" class="artist-image" src="../assets/JanJacobSpohler.jpg" />
                        <div class="image-overlay">
                            <div class="overlay-content">
                                <span>Jan Jacob Spohler (1811-1879)</span>
                            </div>
                        </div>
                    </div>

                    <!-- Artwork Information - Right Side -->
                    <div class="info-text" :style="infoTextStyle">
                        <h2 class="section-title" :style="titleStyle"><span class="highlight">The Swan</span></h2>
                        <p class="main-description" :style="descriptionStyle">
                            The painting is oil on Canvas by the Dutch artist Jan Jacob Spohler (1811-1879) titled <strong>The Swan</strong> or <em>Het Zwaantje</em>. Created in 1849, this landscape depicts a building on the right side of a road, a small ship to the left and a large area of sky dominating the top half.
                        </p>
                        <ul class="feature-list">
                            <li :style="featureStyle">
                                <span class="feature-icon">✦</span>
                                <span class="feature-text"><strong>Symbolism:</strong> Rich with death symbolism including the swan (which carries souls to the next world), the ghostly figure at the inn entrance, and the black flag on the boat</span>
                            </li>
                            <li :style="featureStyle">
                                <span class="feature-icon">✦</span>
                                <span class="feature-text"><strong>Hidden Meaning:</strong> An allegory for the death of King Willem II of the Netherlands, who died in Tilburg in 1849</span>
                            </li>
                        </ul>
                        <div class="fun-fact" :style="factStyle">
                            <span class="fact-label">ARTISTIC INSIGHT</span>
                            <p>"Het Zwaantje" is an inn conjured from the artist's imagination, representing a temporary dwelling between life and the afterlife. There is no bridge connecting the inn to the town, and the boat likely symbolizes the Roman vessel that carries souls across the river Styx.</p>
                        </div>
                        <div class="museum-info" :style="museumStyle">
                            <span class="museum-label">ARTWORK DETAILS</span>
                            <div class="museum-content">
                                <p class="location-text"><strong>Location:</strong> Van Tilburg Gallery, Old Arts 2-10</p>
                                <p class="artifact-id"><strong>Physical Dimensions:</strong> 580mm x 850mm</p>
                                <p class="period-text"><strong>Created:</strong> 1849, Netherlands</p>
                                <p class="medium-text"><strong>Medium:</strong> Oil on Canvas</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import {computed } from 'vue';

export default {
    name: 'BackgroundInformation',
    props: {
        scrollPosition: {
            type: Number,
            default: 0
        },
        startPosition: {
            type: Number,
            default: 0.35
        },
        endPosition: {
            type: Number,
            default: 0.6
        }
    },
    
    setup(props) {
        const progress = computed(() => {
            if (props.scrollPosition < props.startPosition) return 0;
            if (props.scrollPosition > props.endPosition) return 1;
            return (props.scrollPosition - props.startPosition) / (props.endPosition - props.startPosition);
        });
        
        const clipPathStyle = computed(() => {
            const p = progress.value;
            if (p < 0.15) {
                const openWidth = p * (1/0.15) * 50;
                return {
                    clipPath: `polygon(0% ${50 - openWidth}%, 100% ${50 - openWidth}%, 100% ${50 + openWidth}%, 0% ${50 + openWidth}%)`,
                    transition: 'clip-path 0.3s ease-out'
                };
            } else {
                return {
                    clipPath: 'polygon(0% 0%, 100% 0%, 100% 100%, 0% 100%)',
                    transition: 'clip-path 0.3s ease-out'
                };
            }
        });
        
        const contentOpacity = computed(() => {
            const p = progress.value;
            if (p < 0.2) return p * 5; 
            if (p > 0.85) return 1 - ((p - 0.85) * (1/0.15)); 
            return 1; 
        });
        
        const leftImageStyle = computed(() => {
            const p = progress.value;
            const translateX = p < 0.3 ? -80 * (1 - (p / 0.3)) : 0;
            const opacity = p < 0.3 ? p / 0.3 : 1;
            
            return {
                transform: `translateX(${translateX}px)`,
                opacity: opacity,
                transition: 'transform 0.4s ease-out, opacity 0.4s ease-out'
            };
        });
        
        const titleStyle = computed(() => {
            const p = progress.value;
            const translateY = p < 0.25 ? 30 * (1 - (p / 0.25)) : 0;
            const opacity = p < 0.25 ? p / 0.25 : 1;
            const scale = p > 0.3 ? 1 + Math.sin((p - 0.3) * Math.PI) * 0.05 : 1;
            
            return {
                transform: `translateY(${translateY}px) scale(${scale})`,
                opacity: opacity,
                transition: 'transform 0.4s ease-out, opacity 0.4s ease-out'
            };
        });

        const descriptionStyle = computed(() => {
            const p = progress.value;
            const translateY = p < 0.35 ? 20 * (1 - (p / 0.35)) : 0;
            const opacity = p < 0.35 ? p / 0.35 : 1;
            
            return {
                transform: `translateY(${translateY}px)`,
                opacity: opacity,
                transition: 'transform 0.4s ease-out, opacity 0.4s ease-out'
            };
        });
        
        const featureStyle = computed(() => {
            const p = progress.value;
            const translateX = p < 0.4 ? -20 * (1 - (p / 0.4)) : 0;
            const opacity = p < 0.4 ? p / 0.4 : 1;
            
            return {
                transform: `translateX(${translateX}px)`,
                opacity: opacity,
                transition: 'transform 0.4s ease-out, opacity 0.4s ease-out'
            };
        });
        

        const factStyle = computed(() => {
            const p = progress.value;
            const translateY = p < 0.5 ? 20 * (1 - (p / 0.5)) : 0;
            const opacity = p < 0.5 ? p / 0.5 : 1;
            const floatY = p > 0.5 ? Math.sin((p - 0.5) * Math.PI * 2) * 5 : 0;
            
            return {
                transform: `translateY(${translateY + floatY}px)`,
                opacity: opacity,
                transition: 'transform 0.4s ease-out, opacity 0.4s ease-out'
            };
        });
        
        const museumStyle = computed(() => {
            const p = progress.value;
            const translateY = p < 0.6 ? 20 * (1 - (p / 0.6)) : 0;
            const opacity = p < 0.6 ? p / 0.6 : 1;
            
            return {
                transform: `translateY(${translateY}px)`,
                opacity: opacity,
                transition: 'transform 0.4s ease-out, opacity 0.4s ease-out'
            };
        });
        
        const infoTextStyle = computed(() => {
            const p = progress.value;
            if (p > 0.3) {
                const pulseScale = 1 + Math.sin(p * Math.PI * 2) * 0.01;
                return {
                    transform: `scale(${pulseScale})`,
                    boxShadow: `0 10px 30px rgba(0, 0, 0, 0.3), inset 0 0 ${5 + Math.sin(p * Math.PI * 3) * 5}px rgba(185, 149, 108, ${0.05 + Math.sin(p * Math.PI) * 0.05})`,
                    transition: 'transform 0.5s ease-out, box-shadow 0.5s ease-out'
                };
            }
            return {};
        });
        
        return {
            clipPathStyle,
            contentOpacity,
            leftImageStyle,
            titleStyle,
            descriptionStyle,
            featureStyle,
            factStyle,
            museumStyle,
            infoTextStyle
        };
    }
};
</script>

<style scoped>

.last-container {
    position: relative;
    width: 100%;
    height: 100vh;
    background-color: transparent;
    display: flex;
    justify-content: center;
    align-items: center;
    overflow: hidden;
    color: #E5E7EB;
    text-align: center;
    will-change: transform;
    font-family: 'Raleway', sans-serif;
}

.content {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: transparent;
    will-change: clip-path;
    z-index: 1;
}

.gradient-yellow {
    background: transparent;
}

.info-wrapper {
    position: relative;
    z-index: 2;
    width: 100%;
    max-width: 1400px;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100%;
    margin: 0 auto;
    will-change: opacity, transform;
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
    margin: 0 auto;
}

.artist-image-container {
    position: relative;
    width: 40%;
    max-width: 450px;
    min-width: 300px;
    flex-shrink: 0;
    overflow: hidden;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.5);
    background: transparent;
    border-radius: 8px;
    will-change: transform;
    border: 6px solid #b9956c;
}

.artist-image {
    width: 100%;
    height: auto;
    object-fit: cover;
    border-radius: 0;
    transition: transform 0.5s ease;
    filter: brightness(1.05) contrast(0.95);
}

.artist-image-container:hover .artist-image {
    transform: scale(1.02);
}

.image-overlay {
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    padding: 1rem;
    background: linear-gradient(to top, rgba(0, 0, 0, 0.8), transparent);
    display: flex;
    align-items: flex-end;
    opacity: 0;
    transition: opacity 0.3s ease;
}

.artist-image-container:hover .image-overlay {
    opacity: 1;
}

.overlay-content {
    color: #E5E7EB;
    font-size: 0.9rem;
    font-weight: 400;
    letter-spacing: 1px;
    font-family: 'Raleway', sans-serif;
    text-align: left;
}

.section-title {
    font-size: 3rem;
    font-weight: 200;
    margin-bottom: 1.2rem;
    color: #e8d7bc; 
    letter-spacing: 0.15em;
    will-change: transform, opacity;
    font-family: 'Raleway', sans-serif; 
    text-transform: none;
    position: relative;
    display: inline-block;
}

.section-title::before, 
.section-title::after {
    content: none;
}

.highlight {
    color: #c9a675; 
    position: relative;
    display: inline-block;
    text-shadow: 0 0 15px rgba(156, 107, 60, 0.4);
    transition: text-shadow 0.3s ease;
}

.highlight::after {
    content: '';
    position: absolute;
    bottom: -5px;
    left: 0;
    width: 100%;
    height: 2px;
    background: #9c6b3c;
    transform: scaleX(1);
    transform-origin: left;
    transition: transform 0.5s ease;
    animation: underlinePulse 2s infinite;
}

.divider {
    width: 80px;
    height: 3px;
    background: #b9956c;
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
    background: #E5E7EB;
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
    backdrop-filter: blur(3px);
    background: rgba(38, 26, 13, 0.5);
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3), 
        inset 0 0 15px rgba(156, 107, 60, 0.1);
    border-left: 3px solid #b9956c;
    border-top: none;
    border-bottom: none;
    border-right: none;
    margin: 0 auto;
    will-change: transform, box-shadow;
    font-family: 'Raleway', sans-serif;
}



.main-description {
    font-size: 1.2rem;
    line-height: 1.5;
    color: #e8d7bc;
    margin-bottom: 1.5rem;
    will-change: transform, opacity;
    font-family: 'Raleway', sans-serif;
    font-weight: 400;
    text-indent: 0;
}

.main-description::first-letter {
    font-size: inherit;
    font-weight: inherit;
    color: inherit;
    float: none;
    margin-right: 0;
    line-height: inherit;
}

.feature-list {
    list-style-type: none;
    padding: 0;
    margin: 1.5rem 0;
    display: flex;
    flex-direction: column;
    gap: 0.8rem;
    font-family: 'Raleway', sans-serif;
}

.feature-list li {
    display: flex;
    align-items: flex-start;
    margin-bottom: 0.5rem;
    font-size: 1.1rem;
    transition: transform 0.3s ease;
    will-change: transform, opacity;
    font-family: 'Raleway', sans-serif;
    font-weight: 400;
}

.feature-list li:hover {
    transform: translateX(5px);
}

.feature-icon {
    display: inline-block;
    color: #9c6b3c;
    margin-right: 15px;
    font-size: 1.2rem;
}

.feature-text {
    color: #e8d7bc;
    line-height: 1.4;
}

.feature-text strong {
    color: #E5E7EB;
    font-weight: 600;
}

.fun-fact {
    margin-top: 1.5rem;
    padding: 1rem;
    background: rgba(59, 40, 20, 0.15);
    border-radius: 8px;
    position: relative;
    border-left: 3px solid #b9956c;
    border-top: none;
    border-bottom: none;
    will-change: transform, opacity;
    font-family: 'Raleway', sans-serif;
    font-style: normal;
}

.fun-fact::before,
.fun-fact::after {
    content: none;
}

.museum-info {
    margin-top: 1.5rem;
    padding: 1.2rem 1.2rem 1.2rem 2rem;
    background: rgba(59, 40, 20, 0.4);
    border: none;
    border-left: 3px solid #9c6b3c;
    position: relative;
    will-change: transform, opacity;
    font-family: 'Raleway', sans-serif;
}

.museum-info::before {
    content: none;
}

.museum-label {
    position: absolute;
    top: -10px;
    left: 15px;
    background: #d4b494;
    color: #2d1e0f;
    font-size: 0.7rem;
    font-weight: 600;
    padding: 4px 10px;
    border-radius: 4px;
    letter-spacing: 1px;
    font-family: 'Raleway', sans-serif;
}

.museum-content {
    color: #E5E7EB;
    font-size: 1rem;
    line-height: 1.6;
    margin: 0;
    margin-top: 10px;
    display: flex;
    flex-direction: column;
    gap: 0.4rem;
    font-family: 'Raleway', sans-serif;
    font-weight: 400;
}

.location-text, .artifact-id, .period-text, .medium-text {
    position: relative;
    padding-left: 25px;
    font-family: 'Raleway', sans-serif;
    font-weight: 400;
    font-size: 1rem;
    color: #e8d7bc;
    line-height: 1.5;
}

.location-text::before {
    content: "🏛️";
    position: absolute;
    left: 0;
    color: #d4b494;
}

.artifact-id::before {
    content: "📏";
    position: absolute;
    left: 0;
    color: #d4b494;
}

.period-text::before {
    content: "📅";
    position: absolute;
    left: 0;
    color: #d4b494;
}

.medium-text::before {
    content: "🖌️";
    position: absolute;
    left: 0;
    color: #d4b494;
}

.museum-info:hover {
    box-shadow: 0 0 15px rgba(185, 149, 108, 0.2);
    transform: translateY(-2px);
    transition: all 0.3s ease;
}

.main-description strong {
    color: #d4b494;
    font-weight: 600;
}

@media (max-width: 1200px) {
    .info-container {
        flex-direction: column;
        justify-content: center;
        gap: 1.5rem;
    }

    .artist-image-container {
        width: 60%;
        max-width: 350px;
    }

    .info-text {
        width: 80%;
        margin-bottom: 2rem;
    }
}

@media (max-width: 768px) {
    .artist-image-container {
        width: 80%;
        max-width: 300px;
    }

    .info-text {
        width: 90%;
    }

    .section-title {
        font-size: 2.5rem;
    }
}
</style>