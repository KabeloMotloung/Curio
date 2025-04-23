
  <template>
    <button @click="onClick" class="image-button">
      <div class="card-content">
        <p class="description">description</p>
      </div>
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
    position: relative;
    background-image: url('../../assets/Cards/PangolinAndCrocodileImage.png');
    background-size: cover;
    background-position: center;
    border: none;
    color: white;
    font-size: 16px;
    cursor: pointer;
    width: 100px;
    height: 50%;
    border-radius: 5px;
    transition: transform 0.3s;
    display: flex;
    align-items: flex-end; /* Push description to the bottom */
    justify-content: center;
    padding: 0;
    overflow: hidden;
  }
  
  .image-button:hover {
    transform: scale(1.05);
  }
  
  .card-content {
    background: rgba(0, 0, 0, 0.6); /* Semi-transparent overlay */
    width: 100%;
    text-align: center;
    padding: 10px;
  }
  
  .description {
    margin: 0;
    font-weight: bold;
  }
  </style>