<template>
    <button @click="onClick" class="image-button">
      <!-- <img :src=imgUrl alt="Card image" class="card-image" />
      <div class="card-content">
        <h2 class="card-title">{{ title }}</h2>
        <p class="card-description">{{ description }}</p>
         <button class="card-button" @click="onClick">{{ buttonText }}</button>
      </div> -->
    </button>
  </template>
  
  <script>
  import imgUrl from '../../assets/Cards/TheDiscoverImage.jpg'
 
  export default {
    methods: {
      onClick() {
        this.$router.push('/the-discovery');
      }
    }
  }
  </script>
  
  <style scoped>

    .image-button {
        background-image: url('../../assets/Cards/TheDiscoverImage.jpg'); /* Use your image URL here */
        background-size: cover; /* Cover the entire button */
        background-position: center; /* Center the image */
        border: none; /* Remove default border */
        color: white; /* Text color */
        font-size: 16px; /* Font size */
        padding: 10px 20px; /* Padding around the text */
        cursor: pointer; /* Change cursor on hover */
        width: 350px; /* Set a width if needed */
        height: 200px; /* Set a height if needed */
        border-radius: 5px; /* Optional: rounded corners */
        transition: transform 0.3s; /* Optional: smooth hover effect */
    }

    .image-button:hover {
        transform: scale(1.05); /* Optional: scale effect on hover */
    }

  </style>