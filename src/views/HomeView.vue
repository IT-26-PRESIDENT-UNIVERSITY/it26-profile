<script setup lang="ts">
import { RouterLink } from 'vue-router'
import { currentLang, translations } from '../store/langStore'
import Hero3D from '../components/Hero3D.vue'

// Interactive 3D Card Tilt Effect
const onCardMove = (e: MouseEvent) => {
  const el = e.currentTarget as HTMLElement
  const rect = el.getBoundingClientRect()
  const x = e.clientX - rect.left
  const y = e.clientY - rect.top
  const centerX = rect.width / 2
  const centerY = rect.height / 2
  const rotateX = ((y - centerY) / centerY) * -10
  const rotateY = ((x - centerX) / centerX) * 10
  el.style.transform = `perspective(900px) rotateX(${rotateX.toFixed(2)}deg) rotateY(${rotateY.toFixed(2)}deg) translateY(-6px) scale3d(1.02, 1.02, 1.02)`
}

const onCardLeave = (e: MouseEvent) => {
  const el = e.currentTarget as HTMLElement
  el.style.transform = 'perspective(900px) rotateX(0deg) rotateY(0deg) translateY(0px) scale3d(1, 1, 1)'
}
</script>

<template>
  <div class="bg-white">
    <!-- Hero Section with Interactive Three.js 3D Background -->
    <div class="relative bg-pres-dark text-white overflow-hidden min-h-[580px] flex items-center justify-center">
      <!-- Background Image with Overlay -->
      <div class="absolute inset-0">
        <img class="w-full h-full object-cover blur-[2px] scale-105 opacity-40" src="/gedung-baru.png" alt="President University Building" />
        <div class="absolute inset-0 bg-gradient-to-b from-pres-dark/80 via-pres-dark/60 to-pres-dark/95"></div>
      </div>

      <!-- Three.js 3D Canvas Canvas Layer -->
      <Hero3D />

      <!-- Hero Content (above 3D Canvas) -->
      <div class="relative z-10 max-w-7xl mx-auto py-24 px-4 sm:py-32 sm:px-6 lg:px-8 flex flex-col items-center text-center pointer-events-auto">
        <div class="inline-flex items-center gap-2 px-3.5 py-1.5 rounded-full bg-blue-500/10 border border-blue-400/30 text-xs font-semibold tracking-wide text-blue-300 uppercase mb-6 backdrop-blur-md">
          <span class="w-2 h-2 rounded-full bg-cyan-400 animate-pulse"></span>
          IT Batch 2026 • 3D Interactive
        </div>

        <h1 class="text-4xl font-extrabold tracking-tight sm:text-5xl lg:text-6xl text-white drop-shadow-md">
          {{ translations[currentLang].heroTitle }}
        </h1>
        <p class="mt-6 text-xl max-w-3xl text-gray-100 font-medium leading-relaxed drop-shadow-sm">
          {{ translations[currentLang].heroSubtitle }}
        </p>
        <p class="mt-4 text-base sm:text-lg max-w-2xl text-gray-300">
          {{ translations[currentLang].heroDesc }}
        </p>
        
        <div class="mt-10 flex flex-wrap justify-center gap-4">
          <RouterLink to="/directory" class="inline-flex items-center px-6 py-3 border border-transparent text-base font-medium rounded-lg shadow-lg text-white bg-pres-blue hover:bg-blue-800 transition-all transform hover:-translate-y-0.5 hover:shadow-cyan-500/25">
            {{ translations[currentLang].btnMeet }}
            <svg class="ml-2 -mr-1 w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7l5 5m0 0l-5 5m5-5H6" />
            </svg>
          </RouterLink>
          <RouterLink to="/projects" class="inline-flex items-center px-6 py-3 border border-white/60 text-base font-medium rounded-lg text-white bg-white/10 backdrop-blur-md hover:bg-white hover:text-pres-dark transition-all transform hover:-translate-y-0.5">
            {{ translations[currentLang].btnView }}
          </RouterLink>
        </div>
      </div>
    </div>

    <!-- Core Values / Highlights with 3D Tilt Cards -->
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
          <!-- 3D Card 1 -->
          <div class="pt-6">
            <div 
              @mousemove="onCardMove"
              @mouseleave="onCardLeave"
              class="flow-root bg-white rounded-2xl p-8 h-full shadow-lg hover:shadow-2xl border border-gray-100 transition-all duration-150 will-change-transform cursor-pointer group"
            >
              <div class="-mt-12">
                <div>
                  <span class="inline-flex items-center justify-center p-4 bg-gradient-to-br from-pres-blue to-blue-600 rounded-xl shadow-xl group-hover:scale-110 transition-transform duration-300">
                    <svg class="h-7 w-7 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 20l4-16m4 4l4 4-4 4M6 16l-4-4 4-4" />
                    </svg>
                  </span>
                </div>
                <h3 class="mt-8 text-xl font-bold text-gray-900 tracking-tight group-hover:text-pres-blue transition-colors">{{ translations[currentLang].card1Title }}</h3>
                <p class="mt-4 text-base text-gray-600 leading-relaxed">
                  {{ translations[currentLang].card1Desc }}
                </p>
              </div>
            </div>
          </div>

          <!-- 3D Card 2 -->
          <div class="pt-6">
            <div 
              @mousemove="onCardMove"
              @mouseleave="onCardLeave"
              class="flow-root bg-white rounded-2xl p-8 h-full shadow-lg hover:shadow-2xl border border-gray-100 transition-all duration-150 will-change-transform cursor-pointer group"
            >
              <div class="-mt-12">
                <div>
                  <span class="inline-flex items-center justify-center p-4 bg-gradient-to-br from-pres-blue to-blue-600 rounded-xl shadow-xl group-hover:scale-110 transition-transform duration-300">
                    <svg class="h-7 w-7 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z" />
                    </svg>
                  </span>
                </div>
                <h3 class="mt-8 text-xl font-bold text-gray-900 tracking-tight group-hover:text-pres-blue transition-colors">{{ translations[currentLang].card2Title }}</h3>
                <p class="mt-4 text-base text-gray-600 leading-relaxed">
                  {{ translations[currentLang].card2Desc }}
                </p>
              </div>
            </div>
          </div>

          <!-- 3D Card 3 -->
          <div class="pt-6">
            <div 
              @mousemove="onCardMove"
              @mouseleave="onCardLeave"
              class="flow-root bg-white rounded-2xl p-8 h-full shadow-lg hover:shadow-2xl border border-gray-100 transition-all duration-150 will-change-transform cursor-pointer group"
            >
              <div class="-mt-12">
                <div>
                  <span class="inline-flex items-center justify-center p-4 bg-gradient-to-br from-pres-blue to-blue-600 rounded-xl shadow-xl group-hover:scale-110 transition-transform duration-300">
                    <svg class="h-7 w-7 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z" />
                    </svg>
                  </span>
                </div>
                <h3 class="mt-8 text-xl font-bold text-gray-900 tracking-tight group-hover:text-pres-blue transition-colors">{{ translations[currentLang].card3Title }}</h3>
                <p class="mt-4 text-base text-gray-600 leading-relaxed">
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
