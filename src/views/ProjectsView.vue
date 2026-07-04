<script setup lang="ts">
import { currentLang, translations } from '../store/langStore'
import { ref, onMounted } from 'vue'
import { supabase } from '../lib/supabase'

const projects = ref([])

const fetchPublishedProjects = async () => {
  try {
    const { data, error } = await supabase
      .rpc('get_projects_by_status', { p_status: 'published' })

    if (error) throw error

    projects.value = data || []
    console.log("Data project yang udah di-acc admin:", projects.value)

  } catch (error: any) { 
    console.error("Gagal ambil data project:", error.message)
  }
}

onMounted(() => {
  fetchPublishedProjects()
})
</script>

<template>
  <div class="py-12 px-4 sm:px-6 lg:px-8 max-w-7xl mx-auto bg-gray-50">
    <div class="text-center">
      <h1 class="text-4xl font-extrabold text-gray-900 tracking-tight sm:text-5xl">{{ translations[currentLang].projTitle }}</h1>
      <p class="mt-4 max-w-2xl text-xl text-gray-500 mx-auto">
        
      </p>
    </div>
    <!-- KODE UI CARD -->
  </div>
</template>
