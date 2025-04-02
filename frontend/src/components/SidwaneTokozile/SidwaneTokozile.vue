<template>
    <div class="fixed inset-0 overflow-hidden flex items-center justify-center font-sans" @wheel="handleScroll"
        ref="container">
        <nav class="fixed top-0 left-0 right-0 z-50">
            <div class="max-w-7xl mx-auto px-6 py-4">
                <div class="flex items-center justify-between">
                    <div class="text-white text-2xl font-light tracking-[0.2em]">
                        CURIO
                    </div>
                    <div class="flex items-center gap-8">
                        <a href="#"
                            class="text-white/70 text-xs tracking-[0.2em] relative py-2 transition-colors duration-300 hover:text-white font-light group">
                            <span>DISCOVER</span>
                            <span
                                class="absolute bottom-0 left-0 w-0 h-[1px] bg-white transition-all duration-300 group-hover:w-full"></span>
                        </a>
                        <a href="#"
                            class="text-white/70 text-xs tracking-[0.2em] relative py-2 transition-colors duration-300 hover:text-white font-light group">
                            <span>COLLECTIONS</span>
                            <span
                                class="absolute bottom-0 left-0 w-0 h-[1px] bg-white transition-all duration-300 group-hover:w-full"></span>
                        </a>
                        <a href="#"
                            class="text-white/70 text-xs tracking-[0.2em] relative py-2 transition-colors duration-300 hover:text-white font-light group">
                            <span>ARTISTS</span>
                            <span
                                class="absolute bottom-0 left-0 w-0 h-[1px] bg-white transition-all duration-300 group-hover:w-full"></span>
                        </a>
                        <a href="#"
                            class="text-white/70 text-xs tracking-[0.2em] relative py-2 transition-colors duration-300 hover:text-white font-light group">
                            <span>ABOUT</span>
                            <span
                                class="absolute bottom-0 left-0 w-0 h-[1px] bg-white transition-all duration-300 group-hover:w-full"></span>
                        </a>
                    </div>
                </div>
            </div>
        </nav>

        <div class="absolute inset-0">
            <div class="absolute inset-0 bg-cover bg-center blur-3xl" ref="bgA"></div>
            <div class="absolute inset-0 bg-cover bg-center blur-3xl" ref="bgB"></div>
        </div>

        <div class="flex items-center justify-center gap-16 relative z-10">
            <div class="bg-white/5 backdrop-blur-sm border border-white/10 rounded-3xl p-8">
                <div class="flex items-center justify-center gap-16">
                    <div class="relative w-[30vw] h-[80vh] overflow-hidden rounded-2xl" ref="imageContainer">
                        <div class="absolute inset-0 flex items-center justify-center" ref="imageWrapper">
                            <img ref="imageA" class="absolute w-full h-full object-cover rounded-2xl" src="" alt="" />
                            <img ref="imageB" class="absolute w-full h-full object-cover rounded-2xl" src="" alt="" />
                        </div>
                    </div>

                    <div class="w-[400px] bg-black/30 backdrop-blur-xl p-8 text-white rounded-2xl"
                        ref="descriptionPanel">
                        <div class="flex flex-col gap-6">
                            <h2 class="text-4xl tracking-wide">Sidwane Tokozile</h2>
                            <h3 class="text-2xl tracking-wide">About the Artwork</h3>
                            <p class="text-white/70 text-xs tracking-[0.2em]">
                                Created by Anton van Wouw, known as the 'father of South African sculpture', this piece
                                is
                                believed to share its model with the famous "Bust of a Zulu" (1907).
                                The sculpture masterfully captures a Zulu man with pronounced cheekbones and an angular
                                beard,
                                conveying a sense of humble resignation as he clasps both hands around a mug.
                            </p>
                            <p class="text-white/70 text-xs tracking-[0.2em]">
                                The subject's slumped position and tattered clothing poignantly represent both poverty
                                and
                                humble thankfulness. This work, while part of van Wouw's colonial-era output,
                                successfully
                                captures the untamed and vulnerable essence of its subject.
                            </p>
                            <div class="flex flex-col gap-3">
                                <div class="flex justify-between">
                                    <span class="text-white/50 text-xs tracking-[0.2em]">Artist</span>
                                    <span class="text-white/80 text-xs tracking-[0.2em]">Anton van Wouw</span>
                                </div>
                                <div class="flex justify-between">
                                    <span class="text-white/50 text-xs tracking-[0.2em]">Year</span>
                                    <span class="text-white/80 text-xs tracking-[0.2em]">1907</span>
                                </div>
                                <div class="flex justify-between">
                                    <span class="text-white/50 text-xs tracking-[0.2em]">Medium</span>
                                    <span class="text-white/80 text-xs tracking-[0.2em]">Bronze</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="fixed bottom-4 left-1/2 -translate-x-1/2 flex gap-2 z-10" ref="scrollIndicator">
            <div v-for="index in totalImages" :key="index"
                class="w-2 h-2 rounded-full bg-white/30 transition-all duration-300"
                :class="{ 'bg-white scale-150': currentImageIndex === index - 1 }"></div>
        </div>
    </div>
