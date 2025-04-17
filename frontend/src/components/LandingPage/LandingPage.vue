<script setup>
import imgUrl from '../../assets/LandingPage/ImageOfMuseum.jpeg'
</script>

<template>
    <img :src="imgUrl" alt="Image of Museum" class="image-of-museum" />
</template>

<style>
.image-of-museum {
    width: 100%;
    height: 90vh;
    /* object-fit: cover; */
    /* object-position: center; */
    /* position: absolute; */
    z-index: -1; /* Ensure the image is behind other content */
    filter: blur(5px); /* Adjust the blur amount here */
}
</style>