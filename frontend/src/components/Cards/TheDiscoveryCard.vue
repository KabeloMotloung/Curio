<template>
  <button @click="onClick" class="image-button" :style="buttonStyle">
  </button>
</template>

<script>
export default {
  props: {
    imageUrl: {
      type: String,
      required: true
    }
  },
  computed: {
    buttonStyle() {
      return {
        backgroundImage: `url(${this.imageUrl})`
      };
    }
  },
  methods: {
    onClick() {
      this.$router.push('/the-discovery');
    }
  }
}
</script>

<style scoped>
.image-button {
  background-size: contain;
  background-position: center;
  background-repeat: no-repeat;
  background-color: rgba(0, 0, 0, 0.2);
  border: none;
  color: white;
  font-size: 16px;
  padding: 0;              
  cursor: pointer;
  border-radius: 5px;
  transition: transform 0.3s;
  height: 40vh;           
  width: 80vw;             
  max-width: 500px;        
  display: block;
  margin: 0 auto;
}

.image-button:hover {
  transform: scale(1.05);
}
</style>
