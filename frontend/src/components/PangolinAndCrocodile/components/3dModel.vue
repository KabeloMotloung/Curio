<template>
  <div class="flex justify-center items-center h-screen bg-gray-100">
    <div class="relative w-3/4 max-w-lg h-3/4 bg-white shadow-lg rounded-lg overflow-hidden border border-gray-300">
      <div ref="container" class="w-full h-full"></div>
      <div v-if="status" class="absolute top-2 left-2 bg-black bg-opacity-50 text-white p-2 rounded">
        {{ status }}
      </div>
      <div v-if="error" class="absolute bottom-2 left-2 bg-red-500 text-white p-2 rounded max-w-full overflow-auto">
        {{ error }}
      </div>
      <div class="absolute top-2 right-2 flex gap-2">
        <button @click="toggleWireframe" class="bg-blue-500 hover:bg-blue-600 text-white px-3 py-1 rounded">
          {{ wireframe ? 'Hide' : 'Show' }} Wireframe
        </button>
        <button @click="toggleGrid" class="bg-blue-500 hover:bg-blue-600 text-white px-3 py-1 rounded">
          {{ showGrid ? 'Hide' : 'Show' }} Grid
        </button>
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
const status = ref('');
const error = ref('');
const wireframe = ref(false);
const showGrid = ref(true);
let scene, camera, renderer, controls, animationFrameId;
let model = null;
let gridHelper, axesHelper;

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
  renderer.outputEncoding = THREE.sRGBEncoding; // Important for correct texture rendering
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
  
  // Add grid helper
  gridHelper = new THREE.GridHelper(20, 20);
  scene.add(gridHelper);
  
  // Add axes helper
  axesHelper = new THREE.AxesHelper(5);
  scene.add(axesHelper);
  
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
  
  // Create placeholder cube
  const geometry = new THREE.BoxGeometry(1, 1, 1);
  const material = new THREE.MeshBasicMaterial({ color: 0x00ff00, wireframe: true });
  const cube = new THREE.Mesh(geometry, material);
  scene.add(cube);
  
  // Debug model path
  const modelPath = '/models/pangolin/';
  console.log(`Loading model from: ${modelPath}`);
  
  // Set up texture loading manager to catch errors
  const loadingManager = new THREE.LoadingManager();
  loadingManager.onError = function(url) {
    error.value = `Error loading texture: ${url}`;
    console.error('Error loading texture:', url);
  };
  
  // Load materials with the manager
  const mtlLoader = new MTLLoader(loadingManager);
  mtlLoader.setPath(modelPath);
  
  // Modify texture path if needed - this is critical for finding textures
  mtlLoader.setMaterialOptions({
    ignoreZeroRGBs: true,
    side: THREE.DoubleSide // Show both sides of faces
  });
  
  // Log the MTL file URL for debugging
  console.log(`Loading MTL from: ${modelPath}panganoli.mtl`);
  
  mtlLoader.load('cleaner.mtl', 
    // onLoad callback
    (materials) => {
      status.value = 'Materials loaded, loading object...';
      materials.preload();
      
      // Debug available materials
      console.log('Materials loaded:', materials);
      
      // Get material names and check for texture maps
      const materialNames = Object.keys(materials.materials);
      console.log('Available materials:', materialNames);
      
      // Check if materials have texture maps
      materialNames.forEach(name => {
        const mat = materials.materials[name];
        console.log(`Material ${name} maps:`, {
          map: mat.map ? mat.map.name : 'None',
          normalMap: mat.normalMap ? mat.normalMap.name : 'None'
        });
      });
      
      // Log image paths for debugging
      if (materials.materialsInfo) {
        console.log('Material info paths:', materials.materialsInfo);
      }
      
      const objLoader = new OBJLoader(loadingManager);
      objLoader.setMaterials(materials);
      objLoader.setPath(modelPath);
      
      objLoader.load('cleaner.obj',
        // onLoad callback 
        (object) => {
          scene.remove(cube); // Remove placeholder
          model = object;
          
          // Debug object materials
          object.traverse(child => {
            if (child.isMesh) {
              console.log('Mesh found:', child.name);
              console.log('Material:', child.material);
              
              // Store original materials for later
              child.userData.originalMaterial = child.material;
            }
          });
          
          // Scale and center model
          const box = new THREE.Box3().setFromObject(object);
          const size = box.getSize(new THREE.Vector3());
          const center = box.getCenter(new THREE.Vector3());
          
          const maxDim = Math.max(size.x, size.y, size.z);
          const scale = 10 / maxDim;
          object.scale.set(scale, scale, scale);
          
          object.position.x = -center.x * scale;
          object.position.y = -center.y * scale;
          object.position.z = -center.z * scale;
          
          scene.add(object);
          
          // Reset camera and controls to focus on model
          controls.target.set(0, 0, 0);
          controls.update();
          
          status.value = 'Model loaded successfully';
          console.log('Model loaded', object);
        },
        // onProgress callback
        (xhr) => {
          const loadingPercentage = Math.round((xhr.loaded / xhr.total) * 100);
          status.value = `Loading object: ${loadingPercentage}%`;
        },
        // onError callback
        (err) => {
          error.value = `Error loading OBJ: ${err.message || 'Unknown error'}`;
          console.error('Error loading OBJ:', err);
        }
      );
    },
    // onProgress callback
    (xhr) => {
      if (xhr.lengthComputable) {
        const loadingPercentage = Math.round((xhr.loaded / xhr.total) * 100);
        status.value = `Loading materials: ${loadingPercentage}%`;
      }
    },
    // onError callback
    (err) => {
      error.value = `Error loading MTL: ${err.message || 'Unknown error'}`;
      console.error('Error loading MTL:', err);
    }
  );
}

function toggleWireframe() {
  wireframe.value = !wireframe.value;
  
  if (model) {
    model.traverse(child => {
      if (child.isMesh) {
        if (wireframe.value) {
          // Create wireframe material
          child.material = new THREE.MeshBasicMaterial({
            color: 0x000000,
            wireframe: true
          });
        } else {
          // Restore original material
          child.material = child.userData.originalMaterial;
        }
      }
    });
  }
}

function toggleGrid() {
  showGrid.value = !showGrid.value;
  if (gridHelper) gridHelper.visible = showGrid.value;
  if (axesHelper) axesHelper.visible = showGrid.value;
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