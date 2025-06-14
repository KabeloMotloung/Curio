<template>
  <div class="flex justify-center items-center h-screen bg-[#f5e9d9]">
    <div class="relative w-3/4 max-w-lg h-3/4 bg-white shadow-lg rounded-lg overflow-hidden border border-[#33261e]">
      <div ref="container" class="w-full h-full"></div>
      
      <!-- Control Instructions -->
      <div class="absolute bottom-4 left-4 right-4 bg-white/90 p-4 rounded-lg shadow-lg border border-[#33261e]/20">
        <div class="flex items-center justify-between mb-2">
          <h3 class="text-[#33261e] font-semibold">Model Controls</h3>
          <button @click="toggleInstructions" class="text-[#33261e] hover:text-[#6b4226] transition-colors">
            <span v-if="showInstructions">▼</span>
            <span v-else>▲</span>
          </button>
        </div>
        <div v-if="showInstructions" class="space-y-2 text-sm text-[#33261e]">
          <div class="flex items-center gap-2">
            <span class="control-icon">🖱️</span>
            <span>Click & drag to rotate</span>
          </div>
          <div class="flex items-center gap-2">
            <span class="control-icon">⌨️</span>
            <span>Scroll to zoom in/out</span>
          </div>
          <div class="flex items-center gap-2">
            <span class="control-icon">🖱️</span>
            <span>Right-click & drag to pan</span>
          </div>
        </div>
      </div>

      <!-- Interaction Hint -->
      <div v-if="showInteractionHint" 
           class="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 
                  bg-white/90 p-4 rounded-lg shadow-lg border border-[#33261e]/20
                  animate-fade-out">
        <div class="flex items-center gap-2">
          <span class="text-2xl">👆</span>
          <span class="text-[#33261e]">Try moving the model</span>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue';
import * as THREE from 'three';
import { MTLLoader } from 'three/examples/jsm/loaders/MTLLoader.js';
import { OBJLoader } from 'three/examples/jsm/loaders/OBJLoader.js';
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls.js';

const container = ref(null);
let scene, camera, renderer, animationFrameId;
const showInstructions = ref(true);
const showInteractionHint = ref(true);

const toggleInstructions = () => {
  showInstructions.value = !showInstructions.value;
};

onMounted(() => {
  scene = new THREE.Scene();
  scene.background = new THREE.Color(0xffffff);

  camera = new THREE.PerspectiveCamera(
    75,
    container.value.clientWidth / container.value.clientHeight,
    0.1,
    1000
  );
  camera.position.z = 5;

  renderer = new THREE.WebGLRenderer({ antialias: true });
  renderer.setSize(container.value.clientWidth, container.value.clientHeight);
  container.value.appendChild(renderer.domElement);

  const ambientLight = new THREE.AmbientLight(0xffffff, 1.5);
  const directionalLight = new THREE.DirectionalLight(0xffffff, 1.2);
  directionalLight.position.set(0, 1, 1);
  scene.add(ambientLight, directionalLight);

  const mtlLoader = new MTLLoader();
  mtlLoader.setPath('/models/sidwane/');
  mtlLoader.load('sidwane.mtl', (materials) => {
    materials.preload();

    const objLoader = new OBJLoader();
    objLoader.setMaterials(materials);
    objLoader.setPath('/models/sidwane/');
    objLoader.load('sidwane.obj', (object) => {
      object.scale.set(15, 15, 15);
      scene.add(object);
    });
  });

  const controls = new OrbitControls(camera, renderer.domElement);
  controls.enableDamping = true;
  controls.dampingFactor = 0.05;
  controls.screenSpacePanning = false;
  controls.minDistance = 1;
  controls.maxDistance = 500;

  // Add event listeners for interaction
  controls.addEventListener('start', () => {
    showInteractionHint.value = false;
  });

  // Hide interaction hint after 5 seconds
  setTimeout(() => {
    showInteractionHint.value = false;
  }, 5000);

  const animate = () => {
    animationFrameId = requestAnimationFrame(animate);
    controls.update();
    renderer.render(scene, camera);
  };
  animate();

  window.addEventListener('resize', () => {
    camera.aspect = container.value.clientWidth / container.value.clientHeight;
    camera.updateProjectionMatrix();
    renderer.setSize(container.value.clientWidth, container.value.clientHeight);
  });
});

onUnmounted(() => {
  cancelAnimationFrame(animationFrameId);
  renderer.dispose();
});
</script>

<style scoped>
.control-icon {
  font-size: 1.2em;
  min-width: 24px;
  text-align: center;
}

@keyframes fadeOut {
  from { opacity: 1; }
  to { opacity: 0; }
}

.animate-fade-out {
  animation: fadeOut 1s ease-in-out forwards;
  animation-delay: 4s;
}
</style>
