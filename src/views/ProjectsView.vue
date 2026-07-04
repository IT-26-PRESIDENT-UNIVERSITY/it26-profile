<script setup lang="ts">
import { currentLang, translations } from '../store/langStore'
// Frontend Developer (Project Section): zhel
// Silakan bangun komponen tampilan daftar project angkatan dan integrasi datanya di sini.

// const projects = ref([
//   {
//     "id": "project-01",
//     "title": "PresUniv Student Hub",
//     "category": "Web Application",
//     "description": "Platform portal akademik terintegrasi untuk mahasiswa IT President University untuk berbagi catatan kuliah, modul praktikum, dan forum diskusi.",
//     "tech_stack": ["React.js", "Node.js", "Express", "MongoDB"],
//     "image_url": "https://images.unsplash.com/photo-1551288049-bebda4e38f71?auto=format&fit=crop&w=600&q=80",
//     "github_link": "https://github.com/nama-org-github-kamu/presuniv-student-hub",
//     "live_demo": "https://studenthub.presuniv.ac.id",
//     "year": "2026",
//     "team": [
//       "Aditya Pratama", "Siti Nurhaliza"
//     ]
//   }
// ]);

import ProjectCard from '../components/ProjectCard.vue'
import { ref, onMounted } from 'vue'
import { supabase } from '../lib/supabase.ts'

let projects = ref(null)

const fetchPublishedProjects = async () => {
  try {
    const { data, error } = await supabase
      .rpc('get_projects_by_status', { p_status: 'published' })

    if (error) throw error
    
    projects.value = data
    console.log(projects.value)

    console.log("Data project yang udah di-acc admin:", data)
  } catch (error) {
    console.error("Gagal ambil data project:", error)
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
        Explore the projects we have made throughout our IT studies and careers.
      </p>
      <div class="mt-8 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <ProjectCard 
        class="mx-auto"
        v-for="project in projects" 
        :key="project['id']"
        :id="project['id']"
        :title="project['title']"
        :category="project['status'].toUpperCase()"
        :description="project['description']"
        :tech_stack="project['tech_stack']"
        :image_url="project['thumbnail_url']"
        :github_link="project['project_url']"
        :live_demo="project['project_url']"
        :year="project['created_at'].slice(0, 4)"
        :team="[project['team_name']]"
      />
      </div>
    </div>
  </div>
</template>
