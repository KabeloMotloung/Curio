<script setup lang="ts">

</script>

<template>
  <div class="fixed top-4 left-4 z-50">
    <button
        @click="$router.back()"
        class="text-gray-800 hover:text-black transition-all duration-300 flex items-center gap-2 group bg-white px-4 py-2 rounded-lg shadow-md hover:shadow-lg border border-gray-200"
    >
      <svg
          class="w-6 h-6 transform group-hover:-translate-x-1 transition-transform duration-300"
          fill="none"
          stroke="currentColor"
          viewBox="0 0 24 24"
      >
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M15 19l-7-7 7-7" />
      </svg>
      <span class="text-sm font-light tracking-[0.25em] uppercase font-['Raleway'] leading-none">Back</span>
    </button>
  </div>
</template>

<style scoped>

</style>
