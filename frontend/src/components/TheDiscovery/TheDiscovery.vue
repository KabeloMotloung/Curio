<!-- <script setup>
import imgUrl from '../../assets/TheDiscovery/TheDiscoveryPaintingImage.jpg'
</script>

<template>
    <img :src="imgUrl" alt="The Discovery" class="discovery-image" />
</template> -->


<template>
  <div class="scroll-container">
    <div class="content-wrapper">
      <div class="text-section">
        <p>
          <strong>Discovery</strong> is formidable in the first instance for its imposing size. Three metres high by 13 metres long, the mural occupied a full wall of the TPA boardroom and required almost 150 kilograms of oil paint. The biggest stretch of canvas then commercially available was ten metres long, so Preller decided to split the mural into three panels. This suited his theme for the work, which was originally entitled <em>The Discovery of the Sea Route Around Africa</em>.
        </p>
        <p>
          The mural depicts an imagined encounter of colonial European and Eastern explorers with sophisticated African civilisations. Marvelling at humankind’s desire to travel to the stars, Preller outlined his intention for the work, referring to himself in the third person: ‘This theme has given him the opportunity to convey a concept of the entire continent of Africa. Implicit in the design are the forests, the mountains, the volcanoes, the waterfalls, the lakes, rivers and deserts and tribes of Africa.’ He envisioned the painting as a kind of Renaissance colonial fantasy, drawing on themes and images from the 15th century. Colonial explorers frame the large central tableau that features indigenous inhabitants, the arts, and SPIRITUAL elements in Preller’s characteristically cosmological style.
        </p>
        <p>
          The presentation of indigenous cultures in an unquestionably western manner may have been intended by Preller to unsettle his mostly white audience, reminding them of the condescending manner in which 17th-century explorers viewed Africa.
        </p>
        <p><em>Artwork courtesy of Gauteng Department of Infrastructure.</em></p>
      </div>
      <div ref="scrollSection" class="scroll-section">
        <img
            v-for="(image, index) in images"
            :key="index"
            :src="image"
            alt="Scrolling"
            class="scroll-image"
        />
      </div>
    </div>
  </div>
</template>

<script setup>
import {onMounted, ref} from 'vue'
import {gsap} from 'gsap'
import {ScrollTrigger} from 'gsap/ScrollTrigger'

gsap.registerPlugin(ScrollTrigger)

const scrollSection = ref(null)

const images = [
  new URL('./assets/row-1-column-1.jpg', import.meta.url).href,
  new URL('./assets/row-1-column-2.jpg', import.meta.url).href,
  new URL('./assets/row-1-column-3.jpg', import.meta.url).href,
  // Add more images as needed
]

onMounted(() => {
  const section = scrollSection.value
  const scrollWidth = section.scrollWidth
  const windowWidth = window.innerWidth

  gsap.to(section, {
    x: () => -(scrollWidth - windowWidth),
    ease: 'none',
    scrollTrigger: {
      trigger: section,
      start: 'top top',
      end: () => `+=${scrollWidth}`,
      scrub: true,
      pin: true,
      anticipatePin: 1
    }
  })
})
</script>

.scroll-container {
height: 100vh;
overflow: hidden;
}

.content-wrapper {
display: flex;
height: 100vh;
}

.text-section {
width: 40vw;
padding: 2rem;
overflow-y: auto;
background-color: #f8f8f8;
font-size: 1rem;
line-height: 1.6;
}

.scroll-section {
display: flex;
width: max-content;
height: 100vh;
}

.scroll-image {
height: 100vh;
width: auto;
object-fit: cover;
}