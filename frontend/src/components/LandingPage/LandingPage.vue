<script setup>
import imgUrl from '../../assets/LandingPage/ImageOfMuseum.jpeg';
import TheDiscoveryCard from '../Cards/TheDiscoveryCard.vue';
</script>

<template>
    <div class="background-blur"></div>
    <div class="card-container">
        <TheDiscoveryCard />
        <!-- <TheDiscoveryCard /> -->
    </div>
</template>

<style>
body {
    margin: 0; /* Removes default margin */
    height: 100vh; /* Ensures body takes full viewport height */
    overflow: hidden; /* Prevents scrolling */
}

.background-blur {
    position: fixed; /* Fix the background blur to the viewport */
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-image: url('../../assets/LandingPage/ImageOfMuseum.jpeg'); /* Use your image URL here */
    background-size: cover; /* Makes the background image cover the entire page */
    background-position: center; /* Centers the background image */
    background-repeat: no-repeat; /* Prevents the image from repeating */
    filter: blur(10px); /* Adjust the blur amount as needed */
    z-index: 0; /* Send it to the back */
}

.card-container {
    display: flex;
    gap: 50px; /* Space between cards */
    position: relative; /* Ensure cards are positioned above the background */
    z-index: 1; /* Bring cards in front of the background */
}
</style>



<!-- <script setup>
import imgUrl from '../../assets/LandingPage/ImageOfMuseum.jpeg';
import TheDiscoveryCard from '../Cards/TheDiscoveryCard.vue';
</script>

<template>
        <div class="card-container">
            <TheDiscoveryCard />
          
        </div>
  
</template>

<style>

body {
    background-image: url('../../assets/LandingPage/ImageOfMuseum.jpeg'); 
    background-size: cover; 
    background-position: center; 
    background-repeat: no-repeat;
    margin: 0; 
    height: 80vh;
 
}

.card-container {
    display: flex;
    gap: 50px; 
    position: relative; 
    z-index: 1; 
}
</style> -->


