<template>
  <button @click="onClick" class="image-button">
</button>
</template>

<script>
export default {
  methods: {
    onClick() {
      this.$router.push('/sidwane-tokozile');
    }
  }
}
</script>

<style scoped>
  .image-button {
    background-image: url('./assets/SidwaneTokozileImage.png');
    background-size: contain;
    background-position: center;
    background-repeat: no-repeat;
    background-color: rgba(0, 0, 0, 0.2);
    border: none;
    color: white;
    font-size: 16px;
    padding: 10px 20px;
    cursor: pointer;
    width: 100%;
    height: 100%;
    border-radius: 5px;
    transition: transform 0.3s;
  }

  .image-button:hover {
    transform: scale(1.05);
  }
</style>