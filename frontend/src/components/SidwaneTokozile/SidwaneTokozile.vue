<template>
  <BackButton />
    <div class="min-h-screen w-full bg-gradient-to-br from-amber-900 via-zinc-800 to-gray-800 text-white overflow-x-hidden">
        <!-- Decorative Elements -->
        <div class="fixed top-0 left-0 w-full h-full pointer-events-none">
            <!-- Coffee Beans with Parallax -->
            <div v-for="(bean, index) in coffeeBeans" 
                :key="index"
                :class="`coffee-bean-${index}`"
                class="absolute opacity-20 will-change-transform"
                :style="{
                    left: `${bean.x}%`,
                    top: `${bean.y}%`,
                    transform: `rotate(${bean.rotation}deg) scale(${bean.scale})`
                }"
            >
                <img src="./assets/coffee-bean.png" alt="Coffee Bean" class="w-16 h-16" />
            </div>

            <div class="absolute top-0 left-0 w-1 h-32 bg-gradient-to-b from-amber-500/20 to-transparent"></div>
            <div class="absolute top-0 right-0 w-1 h-32 bg-gradient-to-b from-amber-500/20 to-transparent"></div>
            <div class="absolute bottom-0 left-0 w-1 h-32 bg-gradient-to-t from-amber-500/20 to-transparent"></div>
            <div class="absolute bottom-0 right-0 w-1 h-32 bg-gradient-to-t from-amber-500/20 to-transparent"></div>
            
            <!-- Section Indicators -->
            <div class="absolute right-8 top-1/2 transform -translate-y-1/2 flex flex-col gap-4">
                <div v-for="(_, index) in totalSections" 
                    :key="index"
                    class="w-2 h-2 rounded-full transition-all duration-300"
                    :class="currentSection === index ? 'bg-amber-500 scale-150' : 'bg-amber-500/30'"
                ></div>
            </div>
        </div>

        <!-- Main content section -->
        <div class="h-screen w-full flex items-start p-8 relative">
            <!-- Title section -->
            <div class="w-1/2">
                <h1 ref="title" class="text-[140px] font-serif tracking-tight">
                    Sidwane Tokozile "The Coffee Drinker"
                </h1>
                <p class="text-xl mt-4 text-amber-200/80">Anton van Wouw, 1907</p>
                <div class="mt-8 flex items-center gap-4">
                    <span class="text-amber-200/60">Bronze Sculpture</span>
                    <div class="w-8 h-px bg-amber-200/30"></div>
                    <span class="text-amber-200/60">South African Art</span>
                </div>
            </div>
            
            <!-- Image section -->
            <div class="w-1/2 h-full flex items-center justify-center">
                <div class="relative group">
                    <img ref="image" :src="frontImage" alt="Sidwane Tokozile" class="max-h-[80vh] hover:scale-105 transition-transform duration-500" />
                </div>
            </div>
            
            <!-- Scroll indicator -->
            <div ref="scrollIndicator" class="absolute bottom-8 left-1/2 transform -translate-x-1/2 flex flex-col items-center gap-2">
                <span class="text-lg tracking-widest font-light text-amber-200/80">SCROLL TO VIEW</span>
                <div class="w-8 h-12">
                    <svg ref="arrow" class="w-full h-full" viewBox="0 0 24 24" fill="none"
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            xmlns="http://www.w3.org/2000/svg">
                        <path d="M12 5L12 19M12 19L19 12M12 19L5 12" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                stroke-linejoin="round" />
                    </svg>
                </div>
            </div>
        </div>
       
        <!-- Scroll-triggered sections -->
        <div class="relative">
            <!-- Artist Section -->
            <section class="h-screen flex items-center justify-center px-16">
                <div class="flex flex-row items-center w-full max-w-6xl">
                    <div class="w-1/2">
                        <div class="relative group">
                            <img :src="artistImage" alt="Anton van Wouw" class="max-h-[80vh] mx-auto hover:scale-105 transition-transform duration-500" />
                        </div>
                    </div>
                    <div class="w-1/2 text-left px-8">
                        <h2 class="text-4xl mb-4 font-serif">Anton van Wouw</h2>
                        <div class="relative">
                            <div class="absolute left-0 top-0 w-1 h-full bg-amber-500/20"></div>
                            <p class="text-lg leading-relaxed pl-6">
                                Considered the 'father of South African sculpture', Anton van Wouw created an extraordinary and era-defining body of work, ranging from monumental to small-scale bronzes. His smaller works achieved sculptural expression at a level that his monumental works rarely did.
                            </p>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Historical Context Section -->
            <section class="h-screen flex items-center justify-center px-16">
                <div class="flex flex-row-reverse items-center w-full max-w-6xl">
                    <div class="w-1/2">
                        <div class="relative group">
                            <img :src="angleImage" alt="Historical Context" class="max-h-[80vh] mx-auto hover:scale-105 transition-transform duration-500" />
                        </div>
                    </div>
                    <div class="w-1/2 text-left px-8">
                        <h2 class="text-4xl mb-4 font-serif">Historical Context</h2>
                        <div class="relative">
                            <div class="absolute left-0 top-0 w-1 h-full bg-amber-500/20"></div>
                            <p class="text-lg leading-relaxed pl-6">
                                Van Wouw grew to have a deep respect for the Boer nation during his stay in the wilderness. This admiration significantly impacted his artistic growth as he related to their tribulations and aspirations.
                            </p>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Sculpture Details Section -->
            <section class="h-screen flex items-center justify-center px-16">
                <div class="flex flex-row items-center w-full max-w-6xl">
                    <div class="w-1/2">
                        <div class="relative group">
                            <img :src="closeImage" alt="Sculpture Details" class="max-h-[80vh] mx-auto hover:scale-105 transition-transform duration-500" />
                        </div>
                    </div>
                    <div class="w-1/2 text-left px-8">
                        <h2 class="text-4xl mb-4 font-serif">The Sculpture</h2>
                        <div class="relative">
                            <div class="absolute left-0 top-0 w-1 h-full bg-amber-500/20"></div>
                            <p class="text-lg leading-relaxed pl-6">
                                Sidwane Tokozile's slumped position conveys humble resignation as he clasps both hands around a mug. Wearing a head cloth and a tattered shirt that is torn on the left, "the utter poverty and humble thankfulness for the cup of coffee is well represented."
                            </p>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Additional Images Title Section -->
            <section class="h-screen flex items-center justify-center px-16">
                <div class="w-full max-w-6xl text-center">
                    <h2 class="text-6xl font-serif mb-8">Additional Images</h2>
                    <div class="relative mx-auto max-w-2xl">
                        <div class="absolute left-0 top-0 w-1 h-full bg-amber-500/20"></div>
                        <p class="text-lg leading-relaxed pl-6">
                            Explore different perspectives of Sidwane Tokozile through these detailed views of the sculpture.
                        </p>
                    </div>
                </div>
            </section>

            <!-- Additional Images -->
            <section v-for="(image, index) in additionalImages" 
                :key="index" 
                :ref="'section' + (index + 3)" 
                class="h-screen flex items-center justify-center px-16"
            >
                <div :class="index % 2 === 0 ? 'flex flex-row items-center' : 'flex flex-row-reverse items-center'"
                    class="w-full max-w-6xl">
                    <div class="w-1/2">
                        <div class="relative group">
                            <img :src="image.src" :alt="image.alt" class="max-h-[80vh] mx-auto hover:scale-105 transition-transform duration-500" />
                        </div>
                    </div>
                    <div class="w-1/2 text-center px-8">
                        <p class="mt-4 text-amber-200/80">{{ image.caption }}</p>
                    </div>
                </div>
            </section>
        </div>
    </div>
