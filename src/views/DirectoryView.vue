<script setup lang="ts">
import { ref, computed, onMounted, onUnmounted } from 'vue'
import studentsData from '../data/dataMahasiswa.json'
import { currentLang, translations } from '../store/langStore'

interface Project {
  project_name: string
  description: string
  tech_stack: string[]
  repository_url: string
}

interface Student {
  nim: string
  name: string
  major: string
  batch: number
  specialization: string
  skills: string[]
  github_username: string
  projects: Project[]
  email: string
}

const students = ref<Student[]>(studentsData as Student[])
const searchQuery = ref('')
const selectedStudent = ref<Student | null>(null)

const filteredStudents = computed(() => {
  const query = searchQuery.value.toLowerCase().trim()
  if (!query) return students.value

  return students.value.filter(student =>
    student.name?.toLowerCase().includes(query) ||
    student.nim?.includes(query) ||
    student.major?.toLowerCase().includes(query) ||
    student.specialization?.toLowerCase().includes(query) ||
    (student.skills && student.skills.some(skill => skill.toLowerCase().includes(query)))
  )
})

const openModal = (student: Student) => {
  selectedStudent.value = student
  document.body.style.overflow = 'hidden'
}

const closeModal = () => {
  selectedStudent.value = null
  document.body.style.overflow = ''
}

const handleKeydown = (event: KeyboardEvent) => {
  if (event.key === 'Escape' && selectedStudent.value) {
    closeModal()
  }
}

onMounted(() => {
  document.addEventListener('keydown', handleKeydown)
})

onUnmounted(() => {
  document.removeEventListener('keydown', handleKeydown)
  document.body.style.overflow = ''
})
</script>

