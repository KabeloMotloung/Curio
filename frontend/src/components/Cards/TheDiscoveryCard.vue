<template>
    <div class="card">
      <img :src=imgUrl alt="Card image" class="card-image" />
      <div class="card-content">
        <h2 class="card-title">{{ title }}</h2>
        <p class="card-description">{{ description }}</p>
        <button class="card-button" @click="onClick">{{ buttonText }}</button>
      </div>
    </div>
  </template>
  
  <script>
  import imgUrl from '../../assets/Cards/TheDiscoverImage.jpg'
  export default {
    props: {
      image: {
        type: String,
        required: true
      },
      title: {
        type: String,
        required: true
      },
      description: {
        type: String,
        required: true
      },
      buttonText: {
        type: String,
        default: 'Click Me'
      }
    },
    methods: {
      onClick() {
        this.$emit('button-click');
      }
    }
  }
  </script>
  
  <style scoped>
  .card {
    border: 1px solid #ccc;
    border-radius: 8px;
    overflow: hidden;
    max-width: 300px;
    box-shadow: 2px 2px 12px rgba(0, 0, 0, 0.1);
  }
  .card-image {
    width: 100%;
    height: auto;
  }
  .card-content {
    padding: 16px;
  }
  .card-title {
    font-size: 1.5em;
    margin: 0;
  }
  .card-description {
    color: #666;
  }
  .card-button {
    background-color: #007BFF;
    color: white;
    border: none;
    padding: 10px 15px;
    border-radius: 5px;
    cursor: pointer;
  }
  .card-button:hover {
    background-color: #0056b3;
  }
  </style>