</template>


<script setup>
import { onMounted, ref, onUnmounted } from 'vue'
import gsap from 'gsap'
import ScrollTrigger from 'gsap/ScrollTrigger'
import frontImage from './assets/front.png'
import artistImage from './assets/artist.jpg'
import angleImage from './assets/angle.png'
import closeImage from './assets/close.png'
import angle2Image from './assets/angle2.png'
import sideImage from './assets/side.png'
import side2Image from './assets/side2.png'
import BackButton from "../UniversalComponents/BackButton.vue";

gsap.registerPlugin(ScrollTrigger)

const title = ref(null)
const image = ref(null)
const scrollIndicator = ref(null)
const arrow = ref(null)
const currentSection = ref(0)
const totalSections = ref(7) // Total number of sections including main, additional images title, and additional images

const additionalImages = [
    { src: angle2Image, alt: 'Full View'},
    { src: sideImage, alt: 'Face View'},
    { src: side2Image, alt: 'Side View'},
]

// Coffee beans data
const coffeeBeans = ref([
    { x: 5, y: 10, rotation: 45, scale: 1.5, speed: 0.3 },
    { x: 25, y: 30, rotation: -30, scale: 1.2, speed: 0.4 },
    { x: 65, y: 20, rotation: 60, scale: 1.8, speed: 0.5 },
    { x: 80, y: 50, rotation: -15, scale: 1.3, speed: 0.35 },
    { x: 35, y: 70, rotation: 90, scale: 1.6, speed: 0.45 },
    { x: 15, y: 40, rotation: 120, scale: 1.4, speed: 0.25 },
    { x: 55, y: 15, rotation: -60, scale: 1.7, speed: 0.55 },
    { x: 75, y: 80, rotation: 30, scale: 1.1, speed: 0.4 },
    { x: 45, y: 60, rotation: -90, scale: 1.9, speed: 0.3 },
    { x: 90, y: 25, rotation: 15, scale: 1.5, speed: 0.45 }
])

