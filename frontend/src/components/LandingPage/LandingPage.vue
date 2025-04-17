<script setup>
import imgUrl from '../../assets/LandingPage/ImageOfMuseum.jpeg';
import TheDiscoveryCard from '../Cards/TheDiscoveryCard.vue';
</script>

<template>
        <div class="card-container">
            <TheDiscoveryCard />
            <TheDiscoveryCard />
        </div>
  
</template>

<style>

.card-container {
    display: flex;
    gap: 10%;
}

body {
    background-image: url('../../assets/LandingPage/ImageOfMuseum.jpeg'); /* Use your image URL here */
    background-size: cover; /* Makes the background image cover the entire page */
    background-position: center; /* Centers the background image */
    background-repeat: no-repeat; /* Prevents the image from repeating */
    margin: 0; /* Removes default margin */
    height: 100vh; /* Ensures body takes full viewport height */
 
}

.card-container {
    display: flex;
    gap: 10px; /* Space between cards */
    position: relative; /* Ensure cards are positioned above the background */
    z-index: 1; /* Bring cards in front of the background */
}
</style>
