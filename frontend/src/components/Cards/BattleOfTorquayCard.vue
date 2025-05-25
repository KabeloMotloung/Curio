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
      this.$router.push('/battle-of-torquay');
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
  padding: 0;              /* Remove extra padding */
  cursor: pointer;
  border-radius: 5px;
  transition: transform 0.3s;
  height: 320px;           /* Increase height */
  width: 90vw;             /* Responsive width for mobile */
  max-width: 500px;        /* Limit max width for desktop */
  display: block;
  margin: 0 auto;
}

.image-button:hover {
  transform: scale(1.05);
}
</style>
