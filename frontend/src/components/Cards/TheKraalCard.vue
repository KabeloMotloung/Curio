<!-- <template>
    <button @click="onClick" class="image-button">
    </button>
  </template>
  
  <script>
 
  export default {
    methods: {
      onClick() {
        this.$router.push('/the-kraal');
      }
    }
  }
  </script>
  
  <style scoped>

    .image-button {
        background-image: url('../../assets/Cards/TheKraalImage.jpg'); /* Use your image URL here */
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

  </style> -->

  

  <template>
    <button @click="onClick" class="image-button">
      <div class="card-content">
        <p class="description">Spindle Whorl</p>
      </div>
    </button>
  </template>
  
  <script>
  export default {
    methods: {
      onClick() {
        this.$router.push('/the-kraal');
      }
    }
  }
  </script>
  
  <style scoped>
  .image-button {
    position: relative;
    background-image: url('../../assets/Cards/TheKraalImage.jpg');
    background-size: cover;
    background-position: center;
    border: none;
    color: white;
    font-size: 16px;
    cursor: pointer;
    width: 100px;
    height: 700px;
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