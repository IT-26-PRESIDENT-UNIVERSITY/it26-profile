<script setup lang="ts">
import { RouterLink } from 'vue-router'
import { currentLang, translations } from '../store/langStore'
import InteractiveStage3D from '../components/InteractiveStage3D.vue'
</script>

<template>
  <div class="bg-white">
    <!-- Hero Section with Editorial Split 3D Stage -->
    <div class="relative bg-pres-dark text-white overflow-hidden min-h-[640px] flex items-center">
      <!-- Real Campus Building Background -->
      <div class="absolute inset-0">
        <img class="w-full h-full object-cover blur-[1.5px] scale-105 opacity-40" src="/gedung-baru.png" alt="President University Building" />
        <div class="absolute inset-0 bg-gradient-to-r from-pres-dark via-pres-dark/90 to-pres-dark/80"></div>
      </div>

      <!-- Split Container -->
      <div class="relative max-w-7xl mx-auto py-16 sm:py-24 px-4 sm:px-6 lg:px-8 w-full z-10">
        <div class="grid grid-cols-1 lg:grid-cols-12 gap-12 items-center">
          
          <!-- Left Column: Typography & Action (7 cols) -->
          <div class="lg:col-span-7 flex flex-col items-center lg:items-start text-center lg:text-left">
            <div class="inline-flex items-center gap-2 px-3.5 py-1.5 rounded-full bg-blue-500/15 border border-blue-400/30 text-xs font-semibold tracking-wider text-blue-300 uppercase mb-6 backdrop-blur-md">
              <span class="w-2 h-2 rounded-full bg-cyan-400 animate-pulse"></span>
              President University • IT Batch 2026
            </div>

            <h1 class="text-4xl sm:text-5xl lg:text-6xl font-extrabold tracking-tight text-white leading-tight">
              {{ translations[currentLang].heroTitle }}
            </h1>

            <p class="mt-5 text-xl max-w-2xl text-blue-100 font-medium leading-relaxed">
              {{ translations[currentLang].heroSubtitle }}
            </p>

            <p class="mt-3 text-base text-gray-300 max-w-xl">
              {{ translations[currentLang].heroDesc }}
            </p>

            <!-- Buttons -->
            <div class="mt-8 flex flex-wrap gap-4 justify-center lg:justify-start">
              <RouterLink to="/directory" class="inline-flex items-center px-6 py-3 border border-transparent text-base font-semibold rounded-xl shadow-lg text-white bg-pres-blue hover:bg-blue-800 transition-all transform hover:-translate-y-0.5">
                {{ translations[currentLang].btnMeet }}
                <svg class="ml-2 w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7l5 5m0 0l-5 5m5-5H6" />
                </svg>
              </RouterLink>
              <RouterLink to="/projects" class="inline-flex items-center px-6 py-3 border border-white/40 text-base font-semibold rounded-xl text-white bg-white/10 backdrop-blur-md hover:bg-white hover:text-pres-dark transition-all transform hover:-translate-y-0.5">
                {{ translations[currentLang].btnView }}
              </RouterLink>
            </div>

            <!-- Authentic Micro Stats -->
            <div class="mt-10 pt-8 border-t border-white/15 grid grid-cols-3 gap-4 sm:gap-8 w-full max-w-lg">
              <div>
                <div class="text-2xl sm:text-3xl font-extrabold text-white">88</div>
                <div class="text-xs text-gray-400 mt-1 font-medium">Mahasiswa Aktif</div>
              </div>
              <div>
                <div class="text-2xl sm:text-3xl font-extrabold text-white">Unggul</div>
                <div class="text-xs text-gray-400 mt-1 font-medium">LAMINFOKOM & IABEE</div>
              </div>
              <div>
                <div class="text-2xl sm:text-3xl font-extrabold text-white">5</div>
                <div class="text-xs text-gray-400 mt-1 font-medium">Konsentrasi IT</div>
              </div>
            </div>
          </div>

          <!-- Right Column: Interactive 3D Card & Terminal Stage (5 cols) -->
          <div class="lg:col-span-5 w-full flex justify-center">
            <InteractiveStage3D />
          </div>

        </div>
      </div>
    </div>

    <!-- Core Values / Highlights -->
    <div class="py-16 sm:py-24 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="text-center">
        <h2 class="text-base font-semibold text-pres-blue tracking-wide uppercase">{{ translations[currentLang].visionLabel }}</h2>
        <p class="mt-1 text-3xl font-extrabold text-gray-900 sm:text-4xl sm:tracking-tight">
          {{ translations[currentLang].visionTitle }}
        </p>
        <p class="max-w-xl mt-5 mx-auto text-xl text-gray-500">
          {{ translations[currentLang].visionDesc }}
        </p>
      </div>

      <div class="mt-16">
        <div class="grid grid-cols-1 gap-8 sm:grid-cols-2 lg:grid-cols-3">
          <div class="pt-6">
            <div class="flow-root bg-gray-50 rounded-xl px-6 pb-8 h-full shadow-sm hover:shadow-md transition-shadow border border-gray-100">
              <div class="-mt-6">
                <div>
                  <span class="inline-flex items-center justify-center p-3 bg-pres-blue rounded-lg shadow-lg">
                    <svg class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 20l4-16m4 4l4 4-4 4M6 16l-4-4 4-4" />
                    </svg>
                  </span>
                </div>
                <h3 class="mt-8 text-lg font-medium text-gray-900 tracking-tight">{{ translations[currentLang].card1Title }}</h3>
                <p class="mt-5 text-base text-gray-500">
                  {{ translations[currentLang].card1Desc }}
                </p>
              </div>
            </div>
          </div>

          <div class="pt-6">
            <div class="flow-root bg-gray-50 rounded-xl px-6 pb-8 h-full shadow-sm hover:shadow-md transition-shadow border border-gray-100">
              <div class="-mt-6">
                <div>
                  <span class="inline-flex items-center justify-center p-3 bg-pres-blue rounded-lg shadow-lg">
                    <svg class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z" />
                    </svg>
                  </span>
                </div>
                <h3 class="mt-8 text-lg font-medium text-gray-900 tracking-tight">{{ translations[currentLang].card2Title }}</h3>
                <p class="mt-5 text-base text-gray-500">
                  {{ translations[currentLang].card2Desc }}
                </p>
              </div>
            </div>
          </div>

          <div class="pt-6">
            <div class="flow-root bg-gray-50 rounded-xl px-6 pb-8 h-full shadow-sm hover:shadow-md transition-shadow border border-gray-100">
              <div class="-mt-6">
                <div>
                  <span class="inline-flex items-center justify-center p-3 bg-pres-blue rounded-lg shadow-lg">
                    <svg class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z" />
                    </svg>
                  </span>
                </div>
                <h3 class="mt-8 text-lg font-medium text-gray-900 tracking-tight">{{ translations[currentLang].card3Title }}</h3>
                <p class="mt-5 text-base text-gray-500">
                  {{ translations[currentLang].card3Desc }}
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
