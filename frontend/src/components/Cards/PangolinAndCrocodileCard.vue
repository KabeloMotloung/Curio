<template>
    <button @click="onClick" class="image-button">
    </button>
  </template>
  
  <script>
 
  export default {
    methods: {
      onClick() {
        this.$router.push('/pangolin-and-crocodile');
      }
    }
  }
  </script>
  
  <style scoped>

    .image-button {
        background-image: url('../../assets/Cards/PangolinAndCrocodileImage.png'); /* Use your image URL here */
        background-size: cover; /* Cover the entire button */
        background-position: center; /* Center the image */
        border: none; /* Remove default border */
        color: white; /* Text color */
        font-size: 16px; /* Font size */
        padding: 10px 20px; /* Padding around the text */
        cursor: pointer; /* Change cursor on hover */
        width: 150px; /* Set a width if needed */
        height: 400px; /* Set a height if needed */
        border-radius: 5px; /* Optional: rounded corners */
        transition: transform 0.3s; /* Optional: smooth hover effect */
    }

    .image-button:hover {
        transform: scale(1.05); /* Optional: scale effect on hover */
    }

  </style>