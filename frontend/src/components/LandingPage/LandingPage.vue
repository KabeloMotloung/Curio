<script setup>
import imgUrl from '../../assets/LandingPage/ImageOfMuseum.jpeg'
</script>

<template>
    <img :src="imgUrl" alt="Image of Museum" class="image-of-museum" />
</template>

<style>
.image-of-museum {
    width: 100%;
    height: 85vh;
    z-index: -1; 
    
    filter: blur(5px); 
}
</style>

/* object-fit: cover; */
/* object-position: center; */
/* position: absolute; */