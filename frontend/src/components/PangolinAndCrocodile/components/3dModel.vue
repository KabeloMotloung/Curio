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
import { GLTFLoader } from 'three/examples/jsm/loaders/GLTFLoader.js';
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls.js';

const container = ref(null);
const status = ref('');
const error = ref('');
const wireframe = ref(false);
const showGrid = ref(true);
let scene, camera, renderer, controls, animationFrameId;
let model = null;

const showInstructions = ref(true);
const showInteractionHint = ref(true);

const toggleInstructions = () => {
  showInstructions.value = !showInstructions.value;
};

onMounted(() => {
  initScene();
  loadModel();
  animate();

  window.addEventListener('resize', onWindowResize);
});

onUnmounted(() => {
  cancelAnimationFrame(animationFrameId);
  window.removeEventListener('resize', onWindowResize);
  if (renderer) {
    renderer.dispose();
  }
});

function initScene() {
  status.value = 'Initializing scene...';
  
  // Create scene
  scene = new THREE.Scene();
  scene.background = new THREE.Color(0xf0f0f0);
  
  // Create camera
  camera = new THREE.PerspectiveCamera(
    45,
    container.value.clientWidth / container.value.clientHeight,
    0.1,
    1000
  );
  camera.position.set(0, 0, 25);
  
  // Create renderer
  renderer = new THREE.WebGLRenderer({ antialias: true });
  renderer.setSize(container.value.clientWidth, container.value.clientHeight);
  renderer.setPixelRatio(window.devicePixelRatio);
  renderer.outputEncoding = THREE.sRGBEncoding;
  container.value.appendChild(renderer.domElement);
  
  // Add lights
  const ambientLight = new THREE.AmbientLight(0xffffff, 0.8);
  scene.add(ambientLight);
  
  const directionalLight = new THREE.DirectionalLight(0xffffff, 1);
  directionalLight.position.set(1, 1, 1);
  scene.add(directionalLight);
  
  const bottomLight = new THREE.DirectionalLight(0xffffff, 0.5);
  bottomLight.position.set(0, -10, 0);
  scene.add(bottomLight);
  
  // Add controls
  controls = new OrbitControls(camera, renderer.domElement);
  controls.enableDamping = true;
  controls.dampingFactor = 0.05;
  controls.maxPolarAngle = Math.PI;
  controls.screenSpacePanning = true;
  
  status.value = 'Scene initialized';
}

function loadModel() {
  status.value = 'Loading model...';
  
  const geometry = new THREE.BoxGeometry(1, 1, 1);
  const material = new THREE.MeshBasicMaterial({ color: 0x00ff00, wireframe: true });
  const cube = new THREE.Mesh(geometry, material);
  scene.add(cube);
  
  const modelPath = '/models/pangolin/pangolin.glb';
  

  const loadingManager = new THREE.LoadingManager();
  loadingManager.onError = function(url) {
    error.value = `Error loading model: ${url}`;
    console.error('Error loading model:', url);
  };
  
  const gltfLoader = new GLTFLoader(loadingManager);
  
  gltfLoader.load(
    modelPath,

    (gltf) => {
      scene.remove(cube);
      model = gltf.scene;
      
      
 
      model.traverse(child => {
        if (child.isMesh) {
          child.userData.originalMaterial = child.material;
        }
      });
      

      const box = new THREE.Box3().setFromObject(model);
      const size = box.getSize(new THREE.Vector3());
      const center = box.getCenter(new THREE.Vector3());
      
      const maxDim = Math.max(size.x, size.y, size.z);
      const scale = 10 / maxDim;
      model.scale.set(scale, scale, scale);
      
      model.position.x = -center.x * scale;
      model.position.y = -center.y * scale;
      model.position.z = -center.z * scale;
      
      scene.add(model);
      
      controls.target.set(0, 0, 0);
      controls.update();
      
      status.value = 'Model loaded successfully';
    },

    (xhr) => {
      if (xhr.lengthComputable) {
        const loadingPercentage = Math.round((xhr.loaded / xhr.total) * 100);
        status.value = `Loading model: ${loadingPercentage}%`;
      }
    },

    (err) => {
      error.value = `Error loading model: ${err.message || 'Unknown error'}`;
      console.error('Error loading model:', err);
    }
  );
}

function toggleWireframe() {
  wireframe.value = !wireframe.value;
  
  if (model) {
    model.traverse(child => {
      if (child.isMesh) {
        if (wireframe.value) {
          child.material = new THREE.MeshBasicMaterial({
            color: 0x000000,
            wireframe: true
          });
        } else {
          child.material = child.userData.originalMaterial;
        }
      }
    });
  }
}

function toggleGrid() {
  showGrid.value = !showGrid.value;
}

function animate() {
  animationFrameId = requestAnimationFrame(animate);
  
  if (controls) controls.update();
  if (renderer && scene && camera) renderer.render(scene, camera);
}

function onWindowResize() {
  if (container.value && camera && renderer) {
    camera.aspect = container.value.clientWidth / container.value.clientHeight;
    camera.updateProjectionMatrix();
    renderer.setSize(container.value.clientWidth, container.value.clientHeight);
  }
}
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
