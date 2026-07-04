<template>
  <div 
    class="max-w-sm bg-white rounded-2xl border border-gray-100 shadow-md overflow-hidden hover:shadow-xl transition-shadow duration-300 flex flex-col"
    :id="`project-${id}`"
  >
    <div class="relative w-full h-48 bg-gray-200">
      <img 
        v-if="image_url" 
        :src="image_url" 
        :alt="title" 
        class="w-full h-full object-cover" 
      />
      <div v-else class="w-full h-full flex items-center justify-center text-gray-400">
        <svg class="w-10 h-10" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg>
      </div>
    </div>

    <div class="p-5 flex flex-col flex-grow">
      
      <div class="flex justify-between items-center mb-2">
        <span class="bg-indigo-100 text-indigo-800 text-xs font-semibold px-2.5 py-0.5 rounded">
          {{ category }}
        </span>
        <span class="text-xs font-medium text-gray-500 bg-gray-100 px-2 py-1 rounded-full">
          {{ year }}
        </span>
      </div>

      <h3 class="text-xl font-bold tracking-tight text-gray-900 mb-2">
        {{ title }}
      </h3>
      <p class="text-gray-600 text-sm mb-4 line-clamp-3">
        {{ description }}
      </p>

      <div class="mb-4">
        <h4 class="text-xs font-semibold text-gray-400 uppercase tracking-wider mb-2">Tech Stack</h4>
        <div class="flex flex-wrap gap-2">
          <span 
            v-for="(tech, index) in tech_stack" 
            :key="index"
            class="px-2 py-1 bg-gray-100 border border-gray-200 text-gray-600 text-xs rounded-md"
          >
            {{ tech }}
          </span>
        </div>
      </div>

      <div class="mb-5 mt-auto">
        <h4 class="text-xs font-semibold text-gray-400 uppercase tracking-wider mb-2">Dev Team</h4>
        <div class="text-sm text-gray-700 flex flex-wrap gap-x-3 gap-y-1">
          <span v-for="(member, index) in team" :key="index" class="flex items-center mx-auto">
             <span class="w-1.5 h-1.5 rounded-full bg-indigo-400 mr-1.5"></span> {{ member }}
          </span>
        </div>
      </div>

      <div class="flex items-center gap-3 pt-4 border-t border-gray-100">
        <a 
          v-if="github_link" 
          :href="github_link" 
          target="_blank" 
          rel="noopener noreferrer"
          class="flex-1 inline-flex justify-center items-center px-4 py-2 text-sm font-medium text-gray-900 bg-white border border-gray-200 rounded-lg hover:bg-gray-100 hover:text-indigo-600 transition-colors focus:ring-4 focus:outline-none focus:ring-gray-200"
        >
          GitHub
        </a>
        <a 
          v-if="live_demo" 
          :href="live_demo" 
          target="_blank" 
          rel="noopener noreferrer"
          class="flex-1 inline-flex justify-center items-center px-4 py-2 text-sm font-medium text-white bg-indigo-600 rounded-lg hover:bg-indigo-700 transition-colors focus:ring-4 focus:outline-none focus:ring-indigo-300"
        >
          Live Demo
          <svg class="w-3.5 h-3.5 ml-2" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 10">
            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 5h12m0 0L9 1m4 4L9 9"/>
          </svg>
        </a>
      </div>

    </div>
  </div>
</template>

<script setup>
defineProps({
  id: {
    type: [String, Number],
    required: true
  },
  title: {
    type: String,
    required: true
  },
  category: {
    type: String,
    default: 'Uncategorized'
  },
  description: {
    type: String,
    required: true
  },
  tech_stack: {
    type: Array,
    default: () => []
  },
  image_url: {
    type: String,
    default: ''
  },
  github_link: {
    type: String,
    default: ''
  },
  live_demo: {
    type: String,
    default: ''
  },
  year: {
    type: [String, Number],
    required: true
  },
  team: {
    type: Array,
    default: () => []
  }
})
</script>