// Update current section based on scroll position
const updateCurrentSection = () => {
    const sections = document.querySelectorAll('section')
    const scrollPosition = window.scrollY + window.innerHeight / 2
    
    sections.forEach((section, index) => {
        const sectionTop = section.offsetTop
        const sectionHeight = section.offsetHeight
        
        if (scrollPosition >= sectionTop && scrollPosition < sectionTop + sectionHeight) {
            currentSection.value = index
        }
    })
}

onMounted(() => {
    // Initial animation for title and image
    gsap.from(title.value, {
        duration: 1.5,
        x: -100,
        opacity: 0,
        ease: 'power3.out',
        delay: 0.5
    })

    gsap.from(image.value, {
        duration: 1,
        x: 100,
        opacity: 0,
        ease: 'power3.out',
    })

    gsap.to(arrow.value, {
        duration: 1,
        repeat: -1,
        yoyo: true,
        ease: 'power1.inOut'
    })

    coffeeBeans.value.forEach((bean, index) => {
        const element = document.querySelector(`.coffee-bean-${index}`)
        if (element) {
            gsap.to(element, {
                scrollTrigger: {
                    trigger: document.documentElement,
                    start: 'top top',
                    end: 'bottom bottom',
                    scrub: 0.5,
                    invalidateOnRefresh: true
                },
                y: `${bean.speed * 500}px`,
                ease: 'none'
            })
        }
    })

    document.querySelectorAll('section').forEach((section, index) => {
        const direction = index % 2 === 0 ? -100 : 100
        
        gsap.from(section, {
            scrollTrigger: {
                trigger: section,
                start: 'top 80%',
                end: 'bottom 60%',
                toggleActions: 'play reverse play reverse',
                scrub: 1
            },
            x: direction,
            opacity: 0,
            ease: 'power2.out'
        })
    })

    // Add scroll event listener for section indicators
    window.addEventListener('scroll', updateCurrentSection)
})

onUnmounted(() => {
    window.removeEventListener('scroll', updateCurrentSection)
})
</script>

<style scoped>
@font-face {
    font-family: 'Playfair Display';
    font-style: normal;
    font-weight: 400;
    src: url('/fonts/Playfair_Display/static/PlayfairDisplay-Regular.ttf') format('truetype');
    font-display: swap;
}

@font-face {
    font-family: 'Playfair Display';
    font-style: normal;
    font-weight: 700;
    src: url('/fonts/Playfair_Display/static/PlayfairDisplay-Bold.ttf') format('truetype');
    font-display: swap;
}

.font-serif {
    font-family: 'Playfair Display', serif;
}

/* Enhanced transitions */
img {
    transition: transform 0.5s cubic-bezier(0.4, 0, 0.2, 1);
}

img:hover {
    transform: scale(1.05);
}

/* Smooth scroll behavior */
html {
    scroll-behavior: smooth;
}
</style>