</template>

<script setup lang="ts">
import { ref, onMounted, nextTick } from 'vue';
import { gsap } from 'gsap';

const currentImageIndex = ref(0);
const totalImages = 4;
let scrollTimeout: number | null = null;

const imageA = ref<HTMLImageElement | null>(null);
const imageB = ref<HTMLImageElement | null>(null);
const activeImg = ref(0);

const bgA = ref<HTMLElement | null>(null);
const bgB = ref<HTMLElement | null>(null);
const activeBg = ref(0);

const container = ref<HTMLElement | null>(null);
const descriptionPanel = ref<HTMLElement | null>(null);

const getInactiveImage = () => (activeImg.value === 0 ? imageB.value : imageA.value);
const getActiveImage = () => (activeImg.value === 0 ? imageA.value : imageB.value);

const getInactiveBg = () => (activeBg.value === 0 ? bgB.value : bgA.value);
const getActiveBg = () => (activeBg.value === 0 ? bgA.value : bgB.value);

const animateImageAndBgChange = async () => {
    const activeImage = getActiveImage();
    const newImage = getInactiveImage();
    const activeBackground = getActiveBg();
    const newBackground = getInactiveBg();
    if (!activeImage || !newImage || !activeBackground || !newBackground) return;

    newImage.src = `/${currentImageIndex.value + 1}.jpg`;
    gsap.set(newImage, { opacity: 0 });
    newBackground.style.backgroundImage = `url(/${currentImageIndex.value + 1}.jpg)`;
    gsap.set(newBackground, { opacity: 0 });

    const tl = gsap.timeline();
    tl.to([activeImage, activeBackground], {
        opacity: 0,
        duration: 0.4,
        ease: 'power2.inOut'
    })
        .to([newImage, newBackground], {
            opacity: (el: HTMLElement) =>
                el === newBackground ? 0.5 : 1,
            duration: 0.4,
            ease: 'power2.inOut'
        }, 0)
        .then(() => {
            activeImg.value = activeImg.value === 0 ? 1 : 0;
            activeBg.value = activeBg.value === 0 ? 1 : 0;
        });
};

const handleScroll = (event: WheelEvent) => {
    event.preventDefault();

    if (scrollTimeout) return;
    scrollTimeout = window.setTimeout(() => {
        scrollTimeout = null;
    }, 100);

    if (event.deltaY > 0) {
        currentImageIndex.value = (currentImageIndex.value + 1) % totalImages;
        nextTick(() => animateImageAndBgChange());
    } else {
        currentImageIndex.value = (currentImageIndex.value - 1 + totalImages) % totalImages;
        nextTick(() => animateImageAndBgChange());
    }
};

onMounted(() => {
    if (bgA.value) {
        bgA.value.style.backgroundImage = `url(/${currentImageIndex.value + 1}.jpg)`;
        gsap.set(bgA.value, { opacity: 0.5 });
    }
    if (bgB.value) {
        gsap.set(bgB.value, { opacity: 0 });
    }

    if (imageA.value) {
        imageA.value.src = `/${currentImageIndex.value + 1}.jpg`;
        gsap.set(imageA.value, { opacity: 1 });
    }
    if (imageB.value) {
        gsap.set(imageB.value, { opacity: 0 });
    }

    window.addEventListener('keydown', (e) => {
        if (e.key === 'ArrowRight' || e.key === 'ArrowDown') {
            currentImageIndex.value = (currentImageIndex.value + 1) % totalImages;
            nextTick(() => animateImageAndBgChange());
        } else if (e.key === 'ArrowLeft' || e.key === 'ArrowUp') {
            currentImageIndex.value = (currentImageIndex.value - 1 + totalImages) % totalImages;
            nextTick(() => animateImageAndBgChange());
        }
    });

    if (descriptionPanel.value) {
        gsap.from(descriptionPanel.value, {
            x: 50,
            opacity: 0,
            duration: 0.8,
            delay: 0.1,
            ease: 'power2.out'
        });
    }
});
</script>

<style scoped lang="postcss"></style>