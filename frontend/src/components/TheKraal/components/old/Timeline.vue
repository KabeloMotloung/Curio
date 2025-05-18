<script setup lang="ts">
import { computed } from 'vue';

// Define the structure of a timeline item
interface TimelineItem {
  date: string;
  title: string;
  description: string;
  icon?: string; // Optional icon name or URL
  color?: string; // Optional custom color
}

interface TimelineProps {
  items: TimelineItem[];
  lineColor?: string;
  defaultIconColor?: string;
  alternating?: boolean; // Whether to alternate items left and right
  vertical?: boolean; // Vertical or horizontal layout
}

// Define props with defaults
const props = withDefaults(defineProps<TimelineProps>(), {
  lineColor: 'bg-blue-500',
  defaultIconColor: 'bg-blue-500',
  alternating: true,
  vertical: true
});

// Computed property to determine if we have any items with icons
const hasIcons = computed(() => props.items.some(item => item.icon));

// Function to determine item position in alternating layout
const getItemPosition = (index: number) => {
  if (!props.alternating) return 'right';
  return index % 2 === 0 ? 'left' : 'right';
};

// Function to get the color for an item (use custom or default)
const getItemColor = (item: TimelineItem) => {
  return item.color || props.defaultIconColor;
};
</script>

<template>
  <!-- Vertical Timeline -->
  <div v-if="vertical" class="relative mx-auto w-full max-w-3xl py-8">
    <!-- Timeline Line -->
    <div :class="[lineColor, 'absolute left-1/2 top-0 h-full w-1 -translate-x-1/2']"></div>

    <!-- Timeline Items -->
    <div v-for="(item, index) in items" :key="index" class="relative mb-12">
      <!-- Container with alternating layout -->
      <div class="flex items-center" :class="[
        getItemPosition(index) === 'left' ? 'flex-row' : 'flex-row-reverse',
      ]">
        <!-- Date and Content Container -->
        <div class="w-1/2 px-4">
          <!-- Date Block -->
          <div class="mb-2 text-sm font-bold"
               :class="getItemPosition(index) === 'left' ? 'text-right' : 'text-left'">
            {{ item.date }}
          </div>

          <!-- Content Block -->
          <div class="rounded-lg bg-white p-4 shadow-lg"
               :class="getItemPosition(index) === 'left' ? 'ml-auto mr-2' : 'ml-2 mr-auto'">
            <h3 class="text-lg font-bold">{{ item.title }}</h3>
            <p class="text-gray-700">{{ item.description }}</p>
          </div>
        </div>

        <!-- Dot/Icon Indicator -->
        <div class="z-10 flex h-10 w-10 shrink-0 items-center justify-center rounded-full border-4 border-white"
             :class="[getItemColor(item)]">
          <span v-if="item.icon" class="text-white text-lg">{{ item.icon }}</span>
        </div>

        <div class="w-1/2"></div> <!-- Spacer for opposite side -->
      </div>
    </div>
  </div>

  <!-- Horizontal Timeline -->
  <div v-else class="relative w-full py-8 overflow-x-auto">
    <!-- Timeline Line -->
    <div :class="[lineColor, 'absolute top-1/2 left-0 h-1 w-full -translate-y-1/2']"></div>

    <!-- Timeline Items Container -->
    <div class="flex min-w-max px-4">
      <!-- Timeline Items -->
      <div v-for="(item, index) in items" :key="index"
           class="relative mx-4 flex flex-col items-center"
           :style="{ minWidth: '200px' }">

        <!-- Dot/Icon Indicator -->
        <div class="z-10 flex h-10 w-10 shrink-0 items-center justify-center rounded-full border-4 border-white mb-4"
             :class="[getItemColor(item)]">
          <span v-if="item.icon" class="text-white text-lg">{{ item.icon }}</span>
        </div>

        <!-- Content Block -->
        <div class="rounded-lg bg-white p-4 shadow-lg w-full">
          <div class="mb-2 text-sm font-bold">{{ item.date }}</div>
          <h3 class="text-lg font-bold">{{ item.title }}</h3>
          <p class="text-gray-700">{{ item.description }}</p>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
</style>