<template>
  <div>
    <div class="py-12 px-4 sm:px-6 lg:px-8 max-w-7xl mx-auto">
    <div class="text-center mb-12">
      <h1 class="text-4xl font-extrabold text-gray-900 tracking-tight sm:text-5xl">{{ translations[currentLang].dirTitle }}</h1>
      <p class="mt-4 max-w-2xl text-xl text-gray-500 mx-auto">
        {{ translations[currentLang].dirSubtitle }}
      </p>
    </div>

    <div class="max-w-md mx-auto mb-12">
      <div class="rounded-md shadow-sm">
        <input v-model="searchQuery" type="text" :placeholder="translations[currentLang].dirSearchPlaceholder"
          class="w-full px-4 py-3 rounded-lg border border-gray-300 focus:ring-2 focus:ring-pres-blue focus:border-pres-blue shadow-sm transition ease-in-out duration-150 text-gray-900 outline-none" />
      </div>
    </div>

    <div v-if="filteredStudents.length > 0" class="grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-3">
      <div v-for="student in filteredStudents" :key="student.nim"
        @click="openModal(student)"
        class="bg-white overflow-hidden shadow rounded-lg border border-gray-200 hover:shadow-xl hover:-translate-y-1 transition-all duration-300 flex flex-col justify-between cursor-pointer group">
        <div class="p-6">
          <div class="flex items-center justify-between border-b border-gray-100 pb-4 mb-4">
            <div>
              <h3 class="text-lg font-bold text-gray-900 capitalize group-hover:text-pres-blue transition-colors">{{ student.name }}</h3>
              <p class="text-sm text-gray-500 font-mono">NIM: {{ student.nim }}</p>
            </div>
            <span
              class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-blue-100 text-pres-blue">
              Batch {{ student.batch }}
            </span>
          </div>

          <div class="space-y-2 text-sm text-gray-600 mb-4">
            <p v-if="student.specialization">
              <span class="font-semibold text-gray-700">Specialization:</span> {{ student.specialization }}
            </p>
          </div>

          <div v-if="student.skills && student.skills.length > 0">
            <span class="block text-xs font-semibold text-gray-500 uppercase tracking-wider mb-2">Skills:</span>
            <div class="flex flex-wrap gap-1.5">
              <span v-for="skill in student.skills" :key="skill"
                class="inline-flex items-center px-2 py-0.5 rounded text-xs font-medium bg-gray-100 text-gray-800 border border-gray-200">
                {{ skill }}
              </span>
            </div>
          </div>
        </div>

        <div class="bg-gray-50 px-6 py-4 border-t border-gray-100 flex items-center justify-between">
          <a v-if="student.github_username" :href="`https://github.com/${student.github_username}`" target="_blank" rel="noopener noreferrer"
            @click.stop
            class="inline-flex items-center text-sm font-medium text-pres-blue hover:text-blue-800 transition-colors duration-150">
            <svg class="w-5 h-5 mr-2 text-gray-700" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
              <path fill-rule="evenodd"
                d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.095.069-.095 1.005.074 1.531 1.034 1.531 1.034.892 1.529 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z"
                clip-rule="evenodd" />
            </svg>
            <span>{{ student.github_username }}</span>
          </a>
          <span v-else class="text-sm text-gray-400 italic">No GitHub provided</span>
          <span class="text-xs text-pres-blue font-medium opacity-0 group-hover:opacity-100 transition-opacity">View Details →</span>
        </div>
      </div>
    </div>

    <div v-else class="text-center py-12">
      <p class="text-lg text-gray-500">No students found matching your search.</p>
    </div>
  </div>

  <Transition name="backdrop">
    <div
      v-if="selectedStudent"
      class="fixed inset-0 z-[100] bg-black/60 backdrop-blur-sm"
      @click="closeModal"
    ></div>
  </Transition>

  <Transition name="modal">
    <div
      v-if="selectedStudent"
      class="fixed inset-0 z-[110] flex items-center justify-center p-4"
      @click.self="closeModal"
    >
      <div class="bg-white rounded-2xl shadow-2xl w-full max-w-2xl max-h-[85vh] overflow-y-auto relative">

        <div class="sticky top-0 bg-pres-dark text-white px-6 py-5 rounded-t-2xl z-10">
          <button
            @click="closeModal"
            class="absolute top-4 right-4 w-9 h-9 flex items-center justify-center rounded-full bg-white/10 hover:bg-white/20 transition-colors"
            aria-label="Close modal"
          >
            <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
          <div class="flex items-center gap-4 pr-10">
            <div class="w-14 h-14 rounded-full bg-white/20 flex items-center justify-center text-xl font-bold uppercase shrink-0">
              {{ selectedStudent.name?.charAt(0) }}
            </div>
            <div>
              <h2 class="text-xl sm:text-2xl font-bold capitalize leading-tight">{{ selectedStudent.name }}</h2>
              <div class="flex items-center gap-3 mt-1 text-sm text-white/70">
                <span class="font-mono">{{ selectedStudent.nim }}</span>
                <span class="w-1 h-1 rounded-full bg-white/40"></span>
                <span>Batch {{ selectedStudent.batch }}</span>
              </div>
            </div>
          </div>
        </div>

        <div class="p-6 space-y-6">

          <div>
            <h3 class="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-3">Biography</h3>
            <p class="text-sm text-gray-700 leading-relaxed">
              {{ selectedStudent.name }} is a <strong>{{ selectedStudent.major }}</strong> student at President University, 
              Batch {{ selectedStudent.batch }}. 
              <span v-if="selectedStudent.specialization">
                Specializing in <strong>{{ selectedStudent.specialization }}</strong>.
              </span>
              <span v-if="selectedStudent.skills && selectedStudent.skills.length > 0">
                Skilled in {{ selectedStudent.skills.join(', ') }}.
              </span>
            </p>
          </div>

          <hr class="border-gray-100" />

          <div v-if="selectedStudent.specialization">
            <h3 class="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-2">Specialization</h3>
            <span class="inline-flex items-center px-3 py-1.5 rounded-lg text-sm font-semibold bg-pres-blue/10 text-pres-blue border border-pres-blue/20">
              {{ selectedStudent.specialization }}
            </span>
          </div>

          <div v-if="selectedStudent.skills && selectedStudent.skills.length > 0">
            <h3 class="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-3">Skills</h3>
            <div class="flex flex-wrap gap-2">
              <span v-for="skill in selectedStudent.skills" :key="skill"
                class="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium bg-gray-100 text-gray-800 border border-gray-200 hover:bg-gray-200 transition-colors">
                {{ skill }}
              </span>
            </div>
          </div>

          <hr class="border-gray-100" />

          <div>
            <h3 class="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-3">Social Media</h3>
            <div class="space-y-2.5">
              <a v-if="selectedStudent.github_username && selectedStudent.github_username !== 'username_github'"
                :href="`https://github.com/${selectedStudent.github_username}`"
                target="_blank"
                rel="noopener noreferrer"
                class="flex items-center gap-3 px-4 py-3 rounded-xl bg-gray-50 hover:bg-gray-100 transition-colors group"
              >
                <svg class="w-5 h-5 text-gray-600" fill="currentColor" viewBox="0 0 24 24">
                  <path fill-rule="evenodd" d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.095.069-.095 1.005.074 1.531 1.034 1.531 1.034.892 1.529 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z" clip-rule="evenodd" />
                </svg>
                <div>
                  <span class="text-sm font-medium text-gray-800 group-hover:text-pres-blue transition-colors">GitHub</span>
                  <span class="text-xs text-gray-500 ml-2">{{ selectedStudent.github_username }}</span>
                </div>
                <svg class="w-4 h-4 text-gray-400 ml-auto" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                </svg>
              </a>
              <div v-else class="flex items-center gap-3 px-4 py-3 rounded-xl bg-gray-50 text-gray-400">
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
                  <path fill-rule="evenodd" d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.095.069-.095 1.005.074 1.531 1.034 1.531 1.034.892 1.529 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z" clip-rule="evenodd" />
                </svg>
                <span class="text-sm italic">GitHub not provided</span>
              </div>

              <div class="flex items-center gap-3 px-4 py-3 rounded-xl bg-gray-50 text-gray-400">
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z" />
                </svg>
                <span class="text-sm italic">LinkedIn not provided</span>
              </div>

              <div class="flex items-center gap-3 px-4 py-3 rounded-xl bg-gray-50 text-gray-400">
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
                  <path fill-rule="evenodd" d="M12.315 2c2.43 0 2.784.013 3.808.06 1.064.049 1.791.218 2.427.465a4.902 4.902 0 011.772 1.153 4.902 4.902 0 011.153 1.772c.247.636.416 1.363.465 2.427.048 1.067.06 1.407.06 4.123v.08c0 2.643-.012 2.987-.06 4.043-.049 1.064-.218 1.791-.465 2.427a4.902 4.902 0 01-1.153 1.772 4.902 4.902 0 01-1.772 1.153c-.636.247-1.363.416-2.427.465-1.067.048-1.407.06-4.123.06h-.08c-2.643 0-2.987-.012-4.043-.06-1.064-.049-1.791-.218-2.427-.465a4.902 4.902 0 01-1.772-1.153 4.902 4.902 0 01-1.153-1.772c-.247-.636-.416-1.363-.465-2.427-.047-1.024-.06-1.379-.06-3.808v-.63c0-2.43.013-2.784.06-3.808.049-1.064.218-1.791.465-2.427a4.902 4.902 0 011.153-1.772A4.902 4.902 0 015.45 2.525c.636-.247 1.363-.416 2.427-.465C8.901 2.013 9.256 2 11.685 2h.63zm-.081 1.802h-.468c-2.456 0-2.784.011-3.807.058-.975.045-1.504.207-1.857.344-.467.182-.8.398-1.15.748-.35.35-.566.683-.748 1.15-.137.353-.3.882-.344 1.857-.047 1.023-.058 1.351-.058 3.807v.468c0 2.456.011 2.784.058 3.807.045.975.207 1.504.344 1.857.182.466.399.8.748 1.15.35.35.683.566 1.15.748.353.137.882.3 1.857.344 1.054.048 1.37.058 4.041.058h.08c2.597 0 2.917-.01 3.96-.058.976-.045 1.505-.207 1.858-.344.466-.182.8-.398 1.15-.748.35-.35.566-.683.748-1.15.137-.353.3-.882.344-1.857.048-1.055.058-1.37.058-4.041v-.08c0-2.597-.01-2.917-.058-3.96-.045-.976-.207-1.505-.344-1.858a3.097 3.097 0 00-.748-1.15 3.098 3.098 0 00-1.15-.748c-.353-.137-.882-.3-1.857-.344-1.023-.047-1.351-.058-3.807-.058zM12 6.865a5.135 5.135 0 110 10.27 5.135 5.135 0 010-10.27zm0 1.802a3.333 3.333 0 100 6.666 3.333 3.333 0 000-6.666zm5.338-3.205a1.2 1.2 0 110 2.4 1.2 1.2 0 010-2.4z" clip-rule="evenodd" />
                </svg>
                <span class="text-sm italic">Instagram not provided</span>
              </div>
            </div>
          </div>

          <div v-if="selectedStudent.projects && selectedStudent.projects.length > 0">
            <hr class="border-gray-100" />
            <h3 class="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-3 mt-6">Projects</h3>
            <div class="space-y-3">
              <div v-for="(project, index) in selectedStudent.projects" :key="index"
                class="p-4 rounded-xl bg-gray-50 border border-gray-100">
                <h4 class="text-sm font-semibold text-gray-900">{{ project.project_name }}</h4>
                <p class="text-xs text-gray-600 mt-1">{{ project.description }}</p>
                <div class="flex flex-wrap gap-1.5 mt-2" v-if="project.tech_stack && project.tech_stack.length > 0">
                  <span v-for="tech in project.tech_stack" :key="tech"
                    class="inline-flex items-center px-2 py-0.5 rounded text-xs font-medium bg-pres-blue/10 text-pres-blue">
                    {{ tech }}
                  </span>
                </div>
                <a v-if="project.repository_url && project.repository_url !== 'https://github.com/...'"
                  :href="project.repository_url"
                  target="_blank"
                  rel="noopener noreferrer"
                  class="inline-flex items-center gap-1 text-xs text-pres-blue hover:text-blue-800 font-medium mt-2 transition-colors"
                >
                  View Repository
                  <svg class="w-3 h-3" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </a>
              </div>
            </div>
          </div>

        </div>
      </div>
    </div>
  </Transition>
  </div>
</template>
